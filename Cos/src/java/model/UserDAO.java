/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends DBUtils {

    public List<UserDTO> listAllUsers() {
        List<UserDTO> users = new ArrayList<>();
        String query = "SELECT * FROM tblUsers";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                UserDTO user = new UserDTO(
                        resultSet.getString("userID"),
                        resultSet.getString("fullName"),
                        resultSet.getString("email"),
                        resultSet.getString("phoneNumber"),
                        resultSet.getString("roleID"),
                        resultSet.getString("password")
                );
                users.add(user);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return users;
    }

    public boolean createUser(UserDTO user) {
        String query = "INSERT INTO tblUsers (userID, fullName, email, phoneNumber, roleID, password) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, user.getUserID());
            statement.setString(2, user.getFullName());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPhoneNumber());
            statement.setString(5, user.getRoleID()); // default role as 'USR' for users
            statement.setString(6, user.getPassword());

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0; // returns true if user is successfully created
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public UserDTO login(String userID, String password) {
        String query = "SELECT * FROM tblUsers WHERE userID = ? AND password = ?";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, userID);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                // User found, return UserDTO object
                return new UserDTO(
                        resultSet.getString("userID"),
                        resultSet.getString("fullName"),
                        resultSet.getString("email"),
                        resultSet.getString("phoneNumber"),
                        resultSet.getString("roleID"),
                        resultSet.getString("password")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null; // returns null if user is not found or credentials are incorrect
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();

        // Test lấy danh sách tất cả User
        System.out.println("Danh sách tất cả User:");
        userDAO.listAllUsers().forEach(user -> {
            System.out.println(user.getUserID() + ", " + user.getFullName() + ", " + user.getEmail());
        });

        UserDTO newUser = new UserDTO("user3", "Alice Wonderland", "alice@example.com", "1234567890", "USR", "alicepass");
        if (userDAO.createUser(newUser)) {
            System.out.println("User registration successful.");
        } else {
            System.out.println("User registration failed.");
        }

        // Test user login
        String userID = "user3";
        String password = "alicepass";
        UserDTO loggedInUser = userDAO.login(userID, password);
        if (loggedInUser != null) {
            System.out.println("Login successful. Welcome, " + loggedInUser.getFullName() + "!");
        } else {
            System.out.println("Login failed. Incorrect userID or password.");
        }
    }
}
