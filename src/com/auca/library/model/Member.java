package com.auca.library.model;

import javax.persistence.*;

@Entity
@Table(name = "members")
public class Member extends Person {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "membership_type", nullable = false) // Add this line for mapping
    private String membershipType; // GOLD, SILVER, STRIVER

    @Column(name = "password", nullable = false) // Add this line for mapping
    private String password;

    private boolean isApproved;
    private int borrowedBooks;
    private String approvalStatus;
    private String role;

    // Getters and setters for new fields
    public int getId() {
        return id;
    }

    public String getMembershipType() {
        return membershipType;
    }

    public void setMembershipType(String membershipType) {
        this.membershipType = membershipType;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password; // In a real application, encrypt this
    }

    public boolean isApproved() {
        return isApproved;
    }
    public String getRole() {
        return role;
    }
    public void setApproved(boolean isApproved) {
        this.isApproved = isApproved;
    }

    public int getBorrowedBooks() {
        return borrowedBooks;
    }

    public void setBorrowedBooks(int borrowedBooks) {
        this.borrowedBooks = borrowedBooks;
    }

    public String getApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(String approvalStatus) {
        this.approvalStatus = approvalStatus;
        
    }
    public void setRole(String role) {
        this.role = role;
    }

	public void setFirstName(String firstName) {
		// TODO Auto-generated method stub
		
	}

	public void setLastName(String lastName) {
		// TODO Auto-generated method stub
		
	}

	public void setEmail(String email) {
		// TODO Auto-generated method stub
		
	}

	public String getFirstName() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getLastName() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getEmail() {
		// TODO Auto-generated method stub
		return null;
	}
}
