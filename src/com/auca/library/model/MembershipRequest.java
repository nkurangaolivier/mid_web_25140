package com.auca.library.model;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "membership_requests")
public class MembershipRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "request_id")
    private int requestId;

    @Column(name = "member_id")
    private int memberId;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "email")
    private String email;

    @Column(name = "membership_type")
    private String membershipType;

    @Column(name = "request_date")
    private Timestamp requestDate;

    @Column(name = "status")
    private String status;

    @Column(name = "user_name")
    private String userName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id", insertable = false, updatable = false)
    private Member member;

    // Default constructor
    public MembershipRequest() {}

    // Constructor with parameters
    public MembershipRequest(int id, int memberId, String membershipType, Timestamp requestDate, String status) {
        this.requestId = id;
        this.memberId = memberId;
        this.membershipType = membershipType;
        this.requestDate = requestDate;
        this.status = status;
    }

    // Getters and Setters
    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMembershipType() {
        return membershipType;
    }

    public void setMembershipType(String membershipType) {
        this.membershipType = membershipType;
    }

    public Timestamp getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Timestamp requestDate) {
        this.requestDate = requestDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
        if (member != null) {
            this.memberId = member.getId();
            this.firstName = member.getFirstName();
            this.lastName = member.getLastName();
            this.email = member.getEmail();
        }
    }

    // PrePersist to set request date if not set
    @PrePersist
    protected void onCreate() {
        if (requestDate == null) {
            requestDate = new Timestamp(System.currentTimeMillis());
        }
    }

    @Override
    public String toString() {
        return "MembershipRequest{" +
                "requestId=" + requestId +
                ", memberId=" + memberId +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", membershipType='" + membershipType + '\'' +
                ", requestDate=" + requestDate +
                ", status='" + status + '\'' +
                '}';
    }

	public void setId(int int1) {
		// TODO Auto-generated method stub
		
	}

	public void setUserId(int int1) {
		// TODO Auto-generated method stub
		
	}

	public void setRequestDate(String string) {
		// TODO Auto-generated method stub
		
	}

	public void setApprovalStatus(String string) {
		// TODO Auto-generated method stub
		
	}
}