package com.controller.student;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.Student;
import com.service.student.StudentService;


@Controller
@RequestMapping("/student")
public class StudentInfoController extends StudentBaseController{
	@Autowired
	private StudentService studentService;
	
	@RequestMapping("/modifyInfo")
	public String toModify(@ModelAttribute Student student) {
		return "student/modifyInfo";		
	}
	@RequestMapping("/main")
	public String toMain(Model model,HttpSession session) {
		return studentService.toMain(model,session);		
	}
	@RequestMapping("/select")
	public String select( Model model,HttpSession session) {
		return studentService.see(model,session);		
	}
	@RequestMapping("/modifyTel")
	public String modifyTel(@ModelAttribute Student student, Model model, HttpSession session) {
		return studentService.modifyTel(student, model, session);
	}
	@RequestMapping("/modifyPwd")
	public String modifyPwd(@ModelAttribute Student student, Model model, HttpSession session) {
		return studentService.modifyPwd(student, model, session);
	}

	

}
