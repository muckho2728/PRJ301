<%-- 
    Document   : updateProduct
    Created on : Oct 8, 2024, 1:00:15 PM
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="models_DTO.Product" %>
<html>
<head>
    <title>Update Product</title>
</head>
<body>
    <%
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("login.jsp");
        }

        Product product = (Product) request.getAttribute("product");
    %>

    <h2>Update Product: <%= product.getProductName() %></h2>
    <form action="MainController" method="post">
        <input type="hidden" name="action" value="UpdateProduct">
        <input type="hidden" name="productID" value="<%= product.getProductID() %>">

        <label for="productName">Product Name:</label>
        <input type="text" name="productName" value="<%= product.getProductName() %>" required><br><br>

        <label for="description">Description:</label>
        <textarea name="description" rows="5" cols="50" required><%= product.getDescription() %></textarea><br><br>

        <label for="price">Price:</label>
        <input type="number" step="0.01" name="price" value="<%= product.getPrice() %>" required><br><br>

        <label for="quantity">Quantity:</label>
        <input type="number" name="quantity" value="<%= product.getQuantity() %>" required><br><br>

        <label for="category">Category:</label>
        <input type="text" name="category" value="<%= product.getCategory() %>" required><br><br>

        <label for="supplierID">Supplier ID:</label>
        <input type="text" name="supplierID" value="<%= product.getSupplierID() %>" required><br><br>

        <input type="submit" value="Update Product">
    </form>

    <%
        String error = (String) request.getAttribute("ERROR");
        if (error != null) {
    %>
        <p style="color:red;"><%= error %></p>
    <%
        }
    %>

    <a href="productList.jsp">Back to Product List</a>
</body>
</html>