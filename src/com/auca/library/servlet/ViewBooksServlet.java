package com.auca.library.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.auca.library.model.Book;

@WebServlet("/viewNewBooks")
public class ViewBooksServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String URL = "jdbc:mysql://localhost:3306/`auca_library_management`";
    private static final String USER = "root"; // Adjust as necessary
    private static final String PASSWORD = "25140"; // Adjust as necessary

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement statement = connection.createStatement()) {

            // Execute a query to get books
            String query = "SELECT * FROM books"; // Adjust as necessary
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                Book book = new Book(0, query, query, query, query);
                book.setBookId(resultSet.getInt("book_id"));
                book.setTitle(resultSet.getString("title"));
                book.setAuthor(resultSet.getString("author"));
                book.setPublicationDate(resultSet.getDate("publication_date"));
                book.setIsbn(resultSet.getString("isbn"));
                book.setStatus(resultSet.getString("status"));

              
                bookList.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set the book list as a request attribute
        request.setAttribute("bookList", bookList);
        // Forward to JSP
        request.getRequestDispatcher("viewNewBooks.jsp").forward(request, response);
    }
}