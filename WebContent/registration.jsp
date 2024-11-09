<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="styling.css">
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        /* Body Styles */
        body {
            background-color: white; /* White background */
            color: #333; /* Dark gray text for contrast */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }

        h2 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            color: #333; /* Dark gray text */
        }

        /* Form Styles */
        form {
            background-color: white; /* White background */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        div {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #333; /* Dark gray text */
        }

        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9; /* Light gray background for input fields */
            color: #333;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #333; /* Dark button */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #444; /* Darker shade for hover effect */
        }

        select {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>

    <h2>Register for Library Membership</h2>

    <form action="${pageContext.request.contextPath}/RegistrationServlet" method="post">
        <div>
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" required>
        </div>
        <div>
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" required>
        </div>
        <div>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="STUDENT">Student</option>
                <option value="TEACHER">Teacher</option>
            </select>
        </div>
        <div>
            <label for="membershipType">Membership Type:</label>
            <select name="membershipType" required>
                <option value="GOLD">Gold (5 books, 50 Rwf/day)</option>
                <option value="SILVER">Silver (3 books, 30 Rwf/day)</option>
                <option value="STRIVER">Striver (2 books, 10 Rwf/day)</option>
            </select>
        </div>
        <button type="submit">Register</button>
    </form>

</body>
</html>
