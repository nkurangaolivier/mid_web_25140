package com.auca.library.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;
import com.auca.library.dao.MembershipDAO;

@WebServlet("/approveMembership")
public class ApproveMembershipServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MembershipDAO membershipDAO = new MembershipDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Get parameters
            int requestId = Integer.parseInt(request.getParameter("requestId"));
            String action = request.getParameter("action");

            // Update the membership status based on the action
            if ("Approve".equals(action)) {
                membershipDAO.updateMembershipStatus(requestId, "APPROVED");
            } else if ("Reject".equals(action)) {
                membershipDAO.updateMembershipStatus(requestId, "REJECTED");
            }

            // Redirect back to the pending memberships page
            response.sendRedirect(request.getContextPath() + "/pendingMemberships");
            
        } catch (NumberFormatException e) {
            // Log the error
            e.printStackTrace();
            throw new ServletException("Invalid request ID format", e);
        } catch (HibernateException e) {
            // Log the error
            e.printStackTrace();
            throw new ServletException("Database error while processing membership request", e);
        } catch (Exception e) {
            // Log the error
            e.printStackTrace();
            throw new ServletException("Error processing membership request", e);
        }
    }
}