<%-- 
    Document   : register
    Created on : Oct 8, 2024, 1:06:21 AM
    Author     : Admin
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Registration</title>
</head>
<body>
    <h2>User Registration</h2>
    <form action="MainController" method="post">
        <input type="hidden" name="action" value="Register">

        <label for="fullName">Full Name:</label>
        <input type="text" name="fullName" required><br><br>

        <label for="email">Email:</label>
        <input type="email" name="email" required><br><br>

        <label for="phoneNumber">Phone Number:</label>
        <input type="text" name="phoneNumber" required><br><br>

        <label for="password">Password:</label>
        <input type="password" name="password" required><br><br>

        <input type="submit" value="Register">
    </form>

    <%
        String error = (String) request.getAttribute("ERROR");
        if (error != null) {
    %>
        <p style="color:red;"><%= error %></p>
    <%
        }
    %>
</body>
</html><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Registration</title>
</head>
<body>
    <h2>User Registration</h2>
    <form action="MainController" method="post">
        <input type="hidden" name="action" value="Register">

        <label for="fullName">Full Name:</label>
        <input type="text" name="fullName" required><br><br>

        <label for="email">Email:</label>
        <input type="email" name="email" required><br><br>

        <label for="phoneNumber">Phone Number:</label>
        <input type="text" name="phoneNumber" required><br><br>

        <label for="password">Password:</label>
        <input type="password" name="password" required><br><br>

        <input type="submit" value="Register">
    </form>

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