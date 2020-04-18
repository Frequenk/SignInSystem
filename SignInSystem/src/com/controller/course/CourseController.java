package com.controller.course;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.Course;
import com.service.course.CourseService;

@Controller
@RequestMapping("/course")
public class CourseController {
	@Autowired
	private CourseService courseService;
	
	@RequestMapping("/kechengguanli")
	public String toModify(@ModelAttribute Course course) {
		return "admin/kechengguanli";		
	}
	@RequestMapping("/modifyCourse")
	public String modifyCourse(@ModelAttribute Course course, Model model, HttpSession session) {
		return courseService.modifyCourse(course, model, session);
	}
	@RequestMapping("/selectCourse")
	public String selectCourse(@ModelAttribute Course course, Model model) {
		return courseService.selectCourse(course,model);
	}
}
