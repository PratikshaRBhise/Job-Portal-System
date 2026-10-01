package com.example.demo.daos;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.example.demo.services.Otpser;

@Service
public class Otpdao implements Otpser{

	  private Map<String, String> otpStorage = new HashMap<>();

	    @Autowired
	    private MailSender mailSender;
	@Override
	public void sendOtp(String email) {
		// TODO Auto-generated method stub
		 String otp = String.valueOf((int)(Math.random()*900000)+100000);

	        otpStorage.put(email, otp);

	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(email);
	        message.setSubject("Job Application OTP");
	        message.setText("Your OTP is: " + otp);

	        mailSender.send(message);
	    }
	

	@Override
	public boolean verifyOtp(String email, String otp) {
		// TODO Auto-generated method stub
		
		 String storedOtp = otpStorage.get(email);

	        return otp != null && otp.equals(storedOtp);
	    }
	}


