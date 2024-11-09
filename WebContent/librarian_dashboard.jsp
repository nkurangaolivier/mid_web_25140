<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*" %> 
<%@ page import="javax.naming.InitialContext" %> 
<%@ page import="javax.naming.Context" %> 
<%@ page import="javax.sql.DataSource" %> 

<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>Librarian Dashboard - AUCA Library</title> 
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet"> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"> 

    <style>
        /* Global styles */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f6f9;
            color: #333;
        }

        /* Dashboard container */
        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar styles */
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: #fff;
            margin-bottom: 30px;
        }

        .menu-items {
            list-style-type: none;
            padding: 0;
        }

        .menu-items li {
            padding: 15px;
            border-bottom: 1px solid #34495e;
        }

        .menu-items li a {
            color: white;
            text-decoration: none;
            font-weight: 600;
            display: block;
        }

        .menu-items li:hover {
            background-color: #34495e;
        }

        /* Main content area */
        .main-content {
            flex: 1;
            padding: 30px;
        }

        /* Header Section */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 2rem;
            color: #333;
        }

        /* Buttons */
        .action-buttons button {
            font-size: 1rem;
            padding: 10px 20px;
            margin: 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .action-button.primary-button {
            background-color: #3498db;
            color: white;
        }

        .action-button.primary-button:hover {
            background-color: #2980b9;
        }

        .action-button.secondary-button {
            background-color: #e74c3c;
            color: white;
        }

        .action-button.secondary-button:hover {
            background-color: #c0392b;
        }

        /* Stats cards section */
        .stats-container {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
        }

        /* Book Table Section */
        .books-table {
            margin-top: 30px;
        }

        .books-table h3 {
            font-size: 1.5rem;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #2c3e50;
            color: white;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background-color: #ecf0f1;
        }

        tr:hover {
            background-color: #bdc3c7;
        }

        td button {
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            border: none;
            transition: background-color 0.3s ease;
        }

        td .primary-button {
            background-color: #3498db;
            color: white;
        }

        td .primary-button:hover {
            background-color: #2980b9;
        }

        td .secondary-button {
            background-color: #e74c3c;
            color: white;
        }

        td .secondary-button:hover {
            background-color: #c0392b;
        }

        /* Mobile responsiveness */
        @media (max-width: 768px) {
            .dashboard-container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                height: auto;
            }

            .main-content {
                padding: 20px;
            }

            .stats-container {
                flex-direction: column;
            }

            table {
                width: 100%;
                font-size: 14px;
            }

            .action-buttons button {
                width: 100%;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="sidebar">
            <div class="logo">AUCA Library</div>
            <div class="menu-items">
                <!-- Your sidebar menu items here -->
            </div>
        </div>

        <div class="main-content">
            <div class="header">
                <h1>Librarian Dashboard</h1>
                <div class="action-buttons">
                    <button class="action-button primary-button" onclick="window.location.href='addBook.jsp'">Add New Book</button>
                     <button class="action-button primary-button" onclick="window.location.href='ViewBooksServlet'">My Books</button>
                </div>
            </div>

            <div class="stats-container">
                <!-- Stats cards (already in your original code) -->
            </div>

            <div class="recent-activities">
                <h3>Recent Activities</h3>
                <!-- Your activities list here -->
            </div>

            <!-- Books Table Section -->
            <div class="books-table">
                <h3>Books in the Library</h3>
                <table border="1" cellpadding="10" cellspacing="0" style="width: 100%; border-collapse: collapse;">
                    <thead>
                        <tr>
                            <th>Book ID</th>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Genre</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            // Initialize database connection and variables
                            try {
                                Context initContext = new InitialContext();
                                Context envContext = (Context) initContext.lookup("java:/comp/env");
                                DataSource ds = (DataSource) envContext.lookup("jdbc/MyDataSource");
                                Connection conn = ds.getConnection();
                                String query = "SELECT * FROM books"; // Modify based on your database schema
                                PreparedStatement stmt = conn.prepareStatement(query);
                                ResultSet rs = stmt.executeQuery();

                                while (rs.next()) {
                                    int bookId = rs.getInt("book_id");
                                    String title = rs.getString("title");
                                    String author = rs.getString("author");
                                    String genre = rs.getString("genre");
                                    String status = rs.getString("status");
                        %>
                                    <tr>
                                        <td><%= bookId %></td>
                                        <td><%= title %></td>
                                        <td><%= author %></td>
                                        <td><%= genre %></td>
                                        <td><%= status %></td>
                                        <td>
                                            <button class="action-button primary-button" onclick="window.location.href='editBook.jsp?id=<%= bookId %>'">Edit</button>
                                            <button class="action-button secondary-button" onclick="window.location.href='deleteBook.jsp?id=<%= bookId %>'">Delete</button>
                                        </td>
                                    </tr>
                        <%
                                }

                                // Clean up the resources
                                rs.close();
                                stmt.close();
                                conn.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %><tbody>
    <%
        // Initialize database connection and variables
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/MyDataSource");
            Connection conn = ds.getConnection();
            String query = "SELECT * FROM books"; // Modify based on your database schema
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int bookId = rs.getInt("book_id");
                String title = rs.getString("title");
                String author = rs.getString("author");
                String genre = rs.getString("genre");
                String status = rs.getString("status");
    %>
                <tr>
                    <td><%= bookId %></td>
                    <td><%= title %></td>
                    <td><%= author %></td>
                    <td><%= genre %></td>
                    <td><%= status %></td>
                    <td>
                        <button class="action-button primary-button" onclick="window.location.href='editBook.jsp?id=<%= bookId %>'">Edit</button>
                        <button class="action-button secondary-button" onclick="window.location.href='deleteBook.jsp?id=<%= bookId %>'">Delete</button>
                    </td>
                </tr>
    <%
            }

            // Clean up the resources
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</tbody>
                        
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
