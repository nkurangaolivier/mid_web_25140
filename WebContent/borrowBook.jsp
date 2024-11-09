<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrow a Book</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #fff; /* Set background to white */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333; /* Dark text for better readability */
        }

        .container {
            background: #fff; /* White background for the form */
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
            border: 1px solid #ddd; /* Light border around the form */
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 20px;
            font-size: 24px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin: 15px 0 5px;
            text-align: left;
            color: #34495e;
            font-weight: 600;
        }

        input[type="number"], input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin: 5px 0 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        input[type="number"]:focus {
            border-color: #3498db;
            outline: none;
        }

        input[type="submit"] {
            background: #3498db;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
            font-size: 18px;
            transition: background 0.3s, transform 0.2s;
        }

        input[type="submit"]:hover {
            background: #2980b9;
            transform: translateY(-2px);
        }

        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #777;
        }

        .icon {
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><i class="fas fa-book icon"></i> Borrow a Book</h1>
        <!-- Form to borrow a book -->
        <form method="post" action="<%= request.getContextPath() %>/BorrowBookServlet">
            <input type="hidden" name="action" value="borrowBook" />
            
            <label for="bookId">Book ID:</label>
            <input type="number" name="bookId" required />
            
            <label for="memberId">Member ID:</label>
            <input type="number" name="memberId" required />
            
            <input type="submit" value="Borrow Book" />
        </form>
        <div class="footer">© 2023 Library System</div>
    </div>
</body>
</html>
