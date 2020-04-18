package com.controller.student;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.Course;
import com.service.student.StudentSignService;

@Controller
@RequestMapping("/student")
public class StudentSignController extends StudentBaseController {
	@Autowired
	private StudentSignService studentSignService;

	@RequestMapping("/startSign")
	public String toStartSign(@ModelAttribute Course course) {
		return "student/startSign";
	}

	@RequestMapping("/getSign/{csmajor_key}/{siaddr}")
	public String putSign(@PathVariable("csmajor_key") Integer csmajor_key,@PathVariable("siaddr") String siaddr, Model model, HttpSession session) {
		System.out.println("你要签到的课号是" + csmajor_key+"你的地址是"+siaddr);
		return studentSignService.startSign(csmajor_key, siaddr, model, session);
	}

}
