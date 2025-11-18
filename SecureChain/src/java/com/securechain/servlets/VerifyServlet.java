// file: src/main/java/com/securechain/servlets/VerifyServlet.java
package com.securechain.servlets;

import com.securechain.util.HashUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/VerifyServlet")
@MultipartConfig
public class VerifyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Part filePart = request.getPart("verifyFile");
            if (filePart == null || filePart.getSize() == 0) {
                 request.setAttribute("verificationResult", "error");
                 request.setAttribute("verificationMessage", "Error: No file was selected for verification.");
                 request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                 return;
            }

            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            // 1. Calculate hash of the uploaded file for verification
            String calculatedHash;
            try (InputStream fileContent = filePart.getInputStream()) {
                calculatedHash = HashUtil.getSHA256Hash(fileContent);
            }

            // 2. Load stored hashes into a map
            Map<String, String> storedHashes = new HashMap<>();
            String hashFilePath = getServletContext().getRealPath("") + File.separator + "evidence_hashes.txt";
            File hashFile = new File(hashFilePath);
            if (hashFile.exists()) {
                try (BufferedReader reader = new BufferedReader(new FileReader(hashFile))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        String[] parts = line.split(":", 2);
                        if (parts.length == 2) {
                            storedHashes.put(parts[0].trim(), parts[1].trim());
                        }
                    }
                }
            }

            // 3. Compare and set result
            if (storedHashes.containsKey(fileName)) {
                String storedHash = storedHashes.get(fileName);
                if (storedHash.equals(calculatedHash)) {
                    request.setAttribute("verificationResult", "valid");
                    request.setAttribute("verificationMessage", "VERIFIED: The file '" + fileName + "' is authentic and has not been tampered with.");
                } else {
                    request.setAttribute("verificationResult", "invalid");
                    request.setAttribute("verificationMessage", "TAMPERED: The file '" + fileName + "' has been modified. The hash does not match the stored record.");
                }
            } else {
                request.setAttribute("verificationResult", "notfound");
                request.setAttribute("verificationMessage", "NOT FOUND: No record found for the file '" + fileName + "'. It has not been previously secured.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("verificationResult", "error");
            request.setAttribute("verificationMessage", "An unexpected error occurred: " + e.getMessage());
        }

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}