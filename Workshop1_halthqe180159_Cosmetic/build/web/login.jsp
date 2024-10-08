<%-- 
    Document   : login
    Created on : Aug 6, 2024, 8:20:06 AM
    Author     : kiet0
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <form action="MainController" method="post">
        User ID <input type="text" name="UserID"/></br>
        Password<input type="password" name="Password"/></br>
        <input class="button" type="submit" name="action" value="Login"/>
        <input class="button" type="reset"  value="Reset"/>
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