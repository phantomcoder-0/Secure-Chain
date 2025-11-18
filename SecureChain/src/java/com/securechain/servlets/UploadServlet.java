// file: src/main/java/com/securechain/servlets/UploadServlet.java
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

@WebServlet("/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {

    // A simple lock object for synchronizing file writes
    private static final Object fileLock = new Object();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Part filePart = request.getPart("evidenceFile");
            if (filePart == null || filePart.getSize() == 0) {
                request.setAttribute("uploadStatus", "Error: No file was selected for upload.");
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                return;
            }

            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            // 1. Save the file to the 'uploads' directory
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            File uploadedFile = new File(uploadPath + File.separator + fileName);
            try (InputStream fileContent = filePart.getInputStream();
                 OutputStream out = new FileOutputStream(uploadedFile)) {
                int read;
                final byte[] bytes = new byte[1024];
                while ((read = fileContent.read(bytes)) != -1) {
                    out.write(bytes, 0, read);
                }
            }

            // 2. Calculate the hash of the saved file
            String fileHash;
            try (InputStream is = new FileInputStream(uploadedFile)) {
                fileHash = HashUtil.getSHA256Hash(is);
            }

            // 3. Store the hash record in evidence_hashes.txt
            String hashFilePath = getServletContext().getRealPath("") + File.separator + "evidence_hashes.txt";
            synchronized (fileLock) {
                try (FileWriter fw = new FileWriter(hashFilePath, true); // Append mode
                     BufferedWriter bw = new BufferedWriter(fw);
                     PrintWriter out = new PrintWriter(bw)) {
                    out.println(fileName + ":" + fileHash);
                }
            }

            request.setAttribute("uploadStatus", "Success: File '" + fileName + "' uploaded and secured.");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("uploadStatus", "Error: " + e.getMessage());
        }

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}