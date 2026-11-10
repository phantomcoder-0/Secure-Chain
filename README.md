# Secure-Chain

A Java web app that keeps digital evidence safe from tampering.

You upload a file once, and the app records its SHA-256 hash — a unique fingerprint of the file's contents. From then on, you can check that file any time. If it was edited or corrupted, the hash won't match and the app will tell you right away.

It works for any kind of digital evidence: photos, videos, documents, logs — anything that must stay exactly as it was collected.

## The problem it solves

Digital files are easy to edit. A screenshot, a recording or a document can be changed without leaving any visible mark. When that file is used as evidence, someone has to prove it is still the original. Hashes make that proof possible, and this app makes the hashing automatic.

## Features

- User sign-up and login, with passwords stored as SHA-256 hashes (never plain text)
- Secure evidence upload through the browser
- Automatic SHA-256 hashing of every uploaded file
- Quick verification of any file against its stored hash
- A clear result for every check: VERIFIED, TAMPERED, or NOT FOUND

## Tech stack

- Backend — Java Servlets
- Frontend — JSP, HTML, CSS, JavaScript
- Hashing — java.security.MessageDigest (SHA-256)
- Database — MySQL
- Server — Apache Tomcat

## Getting started

1. Database — start MySQL, create a database called securechaindb, and import the securechaindb.sql file from the Database folder.
2. Server — deploy the project to Apache Tomcat, and drop the MySQL Connector/J .jar into Tomcat's lib folder.
3. Credentials — open src/main/java/com/securechain/util/DBConnection.java and set the USER and PASSWORD values to your own MySQL login.
4. Run — start Tomcat, open the app in your browser, register an account, and log in.

## How verification works

1. When you upload a file, the app saves it in the uploads folder and writes its hash to evidence_hashes.txt as a filename:hash record.
2. Later, upload the same file again to check it.
3. The app hashes the new copy and compares it with the stored one:
   - Same hash → VERIFIED (the file is untouched)
   - Different hash → TAMPERED (the file has changed)
   - No record found → NOT FOUND

## Project layout

- Database/ — SQL script that creates the tables
- SecureChain/ — the web app itself (servlets, JSP pages, and the hashing utility)