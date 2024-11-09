package com.auca.library.model;

import java.sql.Date;
import java.sql.Timestamp;

public class Book {
    private int bookId;
    private String title;
    private String author;
    private Date publicationDate;
    private String isbn;
    private String status;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private int shelfId;
    private int totalCopies;
    private int availableCopies;
    private String category;
    private String description;

    // Getters and Setters
    // (You can generate these using your IDE or do it manually)



    public Book(int bookId2, String title2, String author2, String genre, String status2) {
		// TODO Auto-generated constructor stub
	}

	// Getters and Setters
    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(Date publicationDate) {
        this.publicationDate = publicationDate;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTotalCopies() {
        return totalCopies;
    }

    public void setTotalCopies(int totalCopies) {
        this.totalCopies = totalCopies;
    }

    public int getAvailableCopies() {
        return availableCopies;
    }

    public void setAvailableCopies(int availableCopies) {
        this.availableCopies = availableCopies;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

	public void setCreatedAt(Timestamp timestamp) {
		// TODO Auto-generated method stub
		
	}

	public void setUpdatedAt(Timestamp timestamp) {
		// TODO Auto-generated method stub
		
	}

	public void setShelfId(int int1) {
		// TODO Auto-generated method stub
		
	}
}
