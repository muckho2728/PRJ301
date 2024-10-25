/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class DBUtils {
    public static Connection getConnection() {
        try {
            String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName;
            if (instance == null || instance.trim().isEmpty()) {
                url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
            }
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(url, userID, password);
        } catch (SQLException ex) {
            System.out.println("Connection error! " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.out.println("Connection error! " + ex.getMessage());
        }
        return null;
    }
    private final static String serverName = "localhost";
    private final static String dbName = "CosmeticEcommerce";
    private final static String portNumber = "1433";
    private final static String instance = "";//LEAVE THIS ONE EMPTY IF YOUR SQL IS A SINGLE INSTANCE
    private final static String userID = "sa";
    private final static String password = "12345";
    public static void main(String[] args) {
        Connection connection = DBUtils.getConnection();

        if (connection != null) {
            System.out.println("Kết nối thành công đến cơ sở dữ liệu!");
            try {
                // Đóng kết nối sau khi sử dụng
                connection.close();
                System.out.println("Đã đóng kết nối.");
            } catch (SQLException ex) {
                System.out.println("Đóng kết nối không thành công: " + ex.getMessage());
            }
        } else {
            System.out.println("Kết nối không thành công.");
        }
    }
}
