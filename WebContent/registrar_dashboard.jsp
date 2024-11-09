<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Dashboard - AUCA Library</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        /* Global styles */    
        * {  
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #f4f7fc;
        }

        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 260px;
            background: #1e2a47;
            color: white;
            padding: 20px;
            border-right: 1px solid #ddd;
            box-shadow: 2px 0 15px rgba(0, 0, 0, 0.1);
        }

        .logo {
            font-size: 24px;
            font-weight: 600;
            text-align: center;
            margin-bottom: 20px;
        }

        .logo i {
            font-size: 30px;
            color: #fff;
        }

        .menu-items {
            margin-top: 30px;
        }

        .menu-item {
            padding: 15px;
            cursor: pointer;
            display: flex;
            align-items: center;
            border-radius: 8px;
            margin-bottom: 15px;
            transition: background-color 0.3s ease;
        }

        .menu-item:hover {
            background-color: #375a8b;
        }

        .menu-item i {
            margin-right: 15px;
            font-size: 18px;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 30px;
            overflow-y: auto;
        }

        /* Header */
        .header {
            background: #1e2a47;
            color: white;
            padding: 20px 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .registrar-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .registrar-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: #ccc;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #333;
        }

        /* Stats Cards */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            background-color: #eef2f7;
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .stat-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #1e2a47;
            color: white;
        }

        .stat-number {
            font-size: 28px;
            font-weight: 600;
            color: #333;
        }

        .stat-description {
            font-size: 14px;
            color: #888;
        }

        /* Recent Activities */
        .recent-activities {
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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
            background: #fafafa;
            display: flex;
            align-items: center;
            gap: 15px;
            border-left: 5px solid #1e2a47;
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            background-color: #1e2a47;
        }

        /* Buttons */
        .view-all-btn {
            padding: 8px 20px;
            border: none;
            border-radius: 8px;
            background: #1e2a47;
            color: white;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .view-all-btn:hover {
            background: #375a8b;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .dashboard-container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                padding: 15px;
            }

            .header-content {
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
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="logo">
                <i class="fas fa-university"></i> AUCA Library
            </div>
            <div class="menu-items">
                <!-- Removed "Dashboard" menu item -->
                <div class="menu-item">
                    <i class="fas fa-user-graduate"></i>
                    <span>Student Management</span>
                </div>
                <div class="menu-item">
                    <i class="fas fa-book-open"></i>
                    <span>Course Management</span>
                </div>
                <div class="menu-item">
                    <i class="fas fa-users"></i>
                    <span>Faculty Management</span>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Header Section -->
            <div class="header">
                <div class="header-content">
                    <div class="registrar-info">
                        <div class="registrar-avatar">
                            <i class="fas fa-user"></i>
                        </div>
                        <div>
                            <h2>Welcome, Registrar</h2>
                            <p>AUCA Administration</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Stats Section -->
            <div class="stats-container">
                <div class="stat-card">
                    <div class="stat-header">
                        <div>
                            <h3>Total Students</h3>
                            <div class="stat-number">4,567</div>
                        </div>
                        <div class="stat-icon">
                            <i class="fas fa-user-graduate"></i>
                        </div>
                    </div>
                    <p class="stat-description">Number of students currently enrolled.</p>
                </div>

                <div class="stat-card">
                    <div class="stat-header">
                        <div>
                            <h3>Total Courses</h3>
                            <div class="stat-number">130</div>
                        </div>
                        <div class="stat-icon">
                            <i class="fas fa-book-open"></i>
                        </div>
                    </div>
                    <p class="stat-description">Total courses available for students.</p>
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
                    <p class="stat-description">Number of faculty members.</p>
                </div>
            </div>

            <!-- Recent Activities Section -->
            <div class="recent-activities">
                <div class="activity-header">
                    <h3>Recent Activities</h3>
                    <button class="view-all-btn">View All</button>
                </div>
                <div class="activity-list">
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-chalkboard-teacher"></i>
                        </div>
                        <div>
                            <p>Faculty member "Dr. Smith" updated profile</p>
                    
    </div>
</body>
</html>
