package com.auca.library.util;

import com.auca.library.dao.LocationDAO;
import com.auca.library.model.Location;

import java.util.List;

public class LocationUtils {
    public static void displayLocations(List<Location> locs, Integer parentId, LocationDAO locationDAO) {
        // Check if locs is null or empty
        if (locs == null || locs.isEmpty()) {
            System.out.println("<p>No locations available.</p>");
            return; // Exit the method early
        }

        for (Location loc : locs) {
            // Check for null parentId and loc.getParentId()
            if ((parentId == null && loc.getParentId() == null) || 
                (parentId != null && parentId.equals(loc.getParentId()))) {
                System.out.println("<li>" + loc.getName() + " (" + loc.getLevel() + ")");
                
                // Check if locationDAO is not null before using it
                if (locationDAO != null) {
                    List<Location> childLocs = locationDAO.getChildren(loc.getId());
                    // Check if childLocs is null
                    if (childLocs != null && !childLocs.isEmpty()) {
                        System.out.println("<ul>");
                        displayLocations(childLocs, loc.getId(), locationDAO);
                        System.out.println("</ul>");
                    }
                } else {
                    System.out.println("<p>Error: LocationDAO is not initialized.</p>");
                }
                System.out.println("</li>");
            }
        }
    }
}