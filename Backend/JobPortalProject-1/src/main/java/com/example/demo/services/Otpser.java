package com.example.demo.services;

public interface Otpser {

	void sendOtp(String email);

	boolean verifyOtp(String email, String otp);

}
