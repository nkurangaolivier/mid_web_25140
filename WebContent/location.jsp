<%@ page import="com.auca.library.dao.LocationDAO" %>
<%@ page import="com.auca.library.model.Location" %>
<%@ page import="com.auca.library.util.LocationUtils" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Locations</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Locations</h1>
    <ul>
        <%
            LocationDAO locationDAO = new LocationDAO();
            List<Location> locations = locationDAO.getAllLocations();
            LocationUtils.displayLocations(locations, null, locationDAO);
        %>
    </ul>
</body>
</html>