<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dean Dashboard - AUCA Library</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: white;
            color: #333;
        }

        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 280px;
            background-color: #007BFF; /* Sidebar color */
            color: white;
            padding: 20px;
            height: 100%;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            padding: 20px 0;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .menu-items {
            margin-top: 30px;
        }

        .menu-item {
            padding: 15px;
            cursor: pointer;
            transition: all 0.3s;
            border-radius: 8px;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }

        .menu-item:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        .menu-item i {
            margin-right: 15px;
            font-size: 18px;
        }

        .main-content {
            flex: 1;
            background-color: #f4f6f9; /* Light background for main content */
            padding: 30px;
        }

        .header {
            background-color: #6c757d; /* Header color */
            padding: 20px 30px;
            border-radius: 15px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            color: white;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .dean-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .dean-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: white;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }

        .stat-card {
            padding: 25px;
            border-radius: 15px;
            background-color: #ffffff; /* Background color for stat cards */
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-5px); /* Hover effect */
        }

        .stat-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #007BFF; /* Blue background for stat icons */
            color: white;
        }

        .stat-number {
            font-size: 28px;
            font-weight: bold;
            color: #333;
        }

        .recent-activities {
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }

        .activity-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .activity-list {
            display: grid;
            gap: 15px;
        }

        .activity-item {
            padding: 15px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            gap: 15px;
            background-color: #f8f9fa; /* Light gray background for activities */
        }

        .activity-item:hover {
            background-color: #e9ecef; /* Slightly darker on hover */
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #28a745; /* Green background for activity icons */
            color: white;
        }

        .view-all-btn {
            padding: 8px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s;
            background-color: #007BFF; /* Button background color */
            color: white;
        }

        .view-all-btn:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="sidebar">
            <div class="logo">
                <i class="fas fa-university"></i> AUCA Library
            </div>
            <div class="menu-items">
                <div class="menu-item">
                    <i class="fas fa-books"></i>
                    <span>Library Overview</span>
                </div>
                <div class="menu-item">
                    <i class="fas fa-users"></i>
                    <span>Faculty Management</span>
                </div>
                <div class="menu-item">
                    <i class="fas fa-file-alt"></i>
                    <span>Reports</span>
                </div>
            </div>
        </div>

        <div class="main-content">
            <div class="header">
                <div class="header-content">
                    <div class="dean-info">
                        <div class="dean-avatar">
                            <i class="fas fa-user"></i>
                        </div>
                        <div>
                            <h2>Welcome, Dean</h2>
                        </div>
                    </div>
                </div>
            </div>

            <div class="stats-container">
                <div class="stat-card">
                    <div class="stat-header">
                        <div>
                            <h3>Total Books</h3>
                            <div class="stat-number">3,234</div>
                        </div>
                        <div class="stat-icon">
                            <i class="fas fa-book"></i>
                        </div>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-header">
                        <div>
                            <h3>Total Students</h3>
                            <div class="stat-number">1,567</div>
                        </div>
                        <div class="stat-icon">
                            <i class="fas fa-users"></i>
                        </div>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-header">
                        <div>
                            <h3>Total Faculty</h3>
                            <div class="stat-number">100</div>
                        </div>
                        <div class="stat-icon">
                            <i class="fas fa-chalkboard-teacher"></i>
                        </div>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-header">
                       
</body>
</html>
