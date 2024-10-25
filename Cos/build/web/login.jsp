<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
    body {
            font-family: Arial, sans-serif;
            background-color: #ffffff; /* ??i n?n sang tr?ng */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: url('https://beautymatter.com/storage/3230/conversions/meet-ulta-beautys-first-muse-accelerator-cohort-large.jpg');
            background-size: cover;
            background-position: center;
        }
        .container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        .title {
            color: #4CAF50; /* Màu xanh lá */
            
        }
        input[type=text], input[type=password] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button[type=submit] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button[type=submit]:hover {
            background-color: #388E3C;
        }
        .links a {
            display: inline-block;
            margin: 5px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: small;
        }
        .links a:hover {
            background-color: #ff6633;
        }
        
        </style>
    </head>
    <body>
        <div class="container">
    <h2 class="title text-3xl font-bold text-gray-800 text-center mb-6">Login Page</h2>
    <form action="MainController" method="post">
      <label for="userId"><b>User ID</b></label>
      <input type="text" placeholder="Enter UserID" name="userId" required>

      <label for="password"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="password" required>

      <input type="hidden" name="controller" value="LoginController">
            <input type="hidden" name="action" value="login">
            <button type="submit" 
                class="w-full bg-primary text-white py-2 px-4 rounded-md hover:bg-primary-dark transition duration-300 ease-in-out focus:outline-none focus:ring-2 focus:ring-primary focus:ring-opacity-50">
                Sign In
            </button>
      <div class="links">
        <a href="register.jsp">Create new User</a>
<!--        <a href="#">Click here to Shopping</a>-->
      </div>
    </form>
        
    
</body>
</html>