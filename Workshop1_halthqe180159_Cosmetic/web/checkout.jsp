<%-- 
    Document   : checkout
    Created on : Oct 8, 2024, 1:17:23 PM
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="models_DTO.CartItem" %>
<html>
<head>
    <title>Checkout</title>
</head>
<body>
    <h2>Checkout</h2>

    <table border="1">
        <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total</th>
        </tr>
        <%
            List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
            if (cartItems != null) {
                for (CartItem item : cartItems) {
        %>
        <tr>
            <td><%= item.getProductID() %></td>
            <td><%= item.getProductName() %></td>
            <td><%= item.getQuantity() %></td>
            <td><%= item.getPrice() %></td>
            <td><%= item.getTotal() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <h3>Total Amount: <%= request.getAttribute("totalAmount") %></h3>

    <form action="MainController" method="post">
        <input type="hidden" name="action" value="PlaceOrder">
        <input type="submit" value="Confirm Order">
    </form>
</body>
</html>
