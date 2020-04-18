<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
    	$("#snum").blur(function() {
    		var snum = this.value;
    			$.ajax({
    				//请求路径
    				url : "${pageContext.request.contextPath }/admin/yanzhengstudentJson",
    				//请求类型
    				type : "post",
    				//data表示发送的数据
    				data : JSON.stringify({snum:snum}),
    				//定义发送请求的数据格式为JSON字符串
    				contentType : "application/json;charset=utf-8",
    				//定义回调响应的数据格式为JSON字符串，该属性可以省略
    				dataType : "json",
    				//成功响应的结果
    				
    				error : function(){
    					alert("该学生不存在！");
				}
    		});
    	});//end of blur()
    });
    
    function submit(){
    	var course=document.getElementById("typeController").value;
    	var snum=document.getElementById("snum").value;
    	var cname=document.getElementById("cname").value;
    	$.ajax({
			//请求路径
			url : "${pageContext.request.contextPath }/admin/tianjiaxuesheng/"+course+"/"+snum+"/"+cname,
			//请求类型
			type : "post",
			//定义发送请求的数据格式为JSON字符串
			contentType : "application/json;charset=utf-8",
			//定义回调响应的数据格式为JSON字符串，该属性可以省略
			dataType : "json",
			//成功响应的结果
			success:function(data){
				alert(data.mas);
			},
			error : function(){
				alert("出错");
		}
	});
    	
    }
    </script>
</head>
<body>
<div style="width: 250px;margin: 200px 600px ">
    <div class="form-group">
        <label for="name">输入班级名称</label>
        <input type="text" class="form-control" id="cname" placeholder="班级名称">
    </div>
    <div class="form-group">
        <label for="name">选择课程</label>
        <select class="form-control" id="typeController">
            <c:forEach items="${courselist}" var="course"><option value="${course.csmajor_key}">${course.csname}</option></c:forEach>
        </select>
    </div>
    <div class="form-group">
        <label for="name">输入学号</label>
        <input type="text" class="form-control" id="snum" placeholder="学号">
    </div>
    <button class="btn btn-default" onclick="submit()">确定</button>
</div>
</body>
</html>