package com.service.admin;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.po.Admin;
import com.po.Student;
import com.po.Class;



public interface AdminService {
	public String login(Admin Admin, Model model, HttpSession session);
	public Admin yanzheng(Admin admin);
	public String xueshengguanli(Admin Admin, Model model, HttpSession session);
	public String jiaoshiguanli(Admin Admin, Model model, HttpSession session);
	public String kechengguanli(Admin Admin, Model model, HttpSession session);
	public String ImportCourse(Admin Admin, Model model, HttpSession session);
	/* 66 */
	public String totianjiabanji(Model model);
	public Student yanzhengstudent(Student student);
	public int tianjiaxuesheng(Model model,int coursekey,String snum,String cname);
	public Class cunzaicourse(int coursekey,String snum,String cname);
}
