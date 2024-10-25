<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product</title>
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
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
    <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
        <h1 class="text-2xl font-bold text-green-500 mb-6 text-center">Update Product</h1>
        
        <c:if test="${not empty product}">
            <form action="ProductController" method="POST" class="space-y-4">
                <input type="hidden" name="action" value="edit"/>
                
                <div>
                    <label for="productID" class="block text-sm font-medium text-gray-700 mb-1">Product ID</label>
                    <input type="text" id="productID" name="productID" value="${product.productID}" readonly
                        class="w-full px-3 py-2 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary">
                </div>
                
                <div>
                    <label for="productName" class="block text-sm font-medium text-gray-700 mb-1">Product Name</label>
                    <input type="text" id="productName" name="productName" value="${product.productName}" required
                        class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary">
                </div>
                
                <div>
                    <label for="description" class="block text-sm font-medium text-gray-700 mb-1">Description</label>
                    <textarea id="description" name="description" required
                        class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary"
                    >${product.description}</textarea>
                </div>
                
                <div>
                    <label for="price" class="block text-sm font-medium text-gray-700 mb-1">Price</label>
                    <input type="number" step="1000" id="price" name="price" value="${product.price}" required
                        class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary">
                </div>
                
                <div>
                    <label for="quantity" class="block text-sm font-medium text-gray-700 mb-1">Quantity</label>
                    <input type="number" id="quantity" name="quantity" value="${product.quantity}" required
                        class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary">
                </div>
                
                <div>
                    <label for="category" class="block text-sm font-medium text-gray-700 mb-1">Category</label>
                    <input type="text" id="category" name="category" value="${product.category}" required
                        class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary">
                </div>
                
                <div>
                    <label for="supplierID" class="block text-sm font-medium text-gray-700 mb-1">Supplier ID</label>
                    <input type="text" id="supplierID" name="supplierID" value="${product.supplierID}" required
                        class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary">
                </div>
                
                <div>
                    <button type="submit" 
                        class="w-full bg-green-600 text-white py-2 px-4 rounded-md hover:bg-primary-dark transition duration-300 ease-in-out focus:outline-none focus:ring-2 focus:ring-primary focus:ring-opacity-50">
                        Update Product
                    </button>
                </div>
            </form>
        </c:if>
        
        <c:if test="${empty product}">
            <p class="text-center text-gray-600">
                Product not found. Please go back to the <a href="ProductController?action=getAllProduct" class="text-primary hover:underline">product list</a>.
            </p>
        </c:if>
    </div>
</body>
</html>