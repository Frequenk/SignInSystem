package com.dao.teacher;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Course;
import com.po.Teacher;


  @Repository("teacherSignDao")
  
  @Mapper 
  public interface TeacherSignDao { 
	  public int startSign(int csmajor_key); 
	  public List<HashMap<String,String>> getCourse_class(Teacher teacher);
	  public int endSign(Teacher teacher);
	  public int autoStartSign(Course course);
	  public int autoEndSign();

  }
 
