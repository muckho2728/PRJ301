<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Product</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://www.caem.co.uk/web/image/1168-9ee79e80/Israel-Pharmacy7.jpg');
            background-size: cover;
            background-position: center;
        }
    </style>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8 bg-white p-10 rounded-xl shadow-md">
        <div>
            <h2 class="mt-6 text-center text-3xl font-extrabold text-green-500">
                Create New Product
            </h2>
        </div>
        <form class="mt-8 space-y-6" action="ProductController" method="POST">
            <input type="hidden" name="action" value="create"/>
            <div class="rounded-md shadow-sm -space-y-px">
                <div>
                    <label for="productID" class="sr-only">Product ID</label>
                    <input id="productID" name="productID" type="text" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Product ID">
                </div>
                <div>
                    <label for="productName" class="sr-only">Product Name</label>
                    <input id="productName" name="productName" type="text" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Product Name">
                </div>
                <div>
                    <label for="description" class="sr-only">Description</label>
                    <input id="description" name="description" type="text" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Description">
                </div>
                <div>
                    <label for="price" class="sr-only">Price</label>
                    <input id="price" name="price" type="number" step="0.01" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Price">
                </div>
                <div>
                    <label for="quantity" class="sr-only">Quantity</label>
                    <input id="quantity" name="quantity" type="number" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Quantity">
                </div>
                <div>
                    <label for="category" class="sr-only">Category</label>
                    <input id="category" name="category" type="text" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Category">
                </div>
                <div>
                    <label for="supplierID" class="sr-only">Supplier ID</label>
                    <input id="supplierID" name="supplierID" type="text" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Supplier ID">
                </div>
            </div>

            <div>
                <button type="submit" class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-green-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    Create Product
                </button>
            </div>
        </form>
    </div>
</body>
</html>