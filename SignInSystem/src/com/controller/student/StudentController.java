package com.controller.student;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.po.Student;
import com.service.student.StudentService;
@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	@RequestMapping("/student")
	public String toLogin(@ModelAttribute Student student) {
		System.out.println("这里是student的toLogin");
		return "student/login";
	}
	@RequestMapping("/student/login")
	public String login(@ModelAttribute Student student, Model model, HttpSession session) {
		return studentService.login(student, model, session);
	}
	@RequestMapping("/student/exit")
	public String exit(@ModelAttribute Student student,HttpSession session) {
		session.invalidate();
		return "student/login";
	}
	@CrossOrigin
	@RequestMapping("/student/yanzhengSnumJson")
	@ResponseBody
	public Student yanzhengSnumJson(@RequestBody Student student) {
		System.out.println("这里是student的yanzhengSnumJson");
		//打印接收JSON格式数据
		Student s=null;
		s=studentService.yanzhengSnum(student);
		//返回JSON格式的相应
			return s;
	}
	@RequestMapping("/student/yanzhengSpwdJson")
	@ResponseBody
	public Student yanzhengSpwdJson(@RequestBody Student student,HttpSession session) {
		System.out.println("这里是student的yanzhengSpwdJson");
		//打印接收JSON格式数据
		Student s=null;
		s=studentService.yanzhengSpwd(student,session);
		//返回JSON格式的相应
			return s;
	}
}
