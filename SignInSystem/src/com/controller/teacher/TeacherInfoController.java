package com.controller.teacher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.Teacher;
import com.service.teacher.TeacherService;

@Controller
@RequestMapping("/teacher")
public class TeacherInfoController extends TeacherBaseController {
	@Autowired
	private TeacherService teacherService;


	@RequestMapping("/main")
	public String toMain(@ModelAttribute Teacher teacher) {
		return "teacher/main";
	}
	@RequestMapping("/modifyInfo")
	public String toModify(@ModelAttribute Teacher teacher) {
		return "teacher/modifyInfo";		
	}

	
	@RequestMapping("/modifyTel")
	public String modifyTel(@ModelAttribute Teacher teacher, Model model, HttpSession session) {
		return teacherService.modifyTel(teacher, model, session);
	}
	@RequestMapping("/modifyPwd")
	public String modifyPwd(@ModelAttribute Teacher teacher, Model model, HttpSession session) {
		return teacherService.modifyPwd(teacher, model, session);
	}
	@RequestMapping("/attendance")
	public String toAttendance(Model model,HttpSession session) {
		return teacherService.attendance(model, session);
	}



}
