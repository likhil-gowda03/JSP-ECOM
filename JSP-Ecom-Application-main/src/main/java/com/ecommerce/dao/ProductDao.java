package com.ecommerce.dao;

import com.ecommerce.database.Database;
import com.ecommerce.entity.Account;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.Product;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class ProductDao {
    private static final String ONLINE_PRODUCTS_FIRST = " ORDER BY (product_image IS NOT NULL) DESC, product_id ASC";



    // Call DAO class to access other entities' database.
    AccountDao accountDao = new AccountDao();
    CategoryDao categoryDao = new CategoryDao();

    public static void main(String[] args) {
        ProductDao productDao = new ProductDao();
        List<Product> list = productDao.getSellerProducts(1);
        for (Product product : list) {
            System.out.println(product.toString());
        }
    }

    // Method to get blob image from database.
    private String getBase64Image(Blob blob) throws SQLException, IOException {
        if (blob == null) {
            return null;
        }
        try (InputStream inputStream = blob.getBinaryStream();
             ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[4096];
            int bytesRead;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                byteArrayOutputStream.write(buffer, 0, bytesRead);
            }
            byte[] imageBytes = byteArrayOutputStream.toByteArray();

            return Base64.getEncoder().encodeToString(imageBytes);
        }
    }

    private boolean hasColumn(ResultSet resultSet, String columnName) throws SQLException {
        ResultSetMetaData metaData = resultSet.getMetaData();
        for (int i = 1; i <= metaData.getColumnCount(); i++) {
            if (columnName.equalsIgnoreCase(metaData.getColumnLabel(i))) {
                return true;
            }
        }
        return false;
    }

    private String getOptionalString(ResultSet resultSet, String columnName) throws SQLException {
        if (!hasColumn(resultSet, columnName)) {
            return null;
        }
        return resultSet.getString(columnName);
    }

    // Method to execute query to get list products.
    private List<Product> getListProductQuery(String query) {
        List<Product> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = new Database().getConnection();
                 PreparedStatement ps = conn.prepareStatement(query);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("product_id");
                    String name = rs.getString("product_name");
                    double price = rs.getDouble("product_price");
                    String description = rs.getString("product_description");
                    Category category = categoryDao.getCategory(rs.getInt("fk_category_id"));
                    Account account = accountDao.getAccount(rs.getInt("fk_account_id"));
                    boolean isDelete = rs.getBoolean("product_is_deleted");
                    int amount = rs.getInt("product_amount");

                    // Get base64 image to display.
                    Blob blob = rs.getBlob("product_image");
                    String base64Image = getBase64Image(blob);
                    String imageUrl = getOptionalString(rs, "product_image_url");

                    list.add(new Product(id, name, base64Image, imageUrl, price, description, category, account, isDelete, amount));
                }
            }
        } catch (SQLException | ClassNotFoundException | IOException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // Method to get all products from database.
    public List<Product> getAllProducts() {
        String query = "SELECT * FROM product WHERE product_is_deleted = false" + ONLINE_PRODUCTS_FIRST;
        return getListProductQuery(query);
    }

    // Method to get a product by its id from database.
    public Product getProduct(int productId) {
        Product product = new Product();
        String query = "SELECT * FROM product WHERE product_id = " + productId;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = new Database().getConnection();
                 PreparedStatement ps = conn.prepareStatement(query);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    product.setId(rs.getInt("product_id"));
                    product.setName(rs.getString("product_name"));
                    product.setBase64Image(getBase64Image(rs.getBlob("product_image")));
                    product.setImageUrl(getOptionalString(rs, "product_image_url"));
                    product.setPrice(rs.getDouble("product_price"));
                    product.setDescription(rs.getString("product_description"));
                    product.setCategory(categoryDao.getCategory(rs.getInt("fk_category_id")));
                    product.setAccount(accountDao.getAccount(rs.getInt("fk_account_id")));
                    product.setDeleted(rs.getBoolean("product_is_deleted"));
                    product.setAmount(rs.getInt("product_amount"));
                }
            }
        } catch (SQLException | ClassNotFoundException | IOException e) {
            System.out.println(e.getMessage());
        }
        return product;
    }

    // Method to get a categories by its id from database.
    public List<Product> getAllCategoryProducts(int category_id) {
        String query = "SELECT * FROM product WHERE fk_category_id = " + category_id + " AND product_is_deleted = false" + ONLINE_PRODUCTS_FIRST;
        return getListProductQuery(query);
    }

    // Method to search a product by a keyword.
    public List<Product> searchProduct(String keyword) {
        String query = "SELECT * FROM product WHERE product_name like '%" + keyword + "%' AND product_is_deleted = false" + ONLINE_PRODUCTS_FIRST;
        return getListProductQuery(query);
    }

    // Method to get all products of a seller.
    public List<Product> getSellerProducts(int sellerId) {
        String query = "SELECT * FROM product WHERE fk_account_id = " + sellerId + ONLINE_PRODUCTS_FIRST;
        return getListProductQuery(query);
    }

    // Method to remove a product from database by its id.
    public void removeProduct(Product product) {
        // Get id of the product.
        int productId = product.getId();

        String query = "UPDATE product SET product_is_deleted = true WHERE product_id = " + productId;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = new Database().getConnection();
                 PreparedStatement ps = conn.prepareStatement(query)) {
                ps.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    // Method to add product to database.
    public void addProduct(String productName, InputStream productImage, double productPrice, String productDescription, int productCategory, int sellerId, int productAmount) {
        String query = "INSERT INTO product (product_name, product_image, product_price, product_description, fk_category_id, fk_account_id, product_is_deleted, product_amount) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = new Database().getConnection();
                 PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setString(1, productName);
                ps.setBinaryStream(2, productImage);
                ps.setDouble(3, productPrice);
                ps.setString(4, productDescription);
                ps.setInt(5, productCategory);
                ps.setInt(6, sellerId);
                ps.setBoolean(7, false);
                ps.setInt(8, productAmount);
                ps.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    // Method to edit product in database.
    public void editProduct(int productId, String productName, InputStream productImage, double productPrice, String productDescription, int productCategory, int productAmount) {
        String query = "UPDATE product SET product_name = ?, product_image = ?, product_price = ?, product_description = ?, fk_category_id = ?, product_amount = ? WHERE product_id = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = new Database().getConnection();
                 PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setString(1, productName);
                ps.setBinaryStream(2, productImage);
                ps.setDouble(3, productPrice);
                ps.setString(4, productDescription);
                ps.setInt(5, productCategory);
                ps.setInt(6, productAmount);
                ps.setInt(7, productId);
                ps.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    // Method to get 12 products to display on each page.
    public List<Product> get12ProductsOfPage(int index) {
        String query = "SELECT * FROM product WHERE product_is_deleted = false" + ONLINE_PRODUCTS_FIRST + " LIMIT " + ((index - 1) * 12) + ", 12";
        return getListProductQuery(query);
    }

    // Method to get total products in database.
    public int getTotalNumberOfProducts() {
        int totalProduct = 0;
        String query = "SELECT COUNT(*) FROM product WHERE product_is_deleted = false";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = new Database().getConnection();
                 PreparedStatement ps = conn.prepareStatement(query);
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    totalProduct = rs.getInt(1);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
        return totalProduct;
    }

    // Method to decrease new amount of products.
    public void decreaseProductAmount(int productId, int productAmount) {
        String query = "UPDATE product SET product_amount = product_amount - ? WHERE product_id = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = new Database().getConnection();
                 PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setInt(1, productAmount);
                ps.setInt(2, productId);
                ps.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
