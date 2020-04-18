package com.dao.course;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Course;

@Repository("courseDao")
@Mapper
public interface CourseDao {
	public int modifyCourse(Course course) ;
	public List<Course> selectCourse(Course course);
	//public String selectCourse(Course course);
	public int delcouBycsname(String csname);
	public int updcouBycsname(String csname);
}
