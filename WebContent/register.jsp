<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 20px;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            backdrop-filter: blur(10px);
            transform: translateY(0);
            transition: all 0.3s ease;
        }

        .container:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333333;
            text-align: center;
        }

        #message {
            color: red;
            margin-bottom: 15px;
            font-size: 14px;
            text-align: center;
        }

        label {
            display: block;
            text-align: left;
            font-weight: 500;
            margin: 10px 0 5px;
            color: #555555;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            margin: 5px 0 10px;
            border: 1px solid #cccccc;
            border-radius: 6px;
            outline: none;
            font-size: 16px;
            color: #333333;
            background-color: #f9f9f9;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        select:focus {
            border-color: #667eea;
            box-shadow: 0 0 3px rgba(102, 126, 234, 0.3);
        }

        select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            background-size: 1em;
        }

        input[type="submit"] {
            background-color: #667eea;
            color: white;
            width: 100%;
            padding: 10px;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #764ba2;
        }

        /* Responsive design */
        @media (max-width: 480px) {
            .container {
                padding: 1.5rem;
            }

            h2 {
                font-size: 20px;
            }

            input[type="submit"] {
                font-size: 16px;
            }
        }
    </style>
    <script>
        function validateForm() {
            var username = document.getElementById("username").value;
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var phoneNumber = document.getElementById("phoneNumber").value;
            var role = document.getElementById("role").value;
            var message = document.getElementById("message");

            message.innerHTML = ""; // Clear previous messages

            if (username.length < 3) {
                message.innerHTML = "Username must be at least 3 characters long.";
                return false;
            }

            if (!validateEmail(email)) {
                message.innerHTML = "Please enter a valid email address.";
                return false;
            }

            if (password.length < 8) {
                message.innerHTML = "Password must be at least 8 characters long.";
                return false;
            }

            if (password !== confirmPassword) {
                message.innerHTML = "Passwords do not match.";
                return false;
            }

            if (phoneNumber.length !== 10) {
                message.innerHTML = "Phone number must be exactly 10 digits.";
                return false;
            }

            if (role === "") {
                message.innerHTML = "Please select a role.";
                return false;
            }

            return true;
        }

        function validateEmail(email) {
            var re = /\S+@\S+\.\S+/;
            return re.test(email);
        }

        function submitForm(event) {
            console.log("submitForm function called");
            event.preventDefault();

            if (!validateForm()) {
                return;
            }

            var formData = {
                username: document.getElementById("username").value,
                email: document.getElementById("email").value,
                password: document.getElementById("password").value,
                phoneNumber: document.getElementById("phoneNumber").value,
                province: document.getElementById("province").value,
                district: document.getElementById("district").value,
                sector: document.getElementById("sector").value,
                cell: document.getElementById("cell").value,
                village: document.getElementById("village").value,
                role: document.getElementById("role").value
            };

            console.log("Form data to be sent:", formData);

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "CreateAccountServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onload = function() {
                if (xhr.status === 200) {
                    console.log("Server response:", xhr.responseText);
                    if (xhr.responseText.startsWith("Success")) {
                        window.location.href = "signin1.html";
                    } else {
                        document.getElementById("message").innerHTML = xhr.responseText;
                    }
                } else {
                    console.log("Error response:", xhr.responseText);
                    document.getElementById("message").innerHTML = "Error creating account: " + xhr.responseText;
                }
            };

            var encodedData = Object.keys(formData).map(function(key) {
                return encodeURIComponent(key) + '=' + encodeURIComponent(formData[key]);
            }).join('&');

            console.log("Encoded data to be sent:", encodedData);

            xhr.send(encodedData);
        }
    </script>
    </head>
<body>
    <div class="container">
        <form id="createAccountForm" onsubmit="submitForm(event);">
            <h2>Create Account</h2>
            <div id="message" style="color: red;"></div>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br><br>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>

            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required><br><br>

            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" required><br><br>

            <label for="province">Province:</label>
            <input type="text" id="province" name="province" required><br><br>

            <label for="district">District:</label>
            <input type="text" id="district" name="district" required><br><br>

            <label for="sector">Sector:</label>
            <input type="text" id="sector" name="sector" required><br><br>

            <label for="cell">Cell:</label>
            <input type="text" id="cell" name="cell" required><br><br>

            <label for="village">Village:</label>
            <input type="text" id="village" name="village" required><br><br>

            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="" disabled selected>Select your role</option>
                <option value="student">Student</option>
                <option value="teacher">Teacher</option>
                <option value="librarian">Librarian</option>
                <option value="HOD">Head of Department</option>
                <option value="Dean">Dean</option>
                <option value="Registrar">Registrar</option>
            </select><br><br>

            <input type="submit" value="Create Account">
        </form>
    </div>
</body>
</html>