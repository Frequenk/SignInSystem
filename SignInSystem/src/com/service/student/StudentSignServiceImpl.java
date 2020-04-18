package com.service.student;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dao.student.StudentSignDao;
import com.po.Signin;
import com.po.Student;
import com.utils.DateUtils;

@Service("studentSignService")
public class StudentSignServiceImpl implements StudentSignService {
	
	 @Autowired private StudentSignDao studentSignDao;
	 
	 public String startSign(int csmajor_key,String siaddr, Model model, HttpSession session) {
		 Student student=(Student)session.getAttribute("Student");
		Signin signin=new Signin();
		signin.setCsmajor_key(csmajor_key);
		signin.setSiaddr(siaddr);
		signin.setSidate(DateUtils.getFormatDate(new Date()));
		signin.setSmajor_key(student.getSmajor_key());
		
		 if (studentSignDao.startSign(signin) > 0) { 
			 model.addAttribute("msg","签到成功"); 
			 return "student/main"; 
			 }
		 
		model.addAttribute("msg", "当前没有需要签到的课程或者签到失败");
		return "student/main";
	}
}
