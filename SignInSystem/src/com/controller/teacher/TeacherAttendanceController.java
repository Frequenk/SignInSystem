package com.controller.teacher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.Course;
import com.po.Teacher;
import com.service.teacher.TeacherService;

@Controller
@RequestMapping("/teacher/attendance")
public class TeacherAttendanceController extends TeacherBaseController{
	@Autowired
	private TeacherService TeacherService;
	
	@RequestMapping("/select/{coursekey}/{page}/{num}/{coursetime}")
	public String selectbycoursetime(@PathVariable int coursekey,@PathVariable int page,@PathVariable int num,@PathVariable String coursetime,Model model) {
		return TeacherService.seebycoursetime(model, coursekey, page, num, coursetime);		
	}
}
