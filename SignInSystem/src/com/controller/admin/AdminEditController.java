package com.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.po.Admin;
import com.po.Course;
import com.po.Student;
import com.po.Teacher;
import com.service.admin.AdminService;
import com.service.course.CourseService;
import com.service.student.StudentService;
import com.service.teacher.TeacherService;
@Controller
public class AdminEditController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private StudentService studentService;
	@RequestMapping("/admin/xueshengguanli")
	public String xueshengguanli(@ModelAttribute Student student,Model model,HttpSession session) {
		//session.invalidate();
		return "admin/xueshengguanli";
	}
	@RequestMapping("/admin/jiaoshiguanli")
	public String jiaoshiguanli(@ModelAttribute Teacher teacher,Model model,HttpSession session) {
		//session.invalidate();
		return "admin/jiaoshiguanli";
	}
	@RequestMapping("/admin/kechengguanli")
	public String kechengguanli(@ModelAttribute Course course,Model model,HttpSession session) {
		//session.invalidate();
		return "admin/kechengguanli";
	}
	@RequestMapping("/admin/ImportCourse")
	public String ImportCourse(@ModelAttribute Admin admin,Model model,HttpSession session) {
		//session.invalidate();
		return "admin/ImportCourse";
	}
	@RequestMapping("admin/modifyCourse")
	public String modifyCourse(@ModelAttribute Course course, Model model, HttpSession session) {
		return courseService.modifyCourse(course, model, session);
	}
	@RequestMapping("admin/selectCourse")
	public String selectCourse(@ModelAttribute Course course,Model model) {
		return courseService.selectCourse(course,model);
	}
	@RequestMapping("admin/selectTeacher")
	public String selectTeacher(@ModelAttribute Teacher teacher,Model model) {
		return teacherService.selectTeacher(teacher,model);
	}
	@RequestMapping("admin/selectStudent")
	public String selectStudent(@ModelAttribute Student student,Model model) {
		return studentService.selectStudent(student,model);
	}
	@RequestMapping("admin/modifyTeacher")
	public String modifyTeacher(@ModelAttribute Teacher teacher, Model model, HttpSession session) {
		return teacherService.modifyTeacher(teacher, model, session);
	}
	@RequestMapping("admin/modifyStudent")
	public String modifyStudent(@ModelAttribute Student student, Model model, HttpSession session) {
		return studentService.modifyStudent(student, model, session);
	}
	//删除学生
	@RequestMapping("admin/delstuBysnum/{snum}")
	public String delstuBysnum(@PathVariable String snum,Model model,@ModelAttribute Student student) {
		return studentService.delstuBysnum(snum,model);
	}
	//修改学生
	@RequestMapping("admin/updstuBysnum/{snum}")
	public String updstuBysnum(@PathVariable String snum,Model model,@ModelAttribute Student student) {
		return studentService.updstuBysnum(snum,model);
	}
	//删除教师
	@RequestMapping("admin/delteaBytnum/{tnum}")
	public String delteaBytnum(@PathVariable String tnum,Model model,@ModelAttribute Teacher teacher) {
		return teacherService.delteaBytnum(tnum,model);
	}
	//修改教师
	@RequestMapping("admin/updteaBytnum/{tnum}")
	public String updteaBytnum(@PathVariable String tnum,Model model,@ModelAttribute Teacher teacher) {
		return teacherService.updteaBytnum(tnum,model);
	}
	//删除课程
	@RequestMapping("admin/delcouBycsname/{csname}")
	public String delcouBycsname(@PathVariable String csname,Model model,@ModelAttribute Course course) {
		return courseService.delcouBycsname(csname,model);
	}
	//修改课程
		@RequestMapping("admin/updcouBycsname/{csname}")
		public String updcouBycsname(@PathVariable String csname,Model model,@ModelAttribute Course course) {
			return courseService.updcouBycsname(csname,model);
		}

	

}
