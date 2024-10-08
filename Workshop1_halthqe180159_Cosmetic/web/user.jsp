<%-- 
    Document   : user
    Created on : Oct 8, 2024, 1:36:55 PM
    Author     : Admin
--%>

<%@page import="models_DTO.Product"%>
<%@page import="java.util.List"%>
<%@page import="models_DAO.ProductDAO"%>
<%@page import="models_DTO.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Items List Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            ProductDAO dao = new ProductDAO();
            List<Product> listProduct = null;
            String noResults = (String) request.getAttribute("NO_RESULTS");

            if (request.getAttribute("LIST_PRODUCT") != null) {
                listProduct = (List<Product>) request.getAttribute("LIST_PRODUCT");
            } else {
                listProduct = dao.getAllProducts();
            }
        %>
        <h1>Welcome <%= loginUser.getFullName()%></h1>

        
        <%
            if (request.getAttribute("ERROR") != null) {
        %>
        <script>
            alert("${requestScope.ERROR}");
        </script >         
         <%
                }
         %>


        <form action="MainController" method="POST">
            <input type="submit" name="action" value="Logout"/>
        </form>

        <%            String fromPrice = request.getParameter("fromPrice");
            String toPrice = request.getParameter("toPrice");
             String category = request.getParameter("category");
            if (fromPrice == null) {
                fromPrice = "";
            }
            if (toPrice == null) {
                toPrice = "";
            }
            if (category == null) {
                category= "";
            }
        %>
        <form action="SearchController" method="POST">
            From Price: <input type="text" name="fromPrice" value="<%= fromPrice%>"/>
            To Price: <input type="text" name="toPrice" value="<%= toPrice%>"/>
            <input type="hidden" name="userRole" value="<%= loginUser.getRole()%>"/> 
            <input type="submit" value="Search"/>
        </form>
        <form action="SearchCategoryController" method="POST">
            Brand: <input type="text" name="category" value="<%= category%>"/>
            <input type="hidden" name="userRole" value="<%= loginUser.getRole()%>"/>
            <input type="submit" value="Search"/>
            <di><a href="viewCart.jsp">View Cart</a></div>
        </form>

        <h2>Search Results</h2>
        <% if (noResults != null) {%>
        <p><%= noResults%></p>
        <% } else if (listProduct != null && !listProduct.isEmpty()) { %>
        <table border="1">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>product Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Category</th>
                    <th>Supplier ID</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    int quantity = 1;
                    for (Product product : listProduct) {
                      
                %>
                <tr>
            <form action="MainController" method="post">
                <td><%= ++count%></td>
                <td><%= product.getProductID()%></td>
                <td>
                    <input type="text" name="name" value="<%= product.getProductName()%>" required=""/>
                </td>
                <td>
                    <input type="text"  name="price" value="<%=  (float) product.getPrice()%>" required="" />
                </td>
                <td>
                    <input type="number" name="quantity" value="<%= quantity%>" required="" />
                </td>
                <td>
                    <input type="text" name="category" value="<%= product.getCategory()%>" required="" />    
                 </td>  
                 <td>
                    <input type="hidden" name="fromPrice" value="<%= fromPrice%>"/>
                    <input type="hidden" name="toPrice" value="<%= toPrice%>" />
                     <input type="hidden" name="category" value="<%= category%>" />
                    <input type="hidden" name="productId" value="<%= product.getProductID()%>"/>  
                     <input type="hidden" name="userId" value="<%= loginUser.getUserID()%>"/> 
                    <input type="submit" name="action" value="AddToCart"/>
                </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <% } else { %>
      <p>No products found.</p>
    <% }%>


    <%
        String message = (String) request.getAttribute("MESSAGE");
        if (message == null) {
            message = "";
        }
    %>
    <div>
        <%= message%>
    </div>
</body>
</html>
