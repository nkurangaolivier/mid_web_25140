<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pending Memberships</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }

        .container {
            max-width: 1200px;
            margin : 40px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f0f0f0;
        }

        tr:nth-child(even) {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Pending Membership Requests</h1>
        <table>
            <tr>
                <th>User ID</th>
                <th>User Name</th>
                <th>Membership Type</th>
                <th>Request Date</th>
                <th>Action</th>
            </tr>
            <c:forEach var="request" items="${pendingRequests}">
                <tr>
                    <td>${request.userId}</td>
                    <td>${request.userName}</td>
                    <td>${request.membershipType}</td>
                    <td>${request.requestDate}</td>
                    <td>
                        <form action="approveMembership" method="post">
                            <input type="hidden" name="requestId" value="${request.id}">
                            <input type="hidden" name="userId" value="${request.userId}">
                            <input type="hidden" name="membershipType" value="${request.membershipType}">
                            <input type="submit" value="Approve">
                        </form>
                        <form action="rejectMembership" method="post">
                            <input type="hidden" name="requestId" value="${request.id}">
                            <input type="submit" value="Reject">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>