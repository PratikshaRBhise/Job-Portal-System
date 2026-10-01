package com.example.demo.daos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.entities.User;
import com.example.demo.repos.Userrepo;
import com.example.demo.services.Userser;

@Service
public class Userdao implements Userser {

	@Autowired
	private Userrepo userrepo;                                                                                         
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public User registerUser(User user) {

	
	    if (user.getRole() == null) {
	        user.setRole(com.example.demo.entities.Role.JOBSEEKER); 
	    }

	
	    user.setPassword(passwordEncoder.encode(user.getPassword()));

	    
	    if (user.getCreatedAt() == null) {
	        user.setCreatedAt(java.time.LocalDateTime.now());
	    }

	    
	    return userrepo.save(user);
	}

	@Override
	public User loginUser(String email, String password) {
		// TODO Auto-generated method stub
		 User user = userrepo.findByEmail(email);

		    if (user != null &&
		        passwordEncoder.matches(password, user.getPassword())) {

		        return user;   
		    }

		    
		    throw new RuntimeException("Invalid email or password");
	
		   
		
	}
}
	
	
	
	

