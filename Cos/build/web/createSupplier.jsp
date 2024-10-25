<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Supplier</title>
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
        <h2 class="text-2xl font-bold text-green-500 mb-6 text-center">Create New Supplier</h2>
        <form action="SupplierController" method="post" class="space-y-4">
            <input type="hidden" name="action" value="create" />
            
            <div>
                <label for="supplierID" class="block text-sm font-medium text-gray-700 mb-1">Supplier ID</label>
                <input type="text" id="supplierID" name="supplierID" required
                    class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary">
            </div>
            
            <div>
                <label for="supplierName" class="block text-sm font-medium text-gray-700 mb-1">Supplier Name</label>
                <input type="text" id="supplierName" name="supplierName" required
                    class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary">
            </div>
            
            <div>
                <label for="contactName" class="block text-sm font-medium text-gray-700 mb-1">Contact Name</label>
                <input type="text" id="contactName" name="contactName" required
                    class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary">
            </div>
            
            <div>
                <label for="phoneNumber" class="block text-sm font-medium text-gray-700 mb-1">Phone Number</label>
                <input type="text" id="phoneNumber" name="phoneNumber" required
                    class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary">
            </div>
            
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                <input type="email" id="email" name="email" required
                    class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary">
            </div>
            
            <div>
                <label for="address" class="block text-sm font-medium text-gray-700 mb-1">Address</label>
                <input type="text" id="address" name="address" required
                    class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary">
            </div>
            
            <div>
                <button type="submit" 
                    class="w-full bg-green-600 text-white py-2 px-4 rounded-md hover:bg-primary-dark transition duration-300 ease-in-out focus:outline-none focus:ring-2 focus:ring-primary focus:ring-opacity-50">
                    Create Supplier
                </button>
            </div>
        </form>
    </div>
</body>
</html>