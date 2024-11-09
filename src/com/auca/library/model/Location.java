package com.auca.library.model;

public class Location {
    private int id;
    private String name;
    private String level;
    private Integer parentId; // Assuming this is used for hierarchical locations
    private Integer provinceId; // New field for province ID
    private Integer districtId; // New field for district ID
    private Integer sectorId;   // New field for sector ID
    private Integer cellId;     // New field for cell ID
    private Integer villageId;  // New field for village ID

    // No-argument constructor
    public Location() {
        // Optionally initialize default values if necessary
    }

    // Constructor for basic fields
    public Location(int id, String name, String level, Integer parentId) {
        this.id = id;
        this.name = name;
        this.level = level;
        this.parentId = parentId;
    }

    // New constructor to accommodate additional parameters including name
    public Location(String name, int provinceId, int districtId, int sectorId, int cellId, int villageId) {
        this.name = name; // Initialize name
        this.provinceId = provinceId;
        this.districtId = districtId;
        this.sectorId = sectorId;
        this.cellId = cellId;
        this.villageId = villageId;
    }

    // Getters and Setters for existing fields
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    // Getters and Setters for new fields
    public Integer getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(Integer provinceId) {
        this.provinceId = provinceId;
    }

    public Integer getDistrictId() {
        return districtId;
    }

    public void setDistrictId(Integer districtId) {
        this.districtId = districtId;
    }

    public Integer getSectorId() {
        return sectorId;
    }

    public void setSectorId(Integer sectorId) {
        this.sectorId = sectorId;
    }

    public Integer getCellId() {
        return cellId;
    }

    public void setCellId(Integer cellId) {
        this.cellId = cellId;
    }

    public Integer getVillageId() {
        return villageId;
    }

    public void setVillageId(Integer villageId) {
        this.villageId = villageId;
    }

    public Integer getParentId() {
        return parentId; // Correct the return type here
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
}