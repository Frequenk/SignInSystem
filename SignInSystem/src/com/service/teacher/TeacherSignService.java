package com.service.teacher;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.po.Teacher;

public interface TeacherSignService {

	public String startSign(int csmajor_key, Model model) ;
	public String endSign(Model model,HttpSession session);
	public String toStartSign(Model model,HttpSession session);

}
