/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models_DTO.Product;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class ProductDAO {
    public List<Product> getListProductByCategory(String Brand) throws Exception {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM tblProducts WHERE category like ?";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + Brand + "%");

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
//                    productID	VARCHAR(50)
//                    productName	NVARCHAR(200)
//                    description	NVARCHAR(1000)
//                    price	DECIMAL(18, 2)
//                    quantity	INT
//                    category	NVARCHAR(100)
//                    supplierID	VARCHAR(50)
                    String productID = rs.getString(1);
                    String productName = rs.getString(2);
                    String description = rs.getString(3);
                    double price = rs.getDouble(4);
                    int quantity = rs.getInt(5);
                    String category = rs.getString(6);
                    String supplierID = rs.getString(7);
                    list.add(new Product(productID, productName, description, price, quantity, category, supplierID));
                }
            }
        }
        return list;

    }

    public static void main(String[] args) throws Exception {
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getListProductByPrice(1.0, 5.0);
        for (Product productDTO : list) {
            System.out.println(productDTO);  
        }

    }

    public List<Product> getListProductByPrice(double fromPrice, double toPrice) throws Exception {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM tbltblProducts WHERE price BETWEEN ? AND ?";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setDouble(1, fromPrice);
            ps.setDouble(2, toPrice);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String productID = rs.getString(1);
                    String productName = rs.getString(2);
                    String description = rs.getString(3);
                    double price = rs.getDouble(4);
                    int quantity = rs.getInt(5);
                    String category = rs.getString(6);
                    String supplierID = rs.getString(7);
                    list.add(new Product(productID, productName, description, price, quantity, category, supplierID));
                }
            }
        }
        return list;

    }

    public boolean removeProduct(String productId) throws Exception {
        boolean isRemoved = false;
        String sql = "DELETE FROM tblItems WHERE id=?";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, productId);
            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                isRemoved = true;
            }
        }
        return isRemoved;
    }

    public boolean addProduct(Product product) throws Exception {
        boolean isAdded = false;
        String sql = "INSERT INTO tblItems(productID, productName, description, price, quantity, category, supplierID)"
                                 + " VALUES (?, ?, ?, ?, ?, ?, ? )";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
//                    String productID = rs.getString(1);
//                    String productName = rs.getString(2);
//                    String description = rs.getString(3);
//                    double price = rs.getDouble(4);
//                    int quantity = rs.getInt(5);
//                    String category = rs.getString(6);
//                    String supplierID = rs.getString(7);
            ps.setString(1, product.getProductID());
            ps.setString(2, product.getProductName());
            ps.setString(3, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getQuantity());
            ps.setString(5, product.getCategory());
            ps.setString(2, product.getSupplierID());
            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                isAdded = true;
            }
        }
        return isAdded;
    }

    public Product getProductById(String productId) throws Exception {
        Product product = null;
        String sql = "SELECT *  FROM tblProducts WHERE productID = ?";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String productID = rs.getString(1);
                    String productName = rs.getString(2);
                    String description = rs.getString(3);
                    double price = rs.getDouble(4);
                    int quantity = rs.getInt(5);
                    String category = rs.getString(6);
                    String supplierID = rs.getString(7);
                    product = new Product(productID, productName, description, price, quantity, category, supplierID);
                }
            }
        }
        return product;
    }

    public boolean update(Product product) throws SQLException {
        boolean checkUpdate = false;
        String sql = "UPDATE tblProducts SET productName=?, description=?, price=?, quantity=?, category=?, supplierID=? WHERE productID=?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, product.getProductID());
            ps.setString(2, product.getProductName());
            ps.setString(3, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getQuantity());
            ps.setString(5, product.getCategory());
            ps.setString(2, product.getSupplierID());

            checkUpdate = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return checkUpdate;
    }

    public List<Product> getAllProducts() throws Exception {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM tblProducts";

        try (Connection conn = DBUtils.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String productID = rs.getString(1);
                    String productName = rs.getString(2);
                    String description = rs.getString(3);
                    double price = rs.getDouble(4);
                    int quantity = rs.getInt(5);
                    String category = rs.getString(6);
                    String supplierID = rs.getString(7);
                    list.add(new Product(productID, productName, description, price, quantity, category, supplierID));
                }
            }
        }
        return list;
    }

}
