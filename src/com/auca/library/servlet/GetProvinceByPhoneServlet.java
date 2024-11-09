package com.auca.library.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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

@WebServlet("/GetProvinceByPhoneServlet")
public class GetProvinceByPhoneServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        String phoneNumber = request.getParameter("phoneNumber");
        
        // For debugging
        System.out.println("Received phone number: " + phoneNumber);

        if (phoneNumber == null || phoneNumber.trim().isEmpty()) {
            out.println("Error: Phone number is required");
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn == null) {
                out.println("Error: Database connection failed");
                return;
            }

            String sql = "SELECT l.province FROM users u " +
                        "JOIN locations l ON u.location_id = l.id " +
                        "WHERE u.phone_number = ?";
            
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, phoneNumber);
                
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        String province = rs.getString("province");
                        out.println("Province: " + province);
                    } else {
                        out.println("Error: No user found with this phone number");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Error: Database error - " + e.getMessage());
        }
    }
}