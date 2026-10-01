package com.example.demo.entities;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Job {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	
	private Integer jobId;
	private String title;
	private String description;
	private String salary;
	private String location;
	
	@ManyToOne
	@JoinColumn(name="company_id")
	
	private Company company;
	private LocalDateTime createdAt;
	public Job() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Job(Integer jobId, String title, String description, String salary, String location, Company company,
			LocalDateTime createdAt) {
		super();
		this.jobId = jobId;
		this.title = title;
		this.description = description;
		this.salary = salary;
		this.location = location;
		this.company = company;
		this.createdAt = createdAt;
	}
	public Integer getJobId() {
		return jobId;
	}
	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	@Override
	public String toString() {
		return "Job [jobId=" + jobId + ", title=" + title + ", description=" + description + ", salary=" + salary
				+ ", location=" + location + ", company=" + company + ", createdAt=" + createdAt + "]";
	}
	
	

}
