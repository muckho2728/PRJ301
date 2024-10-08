<%-- 
    Document   : supplierList
    Created on : Oct 8, 2024, 1:05:10 PM
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dto.Supplier" %>
<html>
<head>
    <title>Supplier List</title>
</head>
<body>
    <h2>Supplier List</h2>

    <table border="1">
        <tr>
            <th>Supplier ID</th>
            <th>Name</th>
            <th>Contact Name</th>
            <th>Phone Number</th>
            <th>Email</th>
            <th>Address</th>
            <th>Actions</th>
        </tr>
        <%
            List<Supplier> suppliers = (List<Supplier>) request.getAttribute("suppliers");
            if (suppliers != null) {
                for (Supplier supplier : suppliers) {
        %>
        <tr>
            <td><%= supplier.getSupplierID() %></td>
            <td><%= supplier.getSupplierName() %></td>
            <td><%= supplier.getContactName() %></td>
            <td><%= supplier.getPhoneNumber() %></td>
            <td><%= supplier.getEmail() %></td>
            <td><%= supplier.getAddress() %></td>
            <td>
                <form action="MainController" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="UpdateSupplier">
                    <input type="hidden" name="supplierID" value="<%= supplier.getSupplierID() %>">
                    <input type="submit" value="Edit">
                </form>
                <form action="MainController" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="DeleteSupplier">
                    <input type="hidden" name="supplierID" value="<%= supplier.getSupplierID() %>">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dto.Supplier" %>
<html>
<head>
    <title>Supplier List</title>
</head>
<body>
    <h2>Supplier List</h2>

    <table border="1">
        <tr>
            <th>Supplier ID</th>
            <th>Name</th>
            <th>Contact Name</th>
            <th>Phone Number</th>
            <th>Email</th>
            <th>Address</th>
            <th>Actions</th>
        </tr>
        <%
            List<Supplier> suppliers = (List<Supplier>) request.getAttribute("suppliers");
            if (suppliers != null) {
                for (Supplier supplier : suppliers) {
        %>
        <tr>
            <td><%= supplier.getSupplierID() %></td>
            <td><%= supplier.getSupplierName() %></td>
            <td><%= supplier.getContactName() %></td>
            <td><%= supplier.getPhoneNumber() %></td>
            <td><%= supplier.getEmail() %></td>
            <td><%= supplier.getAddress() %></td>
            <td>
                <form action="MainController" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="UpdateSupplier">
                    <input type="hidden" name="supplierID" value="<%= supplier.getSupplierID() %>">
                    <input type="submit" value="Edit">
                </form>
                <form action="MainController" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="DeleteSupplier">
                    <input type="hidden" name="supplierID" value="<%= supplier.getSupplierID() %>">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
