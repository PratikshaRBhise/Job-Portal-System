package com.example.demo.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Job;
import com.example.demo.repos.Jobrepo;
import com.example.demo.services.Jobser;

@Service
public class Jobdao implements Jobser{

	@Autowired
	private Jobrepo jobrepo;
	@Override
	public Job postJob(Job job) {
		// TODO Auto-generated method stub
		return jobrepo.save(job);
	}
	@Override
	public List<Job> getAllJobs() {
		// TODO Auto-generated method stub
		return jobrepo.findAll();

	}
	@Override
    public List<Job> searchJobs(String keyword) {
        return jobrepo
            .findByTitleContainingIgnoreCaseOrLocationContainingIgnoreCase(keyword, keyword);
    }

    @Override
    public Job updateJob(Integer id, Job job) {
        Job existing = jobrepo.findById(id).orElseThrow();

        existing.setTitle(job.getTitle());
        existing.setDescription(job.getDescription());
        existing.setSalary(job.getSalary());
        existing.setLocation(job.getLocation());
        existing.setCompany(job.getCompany());

        return jobrepo.save(existing);
    }

    @Override
    public void deleteJob(Integer id) {
        jobrepo.deleteById(id);
    }
	    
		

	

}
