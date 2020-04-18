package com.service.teacher;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.teacher.TeacherDao;
import com.dao.teacher.TeacherSignDao;
import com.po.Teacher;
@Service("teacherService")
@Transactional
public class TeacherServiceImpl implements TeacherService {
	@Autowired
	private TeacherDao teacherDao;
	 @Autowired 
	 private TeacherSignDao teacherSignDao;
	@Override
	public String login( Teacher teacher, Model model, HttpSession session) {
		Teacher t;
		t=teacherDao.login(teacher);	
		if( t!= null ) {
			System.out.println("教师"+t.getTname()+"登录成功");
			session.setAttribute("Teacher", t);
			return "teacher/main";
		}

		model.addAttribute("msg", "账号或密码错误");
		return "teacher/login";
	}
	
	@Override
	public Teacher yanzheng(Teacher teacher) {
		Teacher t=null;
		t=teacherDao.yanzheng(teacher);
		return t;
	}
	@Override
	public Teacher yanzhengTpwd(Teacher teacher, HttpSession session) {
		Teacher s = (Teacher) session.getAttribute("Teacher");
		teacher.setTnum(s.getTnum());
		s = teacherDao.yanzhengTpwd(teacher);
		return s;
	}
	@Override
	public String modifyTel(Teacher teacher, Model model, HttpSession session) {
		Teacher t = (Teacher) session.getAttribute("Teacher");
		t.setTtel(teacher.getTtel());
		if (teacherDao.modifyTel(t) > 0) {
			session.setAttribute("Teacher", t);
			model.addAttribute("msgTel", "更改成功,");
			return "teacher/modifyInfo";
		}
		model.addAttribute("msgTel", "更改失败,");
		return "teacher/modifyInfo";

	}
	
	  @Override public String modifyPwd(Teacher teacher, Model model, HttpSession session) {
		  	Teacher t = (Teacher) session.getAttribute("Teacher");
			t.setTpwd(teacher.getTpwd());
			if (teacherDao.modifyPwd(t) > 0) {
				model.addAttribute("msgPwd", "密码更改成功");
				t.setTpwd(null);
				return "teacher/modifyInfo";
			}
			model.addAttribute("msgPwd", "密码更改失败");
			return "teacher/modifyInfo";
	  
	  }
	  
	  @Override
	  public String attendance(Model model, HttpSession session){
		  Teacher t = (Teacher) session.getAttribute("Teacher");
		  model.addAttribute("courseList", teacherSignDao.getCourse_class(t));
		  return "teacher/attendance";
	  }
	  @Override
	  public String seebycoursetime(Model model, int coursekey, int page, int num, String coursetime){
		  List<HashMap<String,String>> signinlist = null;
		  List<String> coursetimelist = null;
		  List<String> list = new LinkedList<>();
		  String course2;
		  HashMap<String,Object> map=new HashMap<>();
		  HashMap<String,Object> map2=new HashMap<>();
		  model.addAttribute("page", page);
		  if(page==0) {
			  page=1;
		  }
		  int head = (page-1)*num;
		  map.put("coursekey", coursekey);
		  map.put("head", head);
		  map.put("num", num);
		  map.put("coursetime", coursetime);
		  map2.put("coursekey", coursekey);
		  map2.put("coursetime", coursetime);
		  coursetimelist = teacherDao.coursetime(coursekey);
		  list.add(coursetimelist.get(0).substring(0, 10));
		  
		  /*
		   * 
		   */
		  System.out.println("coursetimelist:"+coursetimelist.toString());
		  for(String course:coursetimelist) {
			  System.out.println("++++++"+course);
			  if(course!=null) {
			  course2 = course.substring(0, 10);//空指针异常，你看看
			  if(list.contains(course2)) {
				  continue;
			  }else {
				  list.add(course2);
			  }
			  }
		  }
		  System.out.println(list);
		  /*
		   * 
		   */
		  signinlist = teacherDao.selectbycoursetime(map);
		  int pagetotal = (teacherDao.signintotal(map2)/num);
		  if(teacherDao.signintotal(map2)%num!=0) {
			  pagetotal=pagetotal+1;
		  }
		  model.addAttribute("coursetimelist", list);
		  model.addAttribute("coursekey", coursekey);
		  model.addAttribute("pagetotal", pagetotal);
		  model.addAttribute("signinList", signinlist);
		  model.addAttribute("coursetime", coursetime);
		  return "teacher/see";
	  }
	  @Override
		public String modifyTeacher(Teacher teacher, Model model, HttpSession session) {

			if (teacherDao.modifyTeacher(teacher) > 0) {
				model.addAttribute("msg", "添加成功");
				return "admin/jiaoshiguanli";
			}
			model.addAttribute("msg", "添加失败");
			return "admin/jiaoshiguanli";
	  
	  }
		@Override
		public String selectTeacher(Teacher teacher,Model model){
			List<Teacher> t=teacherDao.selectTeacher(teacher);
			model.addAttribute("Teacher",t);
			return "admin/jiaoshiguanli";
			
		}
		public String delteaBytnum(String tnum,Model model) {
			  teacherDao.delteaBytnum(tnum);
			  return "admin/jiaoshiguanli";
		  }
		public String updteaBytnum(String tnum,Model model) {
			  teacherDao.updteaBytnum(tnum);
			  return "admin/jiaoshiguanli";
		  }
	
}
