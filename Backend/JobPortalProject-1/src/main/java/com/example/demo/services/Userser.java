package com.example.demo.services;

import com.example.demo.entities.User;

public interface Userser {
	
	User registerUser(User user);

	User loginUser(String email, String password);

}
