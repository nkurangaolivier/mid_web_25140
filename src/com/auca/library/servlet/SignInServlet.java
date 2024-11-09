package com.auca.library.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.auca.library.util.DatabaseConnection;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String identifier = request.getParameter("username"); // Username or email
        String password = request.getParameter("password");
        
        try (Connection conn = DatabaseConnection.getConnection()) {
            // Select user information including role
            String sql = "SELECT id, username, password, role FROM users WHERE username = ? OR email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, identifier);
            stmt.setString(2, identifier);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String hashedPassword = rs.getString("password");
                
                // Check the password using BCrypt
                if (BCrypt.checkpw(password, hashedPassword)) {
                    // Password match, set user info in session
                    HttpSession session = request.getSession();
                    session.setAttribute("userId", rs.getLong("id"));
                    session.setAttribute("username", rs.getString("username"));
                    session.setAttribute("role", rs.getString("role"));

                    // Redirect based on role
                    String role = rs.getString("role");
                    switch(role) {
                        case "librarian":
                            response.sendRedirect("librarian_dashboard.jsp");
                            break;
                        case "admin":
                        case "HOD":
                            response.sendRedirect("hod_dashboard.jsp");
                            break;
                        case "Dean":
                            response.sendRedirect("dean_dashboard.jsp");
                            break;
                        case "Registrar":
                            response.sendRedirect("registrar_dashboard.jsp");
                            break;
                        case "student":
                        case "teacher":
                            response.sendRedirect("student_dashboard.jsp");
                            break;
                        default:
                            response.sendRedirect("index.jsp");
                    }
                } else {
                    // Password mismatch
                    response.sendRedirect("errorPage.jsp?error=Invalid%20username/email%20or%20password");
                }
            } else {
                // No user found
                response.sendRedirect("errorPage.jsp?error=Invalid%20username/email%20or%20password");
            }
        } catch (Exception e) {
            throw new ServletException("Login failed", e);
        }
    }
}
