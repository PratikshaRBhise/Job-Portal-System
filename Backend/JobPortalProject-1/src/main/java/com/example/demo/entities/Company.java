package com.example.demo.entities;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Company {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	
	private Integer companyId;
	private String companyName;
	private String companyEmail;
	private String location;
	private LocalDateTime createdAt;
	public Company() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Company(Integer companyId, String companyName, String comapanyEmail, String location,
			LocalDateTime createdAt, String companyEmail) {
		super();
		this.companyId = companyId;
		this.companyName = companyName;
		this.companyEmail = companyEmail;
		this.location = location;
		this.createdAt = createdAt;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getComapanyEmail() {
		return companyEmail;
	}
	public void setComapanyEmail(String comapanyEmail) {
		this.companyEmail = comapanyEmail;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	@Override
	public String toString() {
		return "Company [companyId=" + companyId + ", companyName=" + companyName + ", comapanyEmail=" + companyEmail
				+ ", location=" + location + ", createdAt=" + createdAt + "]";
	}
	
	

}
