package com.auca.library.dao;

import com.auca.library.model.Location;
import com.auca.library.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LocationDAO {
    // Method to add a new location
    public void addLocation(Location location) throws SQLException {
        String sql = "INSERT INTO locations (name, level) VALUES (?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, location.getName());
            pstmt.setString(2, location.getLevel());
            pstmt.executeUpdate();
        }
    }

    // Method to retrieve all locations
    public List<Location> getAllLocations() throws SQLException {
        List<Location> locations = new ArrayList<>();
        String sql = "SELECT * FROM locations";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Location location = new Location();
                location.setId(rs.getInt("id"));
                location.setName(rs.getString("name"));
                location.setLevel(rs.getString("level"));
                locations.add(location);
            }
        }
        return locations;
    }
 // Method to retrieve districts by province ID
    public List<Location> getDistrictsByProvinceId(int provinceId) {
        List<Location> districts = new ArrayList<>();
        String sql = "SELECT * FROM locations WHERE level = 'DISTRICT' AND parent_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, provinceId); // Set the province ID as a parameter
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Location district = new Location();
                district.setId(rs.getInt("id"));
                district.setName(rs.getString("name"));
                district.setLevel(rs.getString("level"));
                districts.add(district);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return districts;
    }

    // Method to retrieve sectors by district ID
    public List<Location> getSectorsByDistrictId(int districtId) {
        List<Location> sectors = new ArrayList<>();
        String sql = "SELECT * FROM locations WHERE level = 'SECTOR' AND parent_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, districtId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Location sector = new Location();
                sector.setId(rs.getInt("id"));
                sector.setName(rs.getString("name"));
                sector.setLevel(rs.getString("level"));
                sectors.add(sector);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sectors;
    }

    // Method to retrieve cells by sector ID
    public List<Location> getCellsBySectorId(int sectorId) {
        List<Location> cells = new ArrayList<>();
        String sql = "SELECT * FROM locations WHERE level = 'CELL' AND parent_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, sectorId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Location cell = new Location();
                cell.setId(rs.getInt("id"));
                cell.setName(rs.getString("name"));
                cell.setLevel(rs.getString("level"));
                cells.add(cell);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cells;
    }

    // Method to retrieve villages by cell ID
    public List<Location> getVillagesByCellId(int cellId) {
        List<Location> villages = new ArrayList<>();
        String sql = "SELECT * FROM locations WHERE level = 'VILLAGE' AND parent_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, cellId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Location village = new Location();
                village.setId(rs.getInt("id"));
                village.setName(rs.getString("name"));
                village.setLevel(rs.getString("level"));
                villages.add(village);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return villages;
    }

    public List<Location> getLocationsByLevel(String level) {
        List<Location> locations = new ArrayList<>();
        String sql = "SELECT * FROM locations WHERE level = ?"; // Use a parameterized query

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, level); // Set the level parameter
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Location location = new Location();
                location.setId(rs.getInt("id"));
                location.setName(rs.getString("name"));
                location.setLevel(rs.getString("level"));
                locations.add(location);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return locations;
    }
    // Removed the getLocationsByLevelAndParentId method since it's no longer needed

	

	public List<Location> getChildren(int id) {
		// TODO Auto-generated method stub
		return null;
	}
}