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
<div style="padding: 30px 50px 0px;">
	<form class="bs-example bs-example-form" role="form">
		<c:forEach items="${courseList}" var="course">
			<button type="button" class="btn btn-primary" style="width:140px; height:140px; border-radius:50%; margin:5px; background-color:rgba(53,134,255,0.6);word-wrap: break-word !important; word-break: break-all !important; white-space: normal !important;" onclick="window.location.href='attendance/select/${course.csmajor_key}/0/20/2020-03-25'"><span style="font-weight:100;font-size: 15px;">${course.csname}<br>${course.cname}</span></button>
		</c:forEach>
	</form>
</div>
</body>
</html>