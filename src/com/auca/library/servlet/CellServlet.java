package com.auca.library.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.auca.library.dao.LocationDAO;
import com.auca.library.model.Location;
import com.google.gson.Gson;

@WebServlet("/getCells")
public class CellServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sectorId = Integer.parseInt(request.getParameter("sectorId"));
        LocationDAO locationDAO = new LocationDAO();
        List<Location> cells = locationDAO.getCellsBySectorId(sectorId);

        // Convert the list to JSON and return it as the response
        String json = new Gson().toJson(cells);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}