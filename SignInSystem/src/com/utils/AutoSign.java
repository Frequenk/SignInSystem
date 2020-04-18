package com.utils;

import java.io.IOException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.teacher.TeacherSignDao;
import com.po.Course;
@Service("autoService")


public class AutoSign {
	@Autowired
	TeacherSignDao teacherSignDao;

	public void autoStartSign() throws IOException{
		 System.out.println("签到自动发送时间"+ new Date());
		 Course course=new Course();
		 //第几节课
		 course.setCsno(2);
		 teacherSignDao.autoStartSign(course);
	}
	public void autoEndSign() throws IOException{
		 System.out.println("签到自动结束时间"+ new Date());
		 teacherSignDao.autoEndSign();
	}

}
