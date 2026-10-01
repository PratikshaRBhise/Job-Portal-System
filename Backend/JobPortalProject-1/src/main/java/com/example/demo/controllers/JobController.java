package com.example.demo.controllers;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.Job;
import com.example.demo.services.Jobser;
@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api/jobs")
public class JobController {
	
	@Autowired
	private Jobser jobser;
	
	@PostMapping("/post")
	public Job postJob(@RequestBody Job job) {
		
		return jobser.postJob(job);
	}
	
	@GetMapping("/all")
	public List<Job> getAllJobs() {
	    return jobser.getAllJobs();
	}
	
	// ✅ SEARCH
    @GetMapping("/search")
    public List<Job> searchJobs(@RequestParam String keyword) {
        return jobser.searchJobs(keyword);
    }

    // ✅ UPDATE
    @PutMapping("/update/{id}")
    public Job updateJob(@PathVariable Integer id, @RequestBody Job job) {  // ✅ Integer
        return jobser.updateJob(id, job);
    }

    // ✅ DELETE
    @DeleteMapping("/delete/{id}")
    public String deleteJob(@PathVariable Integer id) {  // ✅ Integer
        jobser.deleteJob(id);
        return "Job Deleted Successfully";
    }
}
