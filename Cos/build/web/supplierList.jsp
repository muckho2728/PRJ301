<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supplier List</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
        }
        .title {
            color: #4CAF50;
        }
        .table-container {
            overflow-x: auto; /* Thêm thanh cuộn ngang */
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body class="bg-gray-100 min-h-screen">
    <div class="container mx-auto px-4 py-8">
        <h1 style="color: green; text-align: center;"class="text-3xl font-bold text-gray-800 mb-6">Supplier List</h1>
        
        <div class="mb-4">
            <a href="createSupplier.jsp" class="bg-green-500 text-white py-2 px-4 rounded hover:bg-green-600 transition">Create New Supplier</a>
        
        </div>

        <div class="bg-white shadow-md rounded-lg overflow-hidden">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Supplier ID</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Supplier Name</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Contact Name</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Phone Number</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Address</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    <c:forEach var="supplier" items="${supplierList}">
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap">${supplier.supplierID}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${supplier.supplierName}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${supplier.contactName}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${supplier.phoneNumber}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${supplier.email}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${supplier.address}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                <a href="MainController?controller=SupplierController&action=getSupplierById&supplierID=${supplier.supplierID}" class="text-primary hover:text-primary-dark mr-3">Edit</a>
                                <a href="SupplierController?action=delete&supplierID=${supplier.supplierID}" class="text-red-600 hover:text-red-900">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>