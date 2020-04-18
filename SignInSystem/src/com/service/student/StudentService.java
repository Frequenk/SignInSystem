package com.service.student;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.po.Student;



public interface StudentService {
	public String login(Student student, Model model, HttpSession session);
	public Student yanzhengSnum(Student student);
	public Student yanzhengSpwd(Student student, HttpSession session);
	public String modifyTel(Student student, Model model, HttpSession session);
	public String modifyPwd(Student student, Model model, HttpSession session);
	public String toMain(Model model,HttpSession session);
	public String see(Model model, HttpSession session);
	public String modifyStudent(Student student, Model model, HttpSession session);
	public String selectStudent(Student student,Model model);
	public String delstuBysnum(String snum,Model model);
	public String updstuBysnum(String snum,Model model);

}
