<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Cart" %>
<%@ page import="model.CartItems" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: {
                            light: '#E3F2FD',
                            DEFAULT: '#2196F3',
                            dark: '#1E88E5',
                        }
                    }
                }
            }
        }
    </script>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .bg-primary { background-color: #28A745; }
        .text-primary { color: #28A745; }
        .border-primary { border-color: #28A745; }
        .focus\:ring-primary-light:focus { box-shadow: 0 0 0 3px rgba(40, 167, 69, 0.5); }
        .hover\:bg-primary-dark:hover { background-color: #218838; }
    </style>
</head>
<body class="bg-gray-100 min-h-screen">
    <div class="container mx-auto px-4 py-8">
        <h1 class="text-3xl font-bold text-gray-800 mb-6">Your Shopping Cart</h1>
        
        <div class="bg-white shadow-md rounded-lg overflow-hidden">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Product ID</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Product Name</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Price</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Quantity</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Total</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    <c:forEach var="item" items="${sessionScope.cart.items}">
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap">${item.product.productID}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${item.product.productName}</td>
                            <td class="px-6 py-4 whitespace-nowrap">$${item.product.price}</td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <form action="MainController" method="post" class="flex items-center">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="controller" value="CartController">
                                    <input type="hidden" name="id" value="${item.product.productID}">
                                    <input type="number" name="quantity" value="${item.quantity}" min="1" class="w-16 rounded border-gray-300 mr-2">
                                    <button type="submit" class="bg-primary text-white px-2 py-1 rounded hover:bg-primary-dark transition">Update</button>
                                </form>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">$${item.quantity * item.product.price}</td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <form action="MainController" method="post">
                                    <input type="hidden" name="action" value="remove">
                                    <input type="hidden" name="controller" value="CartController">
                                    <input type="hidden" name="id" value="${item.product.productID}">
                                    <button type="submit" class="text-red-600 hover:text-red-900">Remove</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="mt-8 flex justify-between items-center">
            <h3 class="text-xl font-semibold">Total Price: $${sessionScope.cart.getTotalMoney()}</h3>
            <div class="space-x-4">
                <form action="MainController" method="post" class="inline">
                    <input type="hidden" name="action" value="clear">
                    <input type="hidden" name="controller" value="CartController">
                    <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition">Clear Cart</button>
                </form>
                <form action="checkoutSuccess.jsp"  class="inline">
                    <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 transition">Checkout</button>
                </form>
            </div>
        </div>

        <div class="mt-8 text-center">
            <a href="MainController?controller=ProductController&action=getAllProduct" class="text-primary hover:underline">Continue Shopping</a>
        </div>
    </div>
</body>
</html>