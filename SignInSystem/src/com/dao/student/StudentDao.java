package com.dao.student;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.po.Student;



@Repository("studentDao")
@Mapper
public interface StudentDao {
	public Student login(Student student);
	public Student yanzhengSnum(Student student);
	public Student yanzhengSpwd(Student student);
	public int modifyTel(Student student);
	public int modifyPwd(Student student);
	public List<HashMap<String,String>> see(Student student);
	public int modifyStudent(Student student);
	public List<Student> selectStudent(Student student);
	public int delstuBysnum(String snum);
	public int updstuBysnum(String snum);
	//int返回值本来表示的是匹配到的数据行数，我在连接池的url后加了一个参数，现在这个int返回值表示的是影响的行数
}
