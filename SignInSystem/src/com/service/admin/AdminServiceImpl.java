package com.service.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.admin.AdminDao;
import com.po.Admin;
import com.po.Course;
import com.po.Student;
import com.po.Class;

@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao admintDao;
	@Override
	public String login( Admin admin, Model model, HttpSession session) {
		Admin a;
		a=admintDao.login(admin);
		
		if( a!= null ) {
			System.out.println("管理员"+a.getAnum()+"登录成功");
			session.setAttribute("Admin", a);
			return "admin/main";
		}
		model.addAttribute("msg", "账号或密码错误");
		return "admin/login";
	}
	
	@Override
	public Admin yanzheng(Admin admin) {
		Admin a=null;
		a=admintDao.yanzheng(admin);
		return a;
	}
	@Override
	public String xueshengguanli( Admin admin, Model model, HttpSession session) 
	{
		return "admin/xueshengguanli";
	}
	@Override
	public String jiaoshiguanli( Admin admin, Model model, HttpSession session) 
	{
		return "admin/jiaoshiguanli";
	}
	@Override
	public String kechengguanli( Admin admin, Model model, HttpSession session) 
	{
		return "admin/kechengguanli";
	}
	@Override
	public String ImportCourse( Admin admin, Model model, HttpSession session) 
	{
		return "admin/ImportCourse";
	}
	/* 66 */
	@Override
	public String totianjiabanji(Model model) {
		List<Course> courselist = admintDao.selectcourse();
		model.addAttribute("courselist", courselist);
		return "admin/tianjiabanji";
	}
	@Override
	public Student yanzhengstudent(Student student) {
		Student stu = admintDao.selectstudent(student);
		return stu;
	}
	@Override
	public int tianjiaxuesheng(Model model,int coursekey,String snum,String cname) {
		int skey=admintDao.selectstudentbysnum(snum);
		Class c = new Class();
		c.setCsmajor_key(coursekey);
		c.setSmajor_key(skey);
		c.setCname(cname);
		return admintDao.tianjiaxuesheng(c);
	}
	@Override
	public Class cunzaicourse(int coursekey,String snum,String cname) {
		int skey=admintDao.selectstudentbysnum(snum);
		Class c = new Class();
		c.setCsmajor_key(coursekey);
		c.setSmajor_key(skey);
		c.setCname(cname);
		return admintDao.cunzaicourse(c);
	}
	
}
