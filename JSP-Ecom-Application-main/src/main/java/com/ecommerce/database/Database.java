package com.ecommerce.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {
    public Connection getConnection() {
        Connection conn;
        try {
            String dbUrl = System.getenv("DB_URL");
            String dbUser = System.getenv("DB_USER");
            String dbPassword = System.getenv("DB_PASSWORD");

            if (dbUrl == null || dbUrl.trim().isEmpty()) {
                dbUrl = "jdbc:mysql://localhost:3306/jsp-servlet-ecommerce-website";
            }
            if (dbUser == null) {
                dbUser = "root";
            }
            if (dbPassword == null) {
                dbPassword = "root";
            }

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            return conn;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) {
        System.out.println(new Database().getConnection());
    }
}
