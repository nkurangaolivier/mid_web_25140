<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOD Dashboard - AUCA Library</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 250px;
            padding: 20px;
            border-right: 1px solid #ddd;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            padding: 20px 0;
            text-align: center;
            border-bottom: 1px solid #ddd;
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
            display: flex;
            align-items: center;
        }

        .menu-item:hover {
            background: #f0f0f0;
        }

        .menu-item i {
            margin-right: 10px;
        }

        .main-content {
            flex: 1;
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }

        .stat-card h3 {
            margin-bottom: 10px;
        }

        .stat-card .number {
            font-size: 24px;
            font-weight: bold;
        }

        .recent-activities {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }

        .activity-list {
            margin-top: 20px;
        }

        .activity-item {
            padding: 15px;
            border-bottom: 1px solid #eee;
            display: flex;
            align-items: center;
        }

        .activity-item i {
            margin-right: 15px;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .action-button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .primary-button {
            background: #3498db;
            color: white;
        }

        .secondary-button {
            background: #2ecc71;
            color: white;
        }

        .action-button:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="sidebar">
            <div class="logo">AUCA Library</div>
            <div class="menu-items">
               
                <div class="menu-item">
                    <i class="fas fa-book"></i> View Books
                </div>
                <div class="menu-item">
                    <i class="fas fa-users"></i> View Members
                </div>
                <div class="menu-item">
                    <i class="fas fa-cog"></i> Settings
                </div>
            </div>
        </div>

        <div class="main-content">
            <div class="header">
                <h1>HOD Dashboard</h1>
                <div class="action-buttons">
                    <button class="action-button primary-button">View Reports</button>
                    <button class="action-button secondary-button">View Profile</button>
                </div>
            </div>

            <div class="stats-container">
                <div class="stat-card">
                    <h3>Total Books</h3>
                    <div class="number">2.0000</div>
                </div>
                <div class="stat-card">
                    <h3>Active Members</h3>
                    <div class="number">333</div>
                </div>
                <div class="stat-card">
                    <h3>Total Fines</h3>
                    <div class="number">Rwf 30,000</div>
                </div>
            </div>

         
</body>
</html>
