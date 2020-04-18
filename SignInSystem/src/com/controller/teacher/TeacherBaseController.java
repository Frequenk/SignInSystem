package com.controller.teacher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.exception.AdminLoginNoException;
@Controller
public class TeacherBaseController {
	/**
	  登录权限控制，处理方法执行前执行该方法
	 * @throws AdminLoginNoException 
	 */
	@ModelAttribute  
    public void isLogin(HttpSession session, HttpServletRequest request) throws AdminLoginNoException {      
       if(session.getAttribute("Teacher") == null){  
            throw new AdminLoginNoException("没有登录");
       }  
    } 
}
