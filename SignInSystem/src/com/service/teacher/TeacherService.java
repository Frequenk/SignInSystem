package com.service.teacher;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.po.Teacher;



public interface TeacherService {
	public String login(Teacher teacher, Model model, HttpSession session);
	public Teacher yanzheng(Teacher teacher);
	public Teacher yanzhengTpwd(Teacher teacher, HttpSession session);
	public String modifyTel(Teacher teacher, Model model, HttpSession session);
	public String modifyPwd(Teacher teacher, Model model, HttpSession session);
	public String attendance(Model model, HttpSession session);
	public String seebycoursetime(Model model, int coursekey, int page, int num, String coursetime);
	public String modifyTeacher(Teacher teacher, Model model, HttpSession session);
	public String selectTeacher(Teacher teacher,Model model);
	public String delteaBytnum(String tnum,Model model);
	public String updteaBytnum(String tnum,Model model);
}
