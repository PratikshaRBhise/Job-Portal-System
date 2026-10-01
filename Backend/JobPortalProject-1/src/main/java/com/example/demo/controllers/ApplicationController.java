package com.example.demo.controllers;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entities.*;
import com.example.demo.repos.Jobrepo;
import com.example.demo.repos.Userrepo;
import com.example.demo.services.Applicationser;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api/applications")
public class ApplicationController {

    @Autowired
    private Applicationser applicationService;

    @Autowired
    private Jobrepo jobrepo;

    @Autowired
    private Userrepo userrepo;

    private final String uploadDir = "C:/uploads/";

    @PostMapping("/apply")
    public Application applyJob(
            @RequestParam("userId") int userId,
            @RequestParam("jobId") int jobId,
            @RequestParam("resume") MultipartFile file) throws IOException {

        if (userrepo.findById(userId).isEmpty()) {
            throw new RuntimeException("User not found");
        }

        if (jobrepo.findById(jobId).isEmpty()) {
            throw new RuntimeException("Job not found");
        }

        File folder = new File(uploadDir);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        File dest = new File(uploadDir + fileName);

        file.transferTo(dest);

        
        Application application = new Application();

        User user = new User();
        user.setId(userId);

        Job job = new Job();
        job.setJobId(jobId);

        application.setUser(user);
        application.setJob(job);
        application.setAppliedDate(LocalDateTime.now());
        application.setResume(fileName);
        application.setStatus(ApplicationStatus.APPLIED);

        return applicationService.applyJob(application);
    }
}