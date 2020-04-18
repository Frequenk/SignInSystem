package com.service.course;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.po.Admin;
import com.po.Course;

public interface CourseService {
	public String modifyCourse(Course course, Model model, HttpSession session);
	//public String selectCourse(Course course, Model model);
	public String selectCourse(Course course,Model model);
	public String delcouBycsname(String csname,Model model);
	public String updcouBycsname(String csname,Model model);
}
