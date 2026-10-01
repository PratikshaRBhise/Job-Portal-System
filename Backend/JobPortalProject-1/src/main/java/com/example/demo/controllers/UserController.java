package com.example.demo.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dto.LoginRequest;
import com.example.demo.dto.UserResponse; // ✅ Added DTO import
import com.example.demo.entities.User;
import com.example.demo.services.Userser;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api/users")
public class UserController {

    @Autowired
    private Userser userser;

    // Register user
    @PostMapping("/register")
    public UserResponse registerUser(@RequestBody User user) {
        User savedUser = userser.registerUser(user);

        // Convert User entity to DTO to hide password
        
        return new UserResponse(
            savedUser.getId(),
            savedUser.getName(),
            savedUser.getEmail(),
            savedUser.getPhone(),
            savedUser.getRole(),
            savedUser.getCreatedAt()
        );
    }

    // Login user
    @PostMapping("/login")
    public UserResponse loginUser(@RequestBody LoginRequest request) {
        User user = userser.loginUser(request.getEmail(), request.getPassword());

        // Convert User entity to DTO to hide password
        return new UserResponse(
            user.getId(),
            user.getName(),
            user.getEmail(),
            user.getPhone(),
            user.getRole(),
            user.getCreatedAt()
        );
    }
    @PostMapping("/forgot-password")
    public String forgotPassword(@RequestBody Map<String, String> request) {

        String email = request.get("email");

        // simple check
        if (email == null || email.isEmpty()) {
            return "Email required";
        }

        // 👉 For now just test
        System.out.println("Reset link sent to: " + email);

        return "Reset link sent successfully";
    }
}