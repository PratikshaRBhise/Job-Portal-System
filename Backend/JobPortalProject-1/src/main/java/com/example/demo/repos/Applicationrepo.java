package com.example.demo.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.Application;
import com.example.demo.entities.Job;
import com.example.demo.entities.User;


public interface Applicationrepo extends JpaRepository<Application, Integer> {

	List<Application> findByUser(User user);
    List<Application> findByJob(Job job);

}
