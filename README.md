🛡️ SecureChain - Digital Evidence Preservation System

This project is a Java-based web application (using Servlets and JSP) designed for the secure upload, hashing, and verification of digital evidence. It ensures data integrity by generating and storing SHA-256 hashes for every file, providing a robust chain of custody.

The system also includes a complete user authentication module with secure password hashing (SHA-256).

🛠️ Technology Stack
1. Backend: Java Servlets, `java.security.MessageDigest` for hashing
2. Frontend: JavaServer Pages (JSP), HTML, CSS, JavaScript
3. Database: MySQL
4. Server: Apache Tomcat (or similar)
5. JDBC Driver: MySQL Connector/J

✨ Core Features
1. Secure User Registration:** New user accounts are created with SHA-256 hashed passwords.
2. User Login: Securely validates user credentials against the hashed passwords in the database.
3. Evidence Upload: Allows authenticated users to upload files. The system:
    1.  Saves the file to a secure `/uploads` directory.
    2.  Calculates the file's SHA-256 hash using `HashUtil.java`.
    3.  Stores the `filename:hash` pair in `evidence_hashes.txt` as a verification record.
  Evidence Verification: Allows a user to upload a file to check its integrity. The system:
    1.  Calculates the new file's SHA-256 hash.
    2.  Compares this hash to the one stored in `evidence_hashes.txt`.
    3.  Reports if the file is **VERIFIED** (hashes match), **TAMPERED** (hashes do not match), or **NOT FOUND**.

⚙️ How to Run
1.  Database Setup:
    * Ensure you have MySQL server running.
    * Create a new database named `securechaindb`.
    * Import the `securechaindb.sql` file to create the `user` table.
2.  Server Setup:
    * Deploy the project to an Apache Tomcat web server.
    * Download the **MySQL Connector/J** (`.jar`) and place it in your server's `lib` folder (e.g., `apache-tomcat/lib/`).
3.  Configuration:
    * Open `src/main/java/com/securechain/util/DBConnection.java`.
    * Update the `USER` and `PASSWORD` static variables to match your local MySQL credentials.
4.  Run:
    * Start your Tomcat server.
    * Access the application at `http://localhost:8080/YOUR_PROJECT_NAME/`.
