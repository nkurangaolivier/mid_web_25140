package com.auca.library.servlet;

import com.auca.library.dao.LocationDAO;
import com.auca.library.model.Location;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class AddLocationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve parameters
        String name = req.getParameter("name");
        int provinceId = Integer.parseInt(req.getParameter("province"));
        int districtId = Integer.parseInt(req.getParameter("district"));
        int sectorId = Integer.parseInt(req.getParameter("sector"));
        int cellId = Integer.parseInt(req.getParameter("cell"));
        int villageId = Integer.parseInt(req.getParameter("village"));

        // Validate the 'name' field
        if (name == null || name.isEmpty()) {
            req.setAttribute("errorMessage", "Name cannot be empty.");
            req.getRequestDispatcher("/errorPage.jsp").forward(req, resp);
            return; // Stop further processing
        }

        // Create Location object using the new constructor
        LocationDAO locationDAO = new LocationDAO();
        Location location = new Location(name, provinceId, districtId, sectorId, cellId, villageId);

        try {
            locationDAO.addLocation(location);
            resp.sendRedirect("location.jsp"); // Redirect to locations page
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
            req.setAttribute("errorMessage", "Failed to add location: " + e.getMessage());
            req.getRequestDispatcher("/errorPage.jsp").forward(req, resp);
        }
    }
}