package com.example.demo.services;

import java.util.List;

import com.example.demo.entities.Job;

public interface Jobser {

	Job postJob(Job job);
	List<Job> getAllJobs();
	List<Job> searchJobs(String keyword);
	Job updateJob(Integer id, Job job);
	void deleteJob(Integer id);
	
	
}
