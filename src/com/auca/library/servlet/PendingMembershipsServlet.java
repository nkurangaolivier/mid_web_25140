package com.auca.library.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.auca.library.dao.MembershipDAO;
import com.auca.library.model.MembershipRequest;
import java.util.List;

@WebServlet("/pendingMemberships")
public class PendingMembershipsServlet extends HttpServlet {
    private MembershipDAO membershipDAO = new MembershipDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            List<MembershipRequest> pendingRequests = membershipDAO.getPendingRequests();
            request.setAttribute("pendingRequests", pendingRequests);
            request.getRequestDispatcher("pendingMemberships.jsp").forward(request, response);
        } catch (Exception e) {
            // Log the error
            e.printStackTrace();
            throw new ServletException("Error retrieving pending memberships", e);
        }
    }
}