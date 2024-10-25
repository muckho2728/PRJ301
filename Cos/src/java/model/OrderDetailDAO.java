package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class OrderDetailDAO extends DBUtils {

    public void create(OrderDetailDTO orderDetail) {
        String query = "INSERT INTO tblOrderDetails (orderID, productID, quantity, price) VALUES (?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, orderDetail.getOrderID());
            statement.setString(2, orderDetail.getProductID());
            statement.setInt(3, orderDetail.getQuantity());
            statement.setDouble(4, orderDetail.getPrice());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public OrderDetailDTO findById(int orderDetailID) {
        String query = "SELECT * FROM tblOrderDetails WHERE orderDetailID = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, orderDetailID);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new OrderDetailDTO(
                        resultSet.getInt("orderDetailID"),
                        resultSet.getString("orderID"),
                        resultSet.getString("productID"),
                        resultSet.getInt("quantity"),
                        resultSet.getDouble("price")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<OrderDetailDTO> findAll() {
        List<OrderDetailDTO> orderDetails = new ArrayList<>();
        String query = "SELECT * FROM tblOrderDetails";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                OrderDetailDTO orderDetail = new OrderDetailDTO(
                        resultSet.getInt("orderDetailID"),
                        resultSet.getString("orderID"),
                        resultSet.getString("productID"),
                        resultSet.getInt("quantity"),
                        resultSet.getDouble("price")
                );
                orderDetails.add(orderDetail);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return orderDetails;
    }

    public void update(OrderDetailDTO orderDetail) {
        String query = "UPDATE tblOrderDetails SET orderID = ?, productID = ?, quantity = ?, price = ? WHERE orderDetailID = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, orderDetail.getOrderID());
            statement.setString(2, orderDetail.getProductID());
            statement.setInt(3, orderDetail.getQuantity());
            statement.setDouble(4, orderDetail.getPrice());
            statement.setInt(5, orderDetail.getOrderDetailID());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void delete(int orderDetailID) {
        String query = "DELETE FROM tblOrderDetails WHERE orderDetailID = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, orderDetailID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        // Test OrderDetailDAO
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();

        System.out.println("\nTesting OrderDetailDAO...");

        // Create a new order detail
        OrderDetailDTO newOrderDetail = new OrderDetailDTO(0, "ORD001", "P005", 2, new Double("500.00"));
        orderDetailDAO.create(newOrderDetail);

//        // Find order detail by ID
//        OrderDetailDTO foundOrderDetail = orderDetailDAO.findById(1);  // Assuming auto-increment starts at 1
//        System.out.println("Found Order Detail: ProductID " + foundOrderDetail.getProductID() + ", Quantity: " + foundOrderDetail.getQuantity());
//
//        // Update order detail
//        foundOrderDetail.setQuantity(3);
//        orderDetailDAO.update(foundOrderDetail);
//        System.out.println("Updated Order Detail Quantity: " + orderDetailDAO.findById(1).getQuantity());
//
        // Find all order details
        System.out.println("All Order Details:");
        orderDetailDAO.findAll().forEach(orderDetail -> {
            System.out.println("OrderDetailID: " + orderDetail.getOrderDetailID() + ", ProductID: " + orderDetail.getProductID());
        });

        // Delete order detail
//        orderDetailDAO.delete(1);
//        System.out.println("Deleted order detail with ID 1");
    }
}
