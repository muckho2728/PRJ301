<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .bg-primary { background-color: #28A745; }
        .text-primary { color: #28A745; }
        .border-primary { border-color: #28A745; }
        .focus\:ring-primary-light:focus { box-shadow: 0 0 0 3px rgba(40, 167, 69, 0.5); }
        .hover\:bg-primary-dark:hover { background-color: #218838; }
        .bg-image {
            background-image: url('https://www.southernliving.com/thmb/PZmLMSCGMzde7qglDRiPllhffyQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1233497313-2000-f0fa864b97204382bd4576b0b5d70c41.jpg');
            background-size: cover;
            background-position: center;
        }
    </style>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center bg-image">
    <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
        <h2 class="text-3xl font-bold text-gray-800 text-center mb-6">Join Us</h2>
        <form action="MainController" method="post" class="space-y-4">
            <div>
                <label for="userId" class="block text-sm font-medium text-gray-700 mb-1">User ID</label>
                <input type="text" id="userId" name="userId" required
                    class="w-full px-4 py-2 rounded-md border border-gray-300 focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary transition">
            </div>
            <div>
                <label for="fullName" class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
                <input type="text" id="fullName" name="fullName" required
                    class="w-full px-4 py-2 rounded-md border border-gray-300 focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary transition">
            </div>
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                <input type="email" id="email" name="email" required
                    class="w-full px-4 py-2 rounded-md border border-gray-300 focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary transition">
            </div>
            <div>
                <label for="phoneNumber" class="block text-sm font-medium text-gray-700 mb-1">Phone Number</label>
                <input type="text" id="phoneNumber" name="phoneNumber" required
                    class="w-full px-4 py-2 rounded-md border border-gray-300 focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary transition">
            </div>
            <div>
                <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                <input type="password" id="password" name="password" required
                    class="w-full px-4 py-2 rounded-md border border-gray-300 focus:outline-none focus:ring-2 focus:ring-primary-light focus:border-primary transition">
            </div>
            <input type="hidden" name="controller" value="LoginController">
            <input type="hidden" name="action" value="register">
            <button type="submit" 
                class="w-full bg-primary text-white py-2 px-4 rounded-md hover:bg-primary-dark transition duration-300 ease-in-out focus:outline-none focus:ring-2 focus:ring-primary focus:ring-opacity-50">
                Create Account
            </button>
        </form>
        <p class="text-center mt-6 text-gray-600">
            Already have an account? <a href="login.jsp" class="font-semibold text-primary hover:underline">Login</a>
        </p>
    </div>
</body>
</html>
