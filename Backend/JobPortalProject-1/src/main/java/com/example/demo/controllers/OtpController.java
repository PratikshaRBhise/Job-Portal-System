package com.example.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.services.Otpser;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/otp")
public class OtpController {
	 @Autowired
	    private Otpser otpService;

	    @PostMapping("/send")
	    public String sendOtp(@RequestParam String email) {
	        otpService.sendOtp(email);
	        return "OTP sent successfully";
	    }

	    @PostMapping("/verify")
	    public String verifyOtp(
	        @RequestParam String email,
	        @RequestParam String otp) {

	        if (otpService.verifyOtp(email, otp)) {
	            return "OTP Verified";
	        } else {
	            return "Invalid OTP";
	        }
	    }
	}
	
	

