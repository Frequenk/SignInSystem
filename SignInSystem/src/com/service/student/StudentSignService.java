package com.service.student;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface StudentSignService {

	public String startSign(int csmajor_key,String siaddr, Model model, HttpSession session) ;

}
