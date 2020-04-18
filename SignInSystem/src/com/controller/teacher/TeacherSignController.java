package com.controller.teacher;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.TextMessage;

import com.po.Course;
import com.service.teacher.TeacherSignService;
import com.websocket.MyHandler;


@Controller
@RequestMapping("/teacher")
public class TeacherSignController extends TeacherBaseController {
	@Autowired
	private TeacherSignService teacherSignService;
	@Autowired 
	private  MyHandler handler;

	@RequestMapping("/startSign")
	public String toStartSign(Model model,HttpSession session) {
		
		return teacherSignService.toStartSign(model, session);
	}
	@RequestMapping("/endSign")
	public String endSign(Model model,HttpSession session) {
		
		return teacherSignService.endSign(model, session);
	}

	@RequestMapping("/putSign/{csmajor_key}/{csname}")
	public String putSign(@PathVariable("csmajor_key") Integer csmajor_key,@PathVariable("csname")String csname, Model model) {
		System.out.println("你要推送签到的课是" + csmajor_key+"      "+csname);
		  boolean hasSend = handler.sendMessageToAllUsers(new TextMessage(csmajor_key+"  "+csname));
	       System.out.println("签到是否发送成功"+hasSend);

		return teacherSignService.startSign(csmajor_key, model);
	}

}
