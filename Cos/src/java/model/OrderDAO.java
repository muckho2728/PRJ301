package model;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class OrderDAO extends DBUtils {

    public boolean create(OrderDTO order) {
        String query = "INSERT INTO tblOrders (orderID, userID, orderDate, totalAmount) VALUES (?, ?, ?, ?)";
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, order.getOrderID());
            statement.setString(2, order.getUserID());
            statement.setDate(3, order.getOrderDate());
            statement.setDouble(4, order.getTotalAmount());

            int rowsAffected = statement.executeUpdate();

            // Return true if one or more rows were affected
            return rowsAffected > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public OrderDTO findById(String orderID) {
        String query = "SELECT * FROM tblOrders WHERE orderID = ?";
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, orderID);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new OrderDTO(
                        resultSet.getString("orderID"),
                        resultSet.getString("userID"),
                        resultSet.getDate("orderDate"),
                        resultSet.getDouble("totalAmount")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<OrderDTO> findAll() {
        List<OrderDTO> orders = new ArrayList<>();
        String query = "SELECT * FROM tblOrders";
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                OrderDTO order = new OrderDTO(
                        resultSet.getString("orderID"),
                        resultSet.getString("userID"),
                        resultSet.getDate("orderDate"),
                        resultSet.getDouble("totalAmount")
                );
                orders.add(order);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return orders;
    }

    public void update(OrderDTO order) {
        String query = "UPDATE tblOrders SET userID = ?, orderDate = ?, totalAmount = ? WHERE orderID = ?";
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, order.getUserID());
            statement.setDate(2, order.getOrderDate());
            statement.setDouble(3, order.getTotalAmount());
            statement.setString(4, order.getOrderID());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void delete(String orderID) {
        String query = "DELETE FROM tblOrders WHERE orderID = ?";
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, orderID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        OrderDAO orderDAO = new OrderDAO();

        System.out.println("Testing OrderDAO...");

        // Create a new order
        LocalDate localDate = LocalDate.now();
        java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);

        OrderDTO newOrder = new OrderDTO("ORD001", "user1", sqlDate, new Double("1500.00"));
        orderDAO.create(newOrder);

        // Find order by ID
        OrderDTO foundOrder = orderDAO.findById("ORD001");
        System.out.println("Found Order: " + foundOrder.getOrderID() + ", Total Amount: " + foundOrder.getTotalAmount());

        // Update order
        foundOrder.setTotalAmount(new Double("2000.00"));
        orderDAO.update(foundOrder);
        System.out.println("Updated Order Total Amount: " + orderDAO.findById("ORD001").getTotalAmount());

        // Find all orders
        System.out.println("All Orders:");
        orderDAO.findAll().forEach(order -> {
            System.out.println(order.getOrderID() + ", " + order.getTotalAmount());
        });

//        // Delete order
//        orderDAO.delete("ORD001");
//        System.out.println("Deleted order ORD001");
    }
}
