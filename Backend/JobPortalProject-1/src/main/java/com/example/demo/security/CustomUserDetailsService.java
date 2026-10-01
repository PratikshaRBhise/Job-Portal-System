package com.example.demo.security;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.entities.User;
import com.example.demo.repos.Userrepo;

@Service
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private Userrepo userrepo;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		User user = userrepo.findByEmail(email);
		
		if(user == null) {
			throw new UsernameNotFoundException("User not found");
		}
		 return new org.springframework.security.core.userdetails.User(
	                user.getEmail(),
	                user.getPassword(),
	                Collections.singleton(new SimpleGrantedAuthority(user.getRole().name()))
	        );
	}

}
