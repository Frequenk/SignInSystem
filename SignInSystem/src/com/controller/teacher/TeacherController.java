package com.controller.teacher;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.po.Teacher;
import com.service.teacher.TeacherService;
@Controller
public class TeacherController {
	@Autowired
	private TeacherService teacherService;
	@RequestMapping("/teacher")
	public String toLogin(@ModelAttribute Teacher teacher) {
		System.out.println("这里是teacher的toLogin");
		return "teacher/login";
	}
	@RequestMapping("/teacher/login")
	public String login(@ModelAttribute Teacher teacher, Model model, HttpSession session) {
		return teacherService.login(teacher, model, session);
	}
	@RequestMapping("/teacher/exit")
	public String exit(@ModelAttribute Teacher teacher,HttpSession session) {
		session.invalidate();
		return "teacher/login";
	}
	@CrossOrigin
	@RequestMapping("/teacher/yanzhengJson")
	@ResponseBody
	public Teacher yanzhengJson(@RequestBody Teacher teacher) {
		System.out.println("这里是teacher的testJson");
		//打印接收JSON格式数据
		Teacher t=null;
		t=teacherService.yanzheng(teacher);
		//返回JSON格式的相应
			return t;
	}
	@RequestMapping("/teacher/yanzhengTpwdJson")//佳豪写的
	@ResponseBody
	public Teacher yanzhengTpwdJson(@RequestBody Teacher teacher,HttpSession session) {
		System.out.println("这里是Teacher的yanzhengTpwdJson");
		//打印接收JSON格式数据
		Teacher t=null;
		t=teacherService.yanzhengTpwd(teacher,session);
		//返回JSON格式的相应
			return t;
	}

}
