package model;

import utils.DBUtils;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DBUtils {

    // Create a new product
    public boolean create(ProductDTO product) {
        String query = "INSERT INTO tblProducts (productID, productName, description, price, quantity, category, supplierID) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setString(1, product.getProductID());
            statement.setString(2, product.getProductName());
            statement.setString(3, product.getDescription());
            statement.setDouble(4, product.getPrice());
            statement.setInt(5, product.getQuantity());
            statement.setString(6, product.getCategory());
            statement.setString(7, product.getSupplierID());
            
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    // Update a product
    public boolean update(ProductDTO product) {
        String query = "UPDATE tblProducts SET productName = ?, description = ?, price = ?, quantity = ?, category = ?, supplierID = ? WHERE productID = ?";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setString(1, product.getProductName());
            statement.setString(2, product.getDescription());
            statement.setDouble(3, product.getPrice());
            statement.setInt(4, product.getQuantity());
            statement.setString(5, product.getCategory());
            statement.setString(6, product.getSupplierID());
            statement.setString(7, product.getProductID());
            
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    // Find a product by ID
    public ProductDTO findById(String productID) {
        String query = "SELECT * FROM tblProducts WHERE productID = ?";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setString(1, productID);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                return new ProductDTO(
                    resultSet.getString("productID"),
                    resultSet.getString("productName"),
                    resultSet.getString("description"),
                    resultSet.getDouble("price"),
                    resultSet.getInt("quantity"),
                    resultSet.getString("category"),
                    resultSet.getString("supplierID")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    // Delete a product
    public boolean delete(String productID) {
        String query = "DELETE FROM tblProducts WHERE productID = ?";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setString(1, productID);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    // Find all products
    public List<ProductDTO> findAll() {
        List<ProductDTO> products = new ArrayList<>();
        String query = "SELECT * FROM tblProducts";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                ProductDTO product = new ProductDTO(
                    resultSet.getString("productID"),
                    resultSet.getString("productName"),
                    resultSet.getString("description"),
                    resultSet.getDouble("price"),
                    resultSet.getInt("quantity"),
                    resultSet.getString("category"),
                    resultSet.getString("supplierID")
                );
                products.add(product);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return products;
    }
    
    public static void main(String[] args) {
        // Test ProductDAO
        ProductDAO productDAO = new ProductDAO();

        System.out.println("\nTesting ProductDAO...");

        // Create a new product
        ProductDTO newProduct = new ProductDTO("P005", "New Product", "This is a new product", 100000, 50, "NewCategory", "SUP001");
        productDAO.create(newProduct);

        // Find product by ID
        ProductDTO foundProduct = productDAO.findById("P005");
        System.out.println("Found Product: " + foundProduct.getProductName() + ", " + foundProduct.getPrice());

        // Update product
        foundProduct.setProductName("Updated Product");
        productDAO.update(foundProduct);
        System.out.println("Updated Product Name: " + productDAO.findById("P005").getProductName());

        // Find all products
        System.out.println("All Products:");
        productDAO.findAll().forEach(product -> {
            System.out.println(product.getProductID() + ", " + product.getProductName());
        });

        // Delete product
//        productDAO.delete("P005");
//        System.out.println("Deleted product P005");
    
    }
}
