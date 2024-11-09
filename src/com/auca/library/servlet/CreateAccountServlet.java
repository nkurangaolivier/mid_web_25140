package com.auca.library.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.auca.library.util.DatabaseConnection;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/CreateAccountServlet")
public class CreateAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	System.out.println("Received POST request to CreateAccountServlet");
        System.out.println("Content Type: " + request.getContentType());
        System.out.println("Request Parameters:");
        for (String paramName : request.getParameterMap().keySet()) {
            String[] paramValues = request.getParameterValues(paramName);
            for (String paramValue : paramValues) {
                System.out.println(paramName + " = " + paramValue);
            }
        }
        
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        // Get and validate parameters
        String username = validateParameter(request, "username", out);
        String email = validateParameter(request, "email", out);
        String password = validateParameter(request, "password", out);
        String phoneNumber = validateParameter(request, "phoneNumber", out);
        String province = validateParameter(request, "province", out);
        String district = validateParameter(request, "district", out);
        String sector = validateParameter(request, "sector", out);
        String cell = validateParameter(request, "cell", out);
        String village = validateParameter(request, "village", out);
        String role = validateParameter(request, "role", out);

        // Debug logging
        System.out.println("Received parameters:");
        System.out.println("Username: " + username);
        System.out.println("Email: " + email);
        System.out.println("Password: [PROTECTED]");
        System.out.println("Phone Number: " + phoneNumber);
        System.out.println("Province: " + province);
        System.out.println("District: " + district);
        System.out.println("Sector: " + sector);
        System.out.println("Cell: " + cell);
        System.out.println("Village: " + village);
        System.out.println("Role: " + role);

        // Validate all required fields
        if (username == null || email == null || password == null || phoneNumber == null ||
            province == null || district == null || sector == null || cell == null || village == null) {
            out.println("Error: All fields are required");
            return;
        }
        if (role == null || role.trim().isEmpty()) {
            role = "student"; // Default role
        }

        Connection conn = null;
        PreparedStatement locationStmt = null;
        PreparedStatement userStmt = null;
        
        try {
            conn = DatabaseConnection.getConnection();
            if (conn == null) {
                out.println("Error: Database connection failed");
                return;
            }

            // Start transaction
            conn.setAutoCommit(false);

            // Check if username already exists
            String checkUserSql = "SELECT COUNT(*) FROM users WHERE username = ?";
            PreparedStatement checkUserStmt = conn.prepareStatement(checkUserSql);
            checkUserStmt.setString(1, username);
            ResultSet rs = checkUserStmt.executeQuery();
            rs.next();
            if (rs.getInt(1) > 0) {
                out.println("Error: Username already exists");
                return;
            }

            // Check if email already exists
            String checkEmailSql = "SELECT COUNT(*) FROM users WHERE email = ?";
            PreparedStatement checkEmailStmt = conn.prepareStatement(checkEmailSql);
            checkEmailStmt.setString(1, email);
            rs = checkEmailStmt.executeQuery();
            rs.next();
            if (rs.getInt(1) > 0) {
                out.println("Error: Email already exists");
                return;
            }

            // Insert location
            String locationSql = "INSERT INTO locations (province, district, sector, cell, village) VALUES (?, ?, ?, ?, ?)";
            locationStmt = conn.prepareStatement(locationSql, PreparedStatement.RETURN_GENERATED_KEYS);
            locationStmt.setString(1, province);
            locationStmt.setString(2, district);
            locationStmt.setString(3, sector);
            locationStmt.setString(4, cell);
            locationStmt.setString(5, village);

            int locationRows = locationStmt.executeUpdate();
            if (locationRows == 0) {
                throw new SQLException("Creating location failed, no rows affected.");
            }

            // Get the generated location ID
            ResultSet generatedKeys = locationStmt.getGeneratedKeys();
            int locationId;
            if (generatedKeys.next()) {
                locationId = generatedKeys.getInt(1);
            } else {
                throw new SQLException("Creating location failed, no ID obtained.");
            }

            // Hash password
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            // Insert user
            String userSql = "INSERT INTO users (username, email, password, phone_number, location_id, role) VALUES (?, ?, ?, ?, ?, ?)";
            userStmt = conn.prepareStatement(userSql);
            userStmt.setString(1, username);
            userStmt.setString(2, email);
            userStmt.setString(3, hashedPassword);
            userStmt.setString(4, phoneNumber);
            userStmt.setInt(5, locationId);
            userStmt.setString(6, role); //

            int userRows = userStmt.executeUpdate();
            if (userRows == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }

            // Commit transaction
            conn.commit();
            out.println("Success: Account created successfully");

        } catch (SQLException e) {
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            out.println("Error: Database error - " + e.getMessage());
        } finally {
            try {
                if (userStmt != null) userStmt.close();
                if (locationStmt != null) locationStmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private String validateParameter(HttpServletRequest request, String paramName, PrintWriter out) {
        String value = request.getParameter(paramName);
        if (value == null || value.trim().isEmpty()) {
            out.println("Error: " + paramName + " is required");
            return null;
        }
        return value.trim();
    }
}