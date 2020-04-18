package com.service.course;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.admin.AdminDao;
import com.dao.course.CourseDao;
import com.po.Admin;
import com.po.Course;
import com.service.admin.AdminService;
@Service("courseService")
@Transactional
public class CourseServiceImpl implements CourseService{
	@Autowired
	private CourseDao courseDao;
	@Override
	public String modifyCourse(Course course, Model model, HttpSession session) {

		if (courseDao.modifyCourse(course) > 0) {
			model.addAttribute("msg", "课程开设成功");
			return "admin/kechengguanli";
		}
		model.addAttribute("msg", "课程开设失败");
		return "admin/kechengguanli";
  
  }
	@Override
	public String selectCourse(Course course,Model model){
		List<Course> c=courseDao.selectCourse(course);
		model.addAttribute("Course",c);
		return "admin/kechengguanli";
		
	}
	public String delcouBycsname(String csname,Model model) {
		  courseDao.delcouBycsname(csname);
		  return "admin/kechengguanli";
	  }
	public String updcouBycsname(String csname,Model model) {
		  courseDao.updcouBycsname(csname);
		  return "admin/kechengguanli";
	  }
}

