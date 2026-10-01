package com.example.demo.services;

import java.util.List;

import com.example.demo.entities.Application;
import com.example.demo.entities.User;

public interface Applicationser {

	Application applyJob(Application application);
	 List<Application> getApplicationsByUser(User user);
}

