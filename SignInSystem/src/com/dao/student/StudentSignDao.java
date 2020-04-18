package com.dao.student;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Course;
import com.po.Signin;
import com.po.Student;


  @Repository("studentSignDao")
  
  @Mapper 
  public interface StudentSignDao { 
	  public int startSign(Signin signin);
	  public Course getCourse(Student student); 
  
  }
 
