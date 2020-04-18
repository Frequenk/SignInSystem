<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员主页</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="jumbotron">
        <h1>管理员主页</h1>
        <p>欢迎${Admin.anum}<a href="exit" class="btn btn-primary" role="button">注销</a></p>
        <p><a href="kechengguanli" class="btn btn-primary btn-lg" role="button">课程管理</a></p>
        <p><a href="xueshengguanli" class="btn btn-primary btn-lg" role="button">学生管理</a></p>
        <p><a href="jiaoshiguanli" class="btn btn-primary btn-lg" role="button">教师管理</a></p>
    	<p><a href="tianjiabanji" class="btn btn-primary btn-lg" role="button" >添加班级</a></p>
    	
    </div>
</div>

</body>
</html>