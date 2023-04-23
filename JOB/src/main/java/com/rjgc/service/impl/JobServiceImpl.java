package com.rjgc.service.impl;

import com.rjgc.mapper.JobMapper;
import com.rjgc.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobServiceImpl implements JobService {

    @Autowired
    private JobMapper jobMapper;

    @Override
    public List getAllJobs() {
        return jobMapper.selectList(null);
    }
}
