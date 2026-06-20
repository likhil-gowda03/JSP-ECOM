package com.ecommerce.dao;

import com.ecommerce.database.Database;
import com.ecommerce.entity.Account;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Base64;

public class AccountDao {
    // Method to get blob image from database.
    private String getBase64Image(Blob blob) throws SQLException, IOException {
        try (InputStream inputStream = blob.getBinaryStream();
             ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[4096];
            int bytesRead = -1;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                byteArrayOutputStream.write(buffer, 0, bytesRead);
            }
            byte[] imageBytes = byteArrayOutputStream.toByteArray();

            return Base64.getEncoder().encodeToString(imageBytes);
        }
    }

    // Method to execute get account query.
    private Account queryGetAccount(String query) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = new Database().getConnection();
                 PreparedStatement ps = conn.prepareStatement(query);
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Account account = new Account();
                    account.setId(rs.getInt(1));
                    account.setUsername(rs.getString(2));
                    account.setPassword(rs.getString(3));
                    account.setIsSeller(rs.getInt(4));
                    account.setIsAdmin(rs.getInt(5));
                    account.setAddress(rs.getString(7));
                    account.setFirstName(rs.getString(8));
                    account.setLastName(rs.getString(9));
                    account.setEmail(rs.getString(10));
                    account.setPhone(rs.getString(11));

                    // Get profile image from database.
                    if (rs.getBlob(6) == null) {
                        account.setBase64Image(null);
                    } else {
                        account.setBase64Image(getBase64Image(rs.getBlob(6)));
                    }

                    return account;
                }
            }
        } catch (ClassNotFoundException | SQLException | IOException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    // Method to get account by id.
    public Account getAccount(int accountId) {
        String query = "SELECT * FROM account WHERE account_id = " + accountId;
        return queryGetAccount(query);
    }

    // Method to get login account from database.
    public Account checkLoginAccount(String username, String password) {
        String query = "SELECT * FROM account WHERE account_name = '" + username + "' AND account_password = '" + password + "'";
        return queryGetAccount(query);
    }

    // Method to check is username exist or not.
    public boolean checkUsernameExists(String username) {
        String query = "SELECT * FROM account WHERE account_name = '" + username + "'";
        return (queryGetAccount(query) != null);
    }

    // Method to create an account.
    public void createAccount(String username, String password, InputStream image) {
        String query = "INSERT INTO account (account_name, account_password, account_image, account_is_seller, account_is_admin) VALUES (?, ?, ?, 0, 0)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = new Database().getConnection();
                 PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setString(1, username);
                ps.setString(2, password);
                ps.setBinaryStream(3, image);
                ps.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    // Method to edit profile information.
    public void editProfileInformation(int accountId, String firstName, String lastName, String address, String email, String phone, InputStream image) {
        String query = "UPDATE account SET " +
                "account_first_name = ?, " +
                "account_last_name = ?, " +
                "account_address = ?, " +
                "account_email = ?, " +
                "account_phone = ?, " +
                "account_image = ?" +
                "WHERE account_id = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = new Database().getConnection();
                 PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setString(1, firstName);
                ps.setString(2, lastName);
                ps.setString(3, address);
                ps.setString(4, email);
                ps.setString(5, phone);
                ps.setBinaryStream(6, image);
                ps.setInt(7, accountId);
                ps.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Update profile catch: " + e.getMessage());
        }
    }

    // Method to update profile information.
    public void updateProfileInformation(int accountId, String firstName, String lastName, String address, String email, String phone) {
        String query = "UPDATE account SET " +
                "account_first_name = ?, " +
                "account_last_name = ?, " +
                "account_address = ?, " +
                "account_email = ?, " +
                "account_phone = ? " +
                "WHERE account_id = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = new Database().getConnection();
                 PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setString(1, firstName);
                ps.setString(2, lastName);
                ps.setString(3, address);
                ps.setString(4, email);
                ps.setString(5, phone);
                ps.setInt(6, accountId);
                ps.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Update profile catch: " + e.getMessage());
        }
    }
}
