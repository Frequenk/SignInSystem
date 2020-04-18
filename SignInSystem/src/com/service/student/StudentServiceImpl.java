package com.service.student;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.student.StudentDao;
import com.dao.student.StudentSignDao;
import com.po.Course;
import com.po.Student;
import com.po.Teacher;

@Service("studentService")
@Transactional
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private StudentSignDao studentSignDao;

	@Override
	public String login(Student student, Model model, HttpSession session) {
		Student s;
		Course course;
		s = studentDao.login(student);

		if (s != null) {
			System.out.println("学生" + s.getSname() + "登录成功");
			session.setAttribute("Student", s);
			course=studentSignDao.getCourse(s);
			if(course!=null) {
				session.setAttribute("Course", course);
				model.addAttribute("msgCourse",course.getCsname()+"课程开始签到");
			}else {
				model.addAttribute("msgCourse","当前没有需要签到的课程");

			}
			
			return "student/main";
		}
		model.addAttribute("msg", "账号或密码错误");
		return "student/login";
	}

	@Override
	public Student yanzhengSnum(Student student) {
		Student s = null;
		s = studentDao.yanzhengSnum(student);
		return s;
	}
	
	@Override
	public Student yanzhengSpwd(Student student, HttpSession session) {
		Student s = (Student) session.getAttribute("Student");
		student.setSnum(s.getSnum());
		s = studentDao.yanzhengSpwd(student);
		return s;
	}

	@Override
	public String modifyTel(Student student, Model model, HttpSession session) {
		Student s = (Student) session.getAttribute("Student");
		s.setStel(student.getStel());
		if (studentDao.modifyTel(s) > 0) {
			session.setAttribute("Student", s);
			model.addAttribute("msgTel", "更改成功,");
			return "student/modifyInfo";
		}
		model.addAttribute("msgTel", "更改失败,");
		return "student/modifyInfo";

	}
	
	  @Override public String modifyPwd(Student student, Model model, HttpSession session) {
			Student s = (Student) session.getAttribute("Student");
			s.setSpwd(student.getSpwd());
			if (studentDao.modifyPwd(s) > 0) {
				model.addAttribute("msgPwd", "密码更改成功");
				s.setSpwd(null);
				return "student/modifyInfo";
			}
			model.addAttribute("msgPwd", "密码更改失败");
			return "student/modifyInfo";
	  
	  }
		@Override
		public String toMain(Model model,HttpSession session) {
			Student student;
			Course course;
			student=(Student)session.getAttribute("Student");
			course=studentSignDao.getCourse(student);
			if(course!=null) {
					session.setAttribute("Course", course);
					model.addAttribute("msgCourse",course.getCsname()+"课程开始签到");
			}else
				model.addAttribute("msgCourse","当前没有需要签到的课程");


								
				return "student/main";
			}
		 @Override
			public String see(Model model, HttpSession session) {
				Student s = (Student) session.getAttribute("Student");
				List<HashMap<String,String>> signinlist = null;
				signinlist = studentDao.see(s);
				System.out.println(signinlist);
				model.addAttribute("signinlist", signinlist);
				return "student/see";

			}
		 @Override
			public String modifyStudent(Student student, Model model, HttpSession session) {

				if (studentDao.modifyStudent(student) > 0) {
					model.addAttribute("msg", "添加成功");
					return "admin/xueshengguanli";
				}
				model.addAttribute("msg", "添加失败");
				return "admin/xueshengguanli";
		  
		  }
		  @Override
			public String selectStudent(Student student,Model model){
				List<Student> s=studentDao.selectStudent(student);
				model.addAttribute("Student",s);
				return "admin/xueshengguanli";
				
			}
		  public String delstuBysnum(String snum,Model model) {
			  studentDao.delstuBysnum(snum);
			  return "admin/xueshengguanli";
		  }
		  public String updstuBysnum(String snum,Model model) {
			  studentDao.updstuBysnum(snum);
			  return "admin/xueshengguanli";
		  }
		
	  

}
