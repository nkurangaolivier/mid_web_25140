package com.auca.library.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.DataSource;

import com.auca.library.model.Book;

import java.util.ArrayList;
import java.util.List;

public class BookServlet extends HttpServlet {
    private static final String QUERY = "SELECT * FROM books"; // SQL query for fetching books

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set content type to HTML
        response.setContentType("text/html;charset=UTF-8");

        // Initialize the list to store book data
        List<Book> books = new ArrayList<>();

        // Database connection and retrieval logic
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(QUERY);
             ResultSet rs = stmt.executeQuery()) {

            // Iterate through the result set and populate the book list
            while (rs.next()) {
                int bookId = rs.getInt("book_id");
                String title = rs.getString("title");
                String author = rs.getString("author");
                String genre = rs.getString("genre");
                String status = rs.getString("status");

                books.add(new Book(bookId, title, author, genre, status));
            }

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
            throw new ServletException("Database error", e);
        }

        // Set the list of books as a request attribute
        request.setAttribute("books", books);

        // Forward the request to the JSP page for rendering
        RequestDispatcher dispatcher = request.getRequestDispatcher("/books.jsp");
        dispatcher.forward(request, response);
    }

    // Helper method to get a database connection from the DataSource
    private Connection getConnection() throws NamingException, SQLException {
        Context initContext = new InitialContext();
        Context envContext = (Context) initContext.lookup("java:/comp/env");
        DataSource ds = (DataSource) envContext.lookup("jdbc/MyDataSource");
        return ds.getConnection();
    }
}
