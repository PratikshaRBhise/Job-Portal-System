package com.example.demo.daos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Application;
import com.example.demo.entities.User;
import com.example.demo.repos.Applicationrepo;
import com.example.demo.services.Applicationser;

@Service
public class Applicationdao implements Applicationser{

	@Autowired
	private Applicationrepo applicationrepo;
	@Override
	public Application applyJob(Application application) {
		// TODO Auto-generated method stub
		return applicationrepo.save(application);
	}
	@Override
	public List<Application> getApplicationsByUser(User user) {
		// TODO Auto-generated method stub
		return applicationrepo.findByUser(user);
	}
	
	

}
