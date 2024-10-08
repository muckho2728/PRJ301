package models_DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models_DTO.Supplier;

public class SupplierDAO {

    private String jdbcURL;
    private String username;
    private String password;
    private Connection connection;

    public SupplierDAO() {
    }

    public SupplierDAO(String jdbcURL, String username, String password) {
        this.jdbcURL = jdbcURL;
        this.username = username;
        this.password = password;
    }

    private void connect() throws Exception {
        if (connection == null || connection.isClosed()) {
            Class.forName("org.hsqldb.jdbcDriver");
            connection = DriverManager.getConnection(jdbcURL, username, password);
        }
    }

    private void disconnect() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }

    public List<Supplier> getSuppliers() throws SQLException, Exception {
        List<Supplier> suppliers = new ArrayList<>();
        String sql = "SELECT * FROM SUPPLIERS";
        try {
            connect();
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String supplierID = resultSet.getString("supplierID");
                String supplierName = resultSet.getString("supplierName");
                String contactName = resultSet.getString("contactName");
                String phoneNumber = resultSet.getString("phoneNumber");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");

                Supplier supplier = new Supplier(supplierID, supplierName, contactName, phoneNumber, email, address);
                suppliers.add(supplier);
            }
            resultSet.close();
            statement.close();

        } finally {
            disconnect();
        }
        return suppliers;
    }

    public void addSupplier(Supplier supplier) throws SQLException, Exception {
        String sql = "INSERT INTO SUPPLIERS (supplierID, supplierName, contactName, phoneNumber, email, address) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            connect();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, supplier.getSupplierID());
            statement.setString(2, supplier.getSupplierName());
            statement.setString(3, supplier.getContactName());
            statement.setString(4, supplier.getPhoneNumber());
            statement.setString(5, supplier.getEmail());
            statement.setString(6, supplier.getAddress());

            statement.executeUpdate();
            statement.close();

        } finally {
            disconnect();
        }
    }

    public void updateSupplier(Supplier supplier) throws SQLException, Exception {
        String sql = "UPDATE SUPPLIERS SET supplierName = ?, contactName = ?, phoneNumber = ?, email = ?, address = ? WHERE supplierID = ?";
        try {
            connect();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, supplier.getSupplierName());
            statement.setString(2, supplier.getContactName());
            statement.setString(3, supplier.getPhoneNumber());
            statement.setString(4, supplier.getEmail());
            statement.setString(5, supplier.getAddress());
            statement.setString(6, supplier.getSupplierID());

            statement.executeUpdate();
            statement.close();

        } finally {
            disconnect();
        }
    }

    public void deleteSupplier(String supplierID) throws SQLException, Exception {
        String sql = "DELETE FROM SUPPLIERS WHERE supplierID = ?";
        try {
            connect();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, supplierID);

            statement.executeUpdate();
            statement.close();

        } finally {
            disconnect();
        }
    }
}