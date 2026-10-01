package com.example.demo.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.Job;

public interface Jobrepo extends JpaRepository<Job, Integer> {

    // ✅ Custom search (optional - you can keep OR remove)
    List<Job> findByTitleContainingIgnoreCaseOrLocationContainingIgnoreCase(
        String keyword1, String keyword2
    );
}