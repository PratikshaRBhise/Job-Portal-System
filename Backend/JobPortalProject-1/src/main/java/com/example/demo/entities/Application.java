package com.example.demo.entities;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Application {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	
	private Integer applicationid;
    
	@ManyToOne
	@JoinColumn(name="user_id")
	
	private User user;
	
	@ManyToOne
	@JoinColumn(name="job_id")
	
	private Job job;
	
	private String resume;
	@Enumerated(EnumType.STRING)
    private ApplicationStatus status;
	private LocalDateTime appliedDate;
	public Application() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Application(Integer applicationid, User user, Job job, String resume, ApplicationStatus status,
			LocalDateTime appliedDate) {
		super();
		this.applicationid = applicationid;
		this.user = user;
		this.job = job;
		this.resume = resume;
		this.status = status;
		this.appliedDate = appliedDate;
	}
	public Integer getApplicationid() {
		return applicationid;
	}
	public void setApplicationid(Integer applicationid) {
		this.applicationid = applicationid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	public ApplicationStatus getStatus() {
		return status;
	}
	public void setStatus(ApplicationStatus status) {
		this.status = status;
	}
	public LocalDateTime getAppliedDate() {
		return appliedDate;
	}
	public void setAppliedDate(LocalDateTime appliedDate) {
		this.appliedDate = appliedDate;
	}
	@Override
	public String toString() {
		return "Application [applicationid=" + applicationid + ", user=" + user + ", job=" + job + ", resume=" + resume
				+ ", status=" + status + ", appliedDate=" + appliedDate + "]";
	}
	
	
	
	
	

}
