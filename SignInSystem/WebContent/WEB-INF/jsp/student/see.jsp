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
</head>
<body>
<div style="padding:10px 10px 10px">
	<button class="btn btn-default" style="width:50px; height:50px; border-radius:50%;border-color:transparent" onclick="window.history.go(-1);"><span class="glyphicon glyphicon-chevron-left"></span></button>
</div>
<div style="padding: 0px 20px 10px;">
	
	<table class="table">
		<thead>
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>课程</th>
				<th>地点</th>
				<th>日期</th>
				<th>状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${signinlist}" var="signin">
			<tr>
				<td>${signin.snum}</td>
				<td>${signin.sname}</td>
				<td>${signin.csname}</td>
				<td>${signin.siaddr}</td>
				<td>${signin.sidate}</td>
				<td>${signin.sistate}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>