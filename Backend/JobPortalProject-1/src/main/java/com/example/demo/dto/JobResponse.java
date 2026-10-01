package com.example.demo.dto;

import java.time.LocalDateTime;

public class JobResponse {
    private Integer jobId;
    private String title;
    private String description;
    private String salary;
    private String location;
    private String companyName;
    private LocalDateTime createdAt;

    public JobResponse(Integer jobId, String title, String description, String salary, String location, String companyName, LocalDateTime createdAt) {
        this.jobId = jobId;
        this.title = title;
        this.description = description;
        this.salary = salary;
        this.location = location;
        this.companyName = companyName;
        this.createdAt = createdAt;
    }

    // Getters
    public Integer getJobId() { return jobId; }
    public String getTitle() { return title; }
    public String getDescription() { return description; }
    public String getSalary() { return salary; }
    public String getLocation() { return location; }
    public String getCompanyName() { return companyName; }
    public LocalDateTime getCreatedAt() { return createdAt; }
}