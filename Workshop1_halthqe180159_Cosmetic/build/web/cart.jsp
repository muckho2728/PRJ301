<%-- 
    Document   : cart
    Created on : Oct 8, 2024, 1:05:39 PM
    Author     : Admin
--%>

<%@page import="models_DTO.Product"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="models_DTO.CartItem" %>
<html>
<head>
    <title>Shopping Cart</title>
</head>
<body>
    <h2>Your Shopping Cart</h2>

    <table border="1">
        <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total</th>
            <th>Actions</th>
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
            <td>
                <form action="MainController" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="UpdateCart">
                    <input type="hidden" name="productID" value="<%= item.getProductID() %>">
                    <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1">
                    <input type="submit" value="Update">
                </form>
                <form action="MainController" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="RemoveFromCart">
                    <input type="hidden" name="productID" value="<%= item.getProductID() %>">
                    <input type="submit" value="Remove">
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <a href="productList.jsp">Continue Shopping</a>
    <form action="MainController" method="post">
        <input type="hidden" name="action" value="Checkout">
        <input type="submit" value="Checkout">
    </form>
</body>
</html>