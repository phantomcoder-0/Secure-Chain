package com.securechain.servlet;

import com.securechain.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.sql.*;
import java.time.LocalDateTime;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private String hashSHA256(String input) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hashed = md.digest(input.getBytes(StandardCharsets.UTF_8));
        StringBuilder sb = new StringBuilder();
        for (byte b : hashed) sb.append(String.format("%02x", b));
        return sb.toString();
    }

    private String getClientIP(HttpServletRequest request) {
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null || ip.isEmpty()) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("full_name").trim();
        String username = request.getParameter("username").trim();
        String email = request.getParameter("email").trim();
        String contactNumber = request.getParameter("contact_number").trim();
        String address = request.getParameter("address").trim();
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");
        String securityQuestion = request.getParameter("security_question");
        String securityAnswer = request.getParameter("security_answer").trim();
        String role = request.getParameter("role");

        if (fullName.isEmpty() || username.isEmpty() || email.isEmpty() || contactNumber.isEmpty() ||
            address.isEmpty() || password.isEmpty() || confirmPassword.isEmpty() ||
            securityQuestion == null || securityQuestion.isEmpty() || securityAnswer.isEmpty() ||
            role == null || role.isEmpty()) {

            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        if (password.length() < 6) {
            request.setAttribute("error", "Password must be at least 6 characters.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement checkStmt = conn.prepareStatement("SELECT user_id FROM user WHERE username = ? OR email = ?");
            checkStmt.setString(1, username);
            checkStmt.setString(2, email);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                request.setAttribute("error", "Username or Email already registered.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            String passwordHash = hashSHA256(password);
            String securityAnswerHash = hashSHA256(securityAnswer.toLowerCase());

            PreparedStatement insertStmt = conn.prepareStatement(
                    "INSERT INTO user (full_name, username, email, contact_number, address, password_hash, security_question, security_answer_hash, role, registration_time, registration_ip) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            insertStmt.setString(1, fullName);
            insertStmt.setString(2, username);
            insertStmt.setString(3, email);
            insertStmt.setString(4, contactNumber);
            insertStmt.setString(5, address);
            insertStmt.setString(6, passwordHash);
            insertStmt.setString(7, securityQuestion);
            insertStmt.setString(8, securityAnswerHash);
            insertStmt.setString(9, role);
            insertStmt.setTimestamp(10, Timestamp.valueOf(LocalDateTime.now()));
            insertStmt.setString(11, getClientIP(request));

            insertStmt.executeUpdate();

            request.setAttribute("message", "Registration successful! You may now log in.");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Server error: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
