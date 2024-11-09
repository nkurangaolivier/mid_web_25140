<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard - AUCA Library</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: white; /* White background for the entire page */
            color: #333;
        }

        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #3498db; /* Blue sidebar */
            color: white;
            padding: 20px;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            padding: 20px 0;
            text-align: center;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            margin-bottom: 20px;
        }

        .menu-items {
            margin-top: 20px;
        }

        .menu-item {
            padding: 15px;
            cursor: pointer;
            transition: all 0.3s;
            border-radius: 5px;
            margin-bottom: 5px;
            color: white;
        }

        .menu-item:hover {
            background: #2980b9; /* Darker blue on hover */
        }

        .menu-item i {
            margin-right: 10px;
        }

        .main-content {
            flex: 1;
            background-color: #ecf0f1; /* Light gray background for the main content */
            padding: 20px;
            overflow: auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #3498db; /* Blue header background */
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 24px;
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: #ffffff; /* White background for stats cards */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            border-left: 5px solid #3498db; /* Blue left border for each stat card */
        }

        .stat-card h3 {
            color: #2c3e50; /* Dark text color */
            margin-bottom: 10px;
        }

        .stat-card .number {
            font-size: 24px;
            font-weight: bold;
            color: #2980b9; /* Blue text for the numbers */
        }

        .recent-activities {
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .activity-list {
            margin-top: 20px;
        }

        .activity-item {
            padding: 15px;
            border-bottom: 1px solid #eee;
            display: flex;
            align-items: center;
            color: #2c3e50; /* Dark text color */
        }

        .activity-item i {
            margin-right: 15px;
            color: #3498db; /* Blue icon color */
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .action-button {
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
            border: none;
        }

        .primary-button {
            background-color: #3498db; /* Blue background */
            color: white;
        }

        .secondary-button {
            background-color: #ecf0f1; /* Light gray background */
            color: #2c3e50;
            border: 1px solid #bdc3c7; /* Gray border */
        }

        .action-button:hover {
            opacity: 0.8; /* Slightly darker on hover */
        }

        .action-button:focus {
            outline: none;
        }

        /* Additional responsive styling */
        @media (max-width: 768px) {
            .dashboard-container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                text-align: center;
                margin-bottom: 20px;
            }

            .main-content {
                width: 100%;
                padding: 10px;
            }

            .header {
                flex-direction: column;
                align-items: flex-start;
            }

            .stats-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="sidebar">
            <div class="logo">AUCA Library</div>
            <div class="menu-items">
                <div class="menu-item">
                    <i class="fas fa-book"></i> My Books
                </div>
                <div class="menu-item">
                    <i class="fas fa-user"></i> Profile
                </div>
            </div>
        </div>

        <div class="main-content">
            <div class="header">
                <h1>Student Dashboard</h1>
                <div class="action-buttons">
                   <button class="action-button primary-button" onclick="window.location.href='borrowBook.jsp'">Borrow Book</button>
                    <button class="action-button secondary-button">View Profile</button>
                </div>
            </div>

            <div class="stats-container">
                <div class="stat-card">
                    <h3>Total Books Borrowed</h3>
                    <div class="number">4</div>
                </div>
                <div class="stat-card">
                    <h3>Books Due Today</h3>
                    <div class="number">2</div>
                </div>
                <div class="stat-card">
                    <h3>Fine Amount</h3>
                    <div class="number">Rwf 1000</div>
                </div>
            </div>

            <div class="recent-activities">
                <h2>Recent Activities</h2>
                <div class="activity-list">
                    <div class="activity-item">
                        <i class="fas fa-book"></i>
                        <span>Borrowed book "Data Structures" on 2024-10-15</span>
                    </div>
                    <div class="activity-item">
                        <i class="fas fa-undo"></i>
                        <span>Returned book "Algorithms" on 2024-10-10</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
