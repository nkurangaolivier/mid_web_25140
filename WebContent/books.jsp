<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books List</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        /* Add your CSS here */
    </style>
</head>
<body>
    <h1>Books in the Library</h1>

    <!-- Display books table -->
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
            <!-- Iterate over the list of books passed from the servlet -->
            <c:forEach var="book" items="${books}">
                <tr>
                    <td>${book.bookId}</td>
                    <td>${book.title}</td>
                    <td>${book.author}</td>
                    <td>${book.genre}</td>
                    <td>${book.status}</td>
                    <td>
                        <button class="action-button primary-button" onclick="window.location.href='editBook.jsp?id=${book.bookId}'">Edit</button>
                        <button class="action-button secondary-button" onclick="window.location.href='deleteBook.jsp?id=${book.bookId}'">Delete</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
