package model;

import utils.DBUtils;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SupplierDAO extends DBUtils {
    
    // Create a new supplier
    public boolean create(SupplierDTO supplier) {
        String query = "INSERT INTO tblSuppliers (supplierID, supplierName, contactName, phoneNumber, email, address) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setString(1, supplier.getSupplierID());
            statement.setString(2, supplier.getSupplierName());
            statement.setString(3, supplier.getContactName());
            statement.setString(4, supplier.getPhoneNumber());
            statement.setString(5, supplier.getEmail());
            statement.setString(6, supplier.getAddress());
            
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    // Update a supplier
    public boolean update(SupplierDTO supplier) {
        String query = "UPDATE tblSuppliers SET supplierName = ?, contactName = ?, phoneNumber = ?, email = ?, address = ? WHERE supplierID = ?";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setString(1, supplier.getSupplierName());
            statement.setString(2, supplier.getContactName());
            statement.setString(3, supplier.getPhoneNumber());
            statement.setString(4, supplier.getEmail());
            statement.setString(5, supplier.getAddress());
            statement.setString(6, supplier.getSupplierID());
            
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    // Find a supplier by ID
    public SupplierDTO findById(String supplierID) {
        String query = "SELECT * FROM tblSuppliers WHERE supplierID = ?";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setString(1, supplierID);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                return new SupplierDTO(
                    resultSet.getString("supplierID"),
                    resultSet.getString("supplierName"),
                    resultSet.getString("contactName"),
                    resultSet.getString("phoneNumber"),
                    resultSet.getString("email"),
                    resultSet.getString("address")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    // Delete a supplier
    public boolean delete(String supplierID) {
        String query = "DELETE FROM tblSuppliers WHERE supplierID = ?";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setString(1, supplierID);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    // Find all suppliers
    public List<SupplierDTO> findAll() {
        List<SupplierDTO> suppliers = new ArrayList<>();
        String query = "SELECT * FROM tblSuppliers";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                SupplierDTO supplier = new SupplierDTO(
                    resultSet.getString("supplierID"),
                    resultSet.getString("supplierName"),
                    resultSet.getString("contactName"),
                    resultSet.getString("phoneNumber"),
                    resultSet.getString("email"),
                    resultSet.getString("address")
                );
                suppliers.add(supplier);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return suppliers;
    }
    
    public static void main(String[] args) {
        // Test SupplierDAO
        SupplierDAO supplierDAO = new SupplierDAO();
        
        System.out.println("Testing SupplierDAO...");

        // Create a new supplier
        SupplierDTO newSupplier = new SupplierDTO("SUP004", "New Supplier", "New Contact", "1234567890", "new@supplier.com", "123 New Street");
        supplierDAO.create(newSupplier);
        
        // Find supplier by ID
        SupplierDTO foundSupplier = supplierDAO.findById("SUP004");
        System.out.println("Found Supplier: " + foundSupplier.getSupplierName() + ", " + foundSupplier.getEmail());
        
        // Update supplier
        foundSupplier.setSupplierName("Updated Supplier");
        supplierDAO.update(foundSupplier);
        System.out.println("Updated Supplier Name: " + supplierDAO.findById("SUP004").getSupplierName());
        
        // Find all suppliers
        System.out.println("All Suppliers:");
        supplierDAO.findAll().forEach(supplier -> {
            System.out.println(supplier.getSupplierID() + ", " + supplier.getSupplierName());
        });
        
        // Delete supplier
        supplierDAO.delete("SUP004");
        System.out.println("Deleted supplier SUP004");
    }
}
