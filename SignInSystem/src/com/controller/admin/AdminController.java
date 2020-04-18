package com.controller.admin;

import java.util.HashMap;
import java.util.Map;

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
import com.po.Student;
import com.service.admin.AdminService;
@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	@RequestMapping("/admin")
	public String toLogin(@ModelAttribute Admin admin) {
		System.out.println("这里是admin的toLogin");
		return "admin/login";
	}
	@RequestMapping("/admin/login")
	public String login(@ModelAttribute Admin admin, Model model, HttpSession session) {
		return adminService.login(admin, model, session);
	}
	@RequestMapping("/admin/exit")
	public String exit(@ModelAttribute Admin admin,HttpSession session) {
		session.invalidate();
		return "admin/login";
	}
	@CrossOrigin
	@RequestMapping("/admin/yanzhengJson")
	@ResponseBody
	public Admin yanzhengJson(@RequestBody Admin Admin) {
		System.out.println("这里是testJson");
		//打印接收JSON格式数据
		Admin a=null;
		a=adminService.yanzheng(Admin);
		//返回JSON格式的相应
			return a;
	}
	/* 66 */
	@RequestMapping("/admin/tianjiabanji")
	public String totianjiabanji(Model model) {
		return adminService.totianjiabanji(model);
	}
	
	@CrossOrigin
	@RequestMapping("/admin/yanzhengstudentJson")
	@ResponseBody
	public Student yanzhengJson(@RequestBody Student Student) {
		System.out.println("这里是testJson");
		//打印接收JSON格式数据
		Student s=null;
		s=adminService.yanzhengstudent(Student);
		//返回JSON格式的相应
			return s;
	}
	@CrossOrigin
	@RequestMapping("/admin/tianjiaxuesheng/{coursekey}/{snum}/{cname}")
	@ResponseBody
	public Map<String,Object> tianjiaxuesheng(@PathVariable int coursekey,@PathVariable String snum,@PathVariable String cname,Model model) {
		String mas = new String();
		Map<String,Object> map = new HashMap<String,Object>();
		if(adminService.cunzaicourse(coursekey, snum,cname)!=null) {
			mas = "该记录已存在";
		}else if(adminService.tianjiaxuesheng(model,coursekey,snum,cname)==1) {
			mas = "成功";
		}else {
			mas = "失败";
		}
		System.out.println(mas);
		map.put("mas", mas);
		return map;
	}

}
