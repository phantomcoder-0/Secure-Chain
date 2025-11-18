package com.securechain.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/securechaindb?useSSL=false&serverTimezone=UTC";
    private static final String USER = "midnight hacker";       // change as per your db user
    private static final String PASSWORD = "12345678";       // change as per your db password

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL 8+ driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws Exception {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
