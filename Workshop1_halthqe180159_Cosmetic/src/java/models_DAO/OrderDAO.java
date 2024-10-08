/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models_DAO;

/**
 *
 * @author Admin
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    private final Connection connection; // Establish a connection to the database

    public OrderDAO(Connection connection) {
        this.connection = connection;
    }

//    public OrderDAO() {
//    }

    public OrderDAO() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    

    /**
     * Creates a new order detail entry in the database.
     *
     * @param orderID The order ID associated with this order detail.
     * @param productID The product ID of the item included in the order.
     * @param quantity The quantity of the product ordered.
     * @param price The price per unit of the product.
     * @throws SQLException If an error occurs while interacting with the database.
     */
    public void createOrderDetail(String orderID, String productID, int quantity, double price) throws SQLException {
        String sql = "INSERT INTO tblOrderDetails (orderID, productID, quantity, price) VALUES (?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, orderID);
            statement.setString(2, productID);
            statement.setInt(3, quantity);
            statement.setDouble(4, price);
            statement.executeUpdate();
        }
    }

    /**
     * Retrieves a list of order details associated with a specific order ID.
     *
     * @param orderID The order ID for which details are needed.
     * @return A list of OrderDetail objects containing the retrieved data.
     * @throws SQLException If an error occurs while interacting with the database.
     */
    public List<OrderDetail> getOrderDetails(String orderID) throws SQLException {
        String sql = "SELECT * FROM tblOrderDetails WHERE orderID = ?";
        List<OrderDetail> orderDetails = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, orderID);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int orderDetailID = resultSet.getInt("orderDetailID");
                String productID = resultSet.getString("productID");
                int quantity = resultSet.getInt("quantity");
                double price = resultSet.getDouble("price");
                orderDetails.add(new OrderDetail(orderDetailID, orderID, productID, quantity, price));
            }
        }

        return orderDetails;
    }
}

class OrderDetail {
    private final int orderDetailID;
    private final String orderID;
    private final String productID;
    private final int quantity;
    private final double price;

    public OrderDetail(int orderDetailID, String orderID, String productID, int quantity, double price) {
        this.orderDetailID = orderDetailID;
        this.orderID = orderID;
        this.productID = productID;
        this.quantity = quantity;
        this.price = price;
    }



    // Getters for accessing OrderDetail properties (optional)


    public int getOrderDetailID() {
        return orderDetailID;
    }

    public String getOrderID() {
        return orderID;
    }

    public String getProductID() {
        return productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getPrice() {
        return price;
    }
    
}