package com.rjgc.controller;

import com.rjgc.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/Job")
public class JobController {
    @Autowired
    private JobService jobService;

    @GetMapping("/all")
    public List getAllJobs(){
        return jobService.getAllJobs();
    }
}
