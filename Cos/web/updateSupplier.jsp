<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Supplier</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen flex items-center justify-center">
    <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
        <h2 class="text-2xl font-semibold mb-6 text-gray-800">Update Supplier Information</h2>
        <form action="SupplierController" method="post" class="space-y-4">
            <input type="hidden" name="action" value="edit" />
            
            <div>
                <label for="supplierID" class="block text-sm font-medium text-gray-700">Supplier ID:</label>
                <input type="text" id="supplierID" name="supplierID" value="${supplier.supplierID}" readonly class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 bg-gray-100" />
            </div>
            
            <div>
                <label for="supplierName" class="block text-sm font-medium text-gray-700">Supplier Name:</label>
                <input type="text" id="supplierName" name="supplierName" value="${supplier.supplierName}" required class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" />
            </div>
            
            <div>
                <label for="contactName" class="block text-sm font-medium text-gray-700">Contact Name:</label>
                <input type="text" id="contactName" name="contactName" value="${supplier.contactName}" required class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" />
            </div>
            
            <div>
                <label for="phoneNumber" class="block text-sm font-medium text-gray-700">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" value="${supplier.phoneNumber}" required class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" />
            </div>
            
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700">Email:</label>
                <input type="email" id="email" name="email" value="${supplier.email}" required class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" />
            </div>
            
            <div>
                <label for="address" class="block text-sm font-medium text-gray-700">Address:</label>
                <input type="text" id="address" name="address" value="${supplier.address}" required class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" />
            </div>
            
            <div>
                <button type="submit" class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    Update Supplier
                </button>
            </div>
        </form>
    </div>
</body>
</html>