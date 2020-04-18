package com.dao.teacher;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Course;
import com.po.Teacher;



@Repository("teacherDao")
@Mapper
public interface TeacherDao {
	public Teacher login(Teacher teacher);
	public Teacher yanzheng(Teacher teacher);
	public Teacher yanzhengTpwd(Teacher teacher);
	public int modifyTel(Teacher teacher);
	public int modifyPwd(Teacher teacher);
	public List<Course> attendance(Teacher teacher);
	public List<HashMap<String,String>> selectbycoursetime(Map<String,Object> map);
	public int signintotal(Map<String,Object> map);
	public List<String> coursetime(int coursekey);
	public int modifyTeacher(Teacher teacher);
	public List<Teacher> selectTeacher(Teacher teacher);
	public int delteaBytnum(String tnum);
	public int updteaBytnum(String tnum);
}
