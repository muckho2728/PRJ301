<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .bg-primary { background-color: #28A745; }
        .text-primary { color: #28A745; }
        .border-primary { border-color: #28A745; }
        .focus\:ring-primary-light:focus { box-shadow: 0 0 0 3px rgba(40, 167, 69, 0.5); }
        .hover\:bg-primary-dark:hover { background-color: #218838; }
    </style>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
    <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-4xl{max-width: 60rem;}">
        <h2 class="text-3xl font-bold text-green-500 text-center mb-6">Product List</h2>
        
        <div class="flex justify-between items-center mb-6">
            <c:if test="${sessionScope.roleId == 'USR'}">
                <a href="cart.jsp" class="bg-primary text-white py-2 px-4 rounded hover:bg-primary-dark transition">View Cart</a>
                <a href="login.jsp" class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition">Log out</a>
            </c:if>
            <c:if test="${sessionScope.roleId == 'ADM'}">
                <div>
                    <div>
                        
                    </div>
                    <a href="createSupplier.jsp" class="bg-primary  text-white py-2 px-4 rounded hover:bg-blue-600 transition mr-2">Create New Supplier</a>
                    <a href="createProduct.jsp" class="bg-primary  text-white py-2 px-4 rounded hover:bg-red-400 transition mr-2">Create New Product</a>
                    <a href="MainController?controller=SupplierController&action=getAllSupplier" class="bg-primary text-white py-2 px-4 rounded hover:bg-primary-dark transition">Manage Supplier</a>
                    <a href="login.jsp" class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition">Log out</a>
                </div>
            </c:if>
        </div>

        <c:if test="${not empty productList}">
            <div class="overflow-x-auto bg-white shadow-md rounded-lg">
                <table class="min-w-full table-auto">
                    <thead class="bg-gray-200">
                        <tr class="border-b bg-green-500">
                            <th class="px-4 py-2 text-left text-gray-600">ID</th>
                            <th class="px-4 py-2 text-left text-gray-600">Name</th>
                            <th class="px-4 py-2 text-left text-gray-600">Description</th>
                            <th class="px-4 py-2 text-left text-gray-600">Price</th>
                            <th class="px-4 py-2 text-left text-gray-600">Quantity</th>
                            <th class="px-4 py-2 text-left text-gray-600">Category</th>
                            <th class="px-4 py-2 text-left text-gray-600">Image</th>
                            <th class="px-4 py-2 text-left text-gray-600">Supplier ID</th>
                            <th class="px-4 py-2 text-left text-gray-600">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                       
                        <c:forEach var="product" items="${productList}">
                            <tr class="border-b hover:bg-gray-50">
                                <td class="px-4 py-2">${product.productID}</td>
                                <td class="px-4 py-2">${product.productName}</td>
                                <td class="px-4 py-2">${product.description}</td>
                                <td class="px-4 py-2">${product.price}</td>
                                <td class="px-4 py-2">${product.quantity}</td>
                                <td class="px-4 py-2">${product.category}</td>
                                <td class="py-2 px-4 border-b border-gray-300"><img src="https://beautymatter.com/storage/3230/conversions/meet-ulta-beautys-first-muse-accelerator-cohort-large.jpg" alt="Lipstick" class="w-16 h-16 object-cover"></td>

                                <td class="px-4 py-2">${product.supplierID}</td>
                                <td class="px-4 py-2">
                                    <c:if test="${sessionScope.roleId == 'ADM'}">
                                        <a href="MainController?controller=ProductController&action=getProductById&id=${product.productID}" class="text-blue-500 hover:underline mr-2">Edit</a>
                                        <a href="MainController?controller=ProductController&action=delete&id=${product.productID}" class="text-red-500 hover:underline">Delete</a>
                                    </c:if>
                                    <c:if test="${sessionScope.roleId == 'USR'}">
                                        <a href="MainController?controller=CartController&action=add&quantity=1&id=${product.productID}" class="text-green-500 hover:underline">Add to Cart</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        
        <c:if test="${empty productList}">
            <p class="text-center text-gray-600 mt-4">No products available.</p>
        </c:if>
    </div>
</body>
</html>