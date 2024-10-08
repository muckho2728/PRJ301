<%-- 
    Document   : productList
    Created on : Oct 8, 2024, 12:54:45 PM
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="models_DTO.Product" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
    <h2>Product List</h2>

    <table border="1">
        <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Category</th>
            <th>Actions</th>
        </tr>
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null) {
                for (Product product : products) {
        %>
        <tr>
            <td><%= product.getProductID() %></td>
            <td><%= product.getProductName() %></td>
            <td><%= product.getDescription() %></td>
            <td><%= product.getPrice() %></td>
            <td><%= product.getQuantity() %></td>
            <td><%= product.getCategory() %></td>
            <td>
                <form action="MainController" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="UpdateProduct">
                    <input type="hidden" name="productID" value="<%= product.getProductID() %>">
                    <input type="submit" value="Edit">
                </form>
                <form action="MainController" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="DeleteProduct">
                    <input type="hidden" name="productID" value="<%= product.getProductID() %>">
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
