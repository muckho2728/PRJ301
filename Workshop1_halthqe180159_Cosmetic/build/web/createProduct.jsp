<%-- 
    Document   : createProduct
    Created on : Oct 8, 2024, 12:55:41 PM
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<html>
<head>
    <title>Create Product</title>
</head>
<body>
    <%
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("login.jsp");
        }
    %>

    <h2>Create a New Product</h2>
    <form action="MainController" method="post">
        <input type="hidden" name="action" value="CreateProduct">

        <label for="productID">Product ID:</label>
        <input type="text" name="productID" required><br><br>

        <label for="productName">Product Name:</label>
        <input type="text" name="productName" required><br><br>

        <label for="description">Description:</label>
        <textarea name="description" rows="5" cols="50" required></textarea><br><br>

        <label for="price">Price:</label>
        <input type="number" step="0.01" name="price" required><br><br>

        <label for="quantity">Quantity:</label>
        <input type="number" name="quantity" required><br><br>

        <label for="category">Category:</label>
        <input type="text" name="category" required><br><br>

        <label for="supplierID">Supplier ID:</label>
        <input type="text" name="supplierID" required><br><br>

        <input type="submit" value="Create Product">
    </form>
    <a href="user.jsp">Return admin page</a>
    <%
        String error = (String) request.getAttribute("ERROR");
        if (error != null) {
    %>
        <p style="color:red;"><%= error %></p>
    <%
        }
    %>
</body>
</html>