<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout Success</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .bg-primary { background-color: #28A745; }
        .text-primary { color: #28A745; }
        .border-primary { border-color: #28A745; }
        .focus\:ring-primary-light:focus { box-shadow: 0 0 0 3px rgba(40, 167, 69, 0.5); }
        .hover\:bg-primary-dark:hover { background-color: #218838; }
        body{font-family: Arial, sans-serif;
            background-color: #ffffff; /* ??i n?n sang tr?ng */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: url('https://beautymatter.com/storage/3230/conversions/meet-ulta-beautys-first-muse-accelerator-cohort-large.jpg');
            background-size: cover;
            background-position: center;}
    </style>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
    <div class="bg-white p-8 rounded-lg shadow-md text-center">
        <h1 class="text-3xl font-bold text-primary mb-4">Thank you for your purchase!</h1>
        <p class="text-3xl font-medium text-primary mb-6">Have a nice day!</p>
        <a href="login.jsp" class="bg-primary text-white py-2 px-4 rounded hover:bg-primary-dark focus:outline-none focus:ring-2 focus:ring-primary-light">Continue Shopping</a>
    </div>
</body>
</html>
