package com.service.teacher;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.socket.TextMessage;

import com.dao.teacher.TeacherSignDao;
import com.po.Teacher;
import com.websocket.MyHandler;

@Service("teacherSignService")
public class TeacherSignServiceImpl implements TeacherSignService {
	
	 @Autowired 
	 private TeacherSignDao teacherSignDao;


	public String startSign(int csmajor_key, Model model) {


		 if (teacherSignDao.startSign(csmajor_key) > 0) { 
			 model.addAttribute("msg","签到发送成功"); 

			 return "teacher/startSign"; 

		 }

		model.addAttribute("msg", "签到发送失败");
		return "teacher/startSign";
	}
	
	public String endSign(Model model,HttpSession session) {
		Teacher teacher=null;
		teacher=(Teacher)session.getAttribute("Teacher");
		if(teacherSignDao.endSign(teacher)>0) {
			 model.addAttribute("msg","已暂停所有课程"); 

			 return "teacher/startSign"; 
		}
		
		model.addAttribute("msg", "没有需要暂停签到的课程");
		return "teacher/startSign";
	}
	
	public String toStartSign(Model model,HttpSession session){
		List<HashMap<String,String>> course_class=null; 
		Teacher teacher=null;
		teacher=(Teacher)session.getAttribute("Teacher");
		System.out.println("teacher_key:"+teacher.getTmajor_key());
		course_class=teacherSignDao.getCourse_class(teacher);
		if(course_class!=null) {
			System.out.println("course_class:"+course_class.toString());
			session.setAttribute("course_class", course_class);
			model.addAttribute("msg", "以下是您所教学的课程：");
			return "teacher/startSign";
		}
		model.addAttribute("msg", "课程取出失败!");
		return "teacher/startSign";
	}
	
}
