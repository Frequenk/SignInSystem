package com.dao.admin;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.po.Admin;
import com.po.Course;
import com.po.Student;
import com.po.Class;




@Repository("adminDao")
@Mapper
public interface AdminDao {
	public Admin login(Admin admin);
	public Admin yanzheng(Admin admin);
	public Admin xueshengguanli(Admin admin);
	public Admin ImportCourse(Admin admin);
	/* 66 */
	public List<Course> selectcourse();
	public Student selectstudent(Student student);
	public int tianjiaxuesheng(Class c);
	public int selectstudentbysnum(String snum);
	public Class cunzaicourse(Class c);
}
