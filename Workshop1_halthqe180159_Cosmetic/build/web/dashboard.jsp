<%-- 
    Document   : dashboard
    Created on : Oct 8, 2024, 1:09:54 AM
    Author     : Admin
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="utils.DBUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard Page</title>
    </head>
    <body>
        <%
//            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("username") == null) {
                response.sendRedirect("login.jsp");
            }

            int userId = (int) session.getAttribute("userId");
            Connection conn = DBUtils.getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Reservations WHERE userId = ? AND status = 'Scheduled'");
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
        %>
        <h2>Dashboard</h2>
        <p>Welcome, <%= session.getAttribute("username")%></p>
        <a href="MainController?action=logout">Logout</a>

        <h3>Supplier Management</h3>
        <table border="1">
            <tr>
                <th>Date</th>
                <th>Time</th>
                <th>Table</th>
                <th>Status</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getDate("reservationDate")%></td>
                <td><%= rs.getTime("reservationTime")%></td>
                <td><%= rs.getInt("tableNumber")%></td>
                <td><%= rs.getString("status")%></td>
            </tr>
            <%
                }
                stmt.close();
                conn.close();
            %>
        </table>
        <Br/>
        <a href="createReservation.jsp">Create New Reservation</a><Br/>
        <Br/>
        <a href="viewReservations.jsp">View All Reservations</a><Br/>
        <Br/>
        <a href="reservationHistory.jsp">View Reservation History</a><Br/>

    </body>
</html>

