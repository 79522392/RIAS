package com.rjgc.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("information")
public class Job {
    @TableId
    private Integer id;
    private String jobName;
    private String salary;
    private String degree;
    private String workYear;
    private String jobArea;
    private String companyName;
    private String companySize;
    private String industryType;
    private String jobHref;
    private String companyHref;
}
