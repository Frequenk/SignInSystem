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

		$(document).ready(function(){
			$("#typeController").val("${coursetime}");
		})
		function pageadd1(csmajor_key,page,maxpage){
			var page=Number(page);
			var csmajor_key=Number(csmajor_key);
			var maxpage=Number(maxpage);
			var coursetime=document.getElementById("typeController").value;
			if(page+1>maxpage){
				page=maxpage
			}else{
				page=page+1
			}
			window.location.href="/SignInSystem/teacher/attendance/select/"+csmajor_key+"/"+page+"/20/"+coursetime;
		}
		function pagesub1(csmajor_key,page){
			var page=Number(page);
			var csmajor_key=Number(csmajor_key);
			var coursetime=document.getElementById("typeController").value;
			if(page-1<0){
				page=1
			}else{
				page=page-1
			}
			window.location.href="/SignInSystem/teacher/attendance/select/"+csmajor_key+"/"+page+"/20/"+coursetime;
		}
		function select(csmajor_key,page,maxpage){
			var page=Number(page);
			var csmajor_key=Number(csmajor_key);
			var coursetime=document.getElementById("typeController").value;
			if(page+1>maxpage){
				page=maxpage
			}
			window.location.href="/SignInSystem/teacher/attendance/select/"+csmajor_key+"/"+page+"/20/"+coursetime;
		}
		
		function printpage(){
			window.print();
		}
	</script>
</head>
<body>
<input type="button" value="打印此页面" onclick="printpage()" />
<div style="padding:10px 10px 10px">
	<button class="btn btn-default" style="width:50px; height:50px; border-radius:50%;border-color:transparent" onclick="window.history.go(-1);"><span class="glyphicon glyphicon-chevron-left"></span></button>
</div>
<div style="padding: 0px 20px 10px;">
	<label for="name">选择课时</label>
	<div style="width:200px">
		<select class="form-control" id="typeController">
    		<c:forEach items="${coursetimelist}" var="coursetime"><option value="${coursetime}">${coursetime}</option></c:forEach>
    	</select>
    	<button class="btn btn-default" onclick="select(${coursekey},${page},${pagetotal})">确定</button>
	</div>
    
	<table class="table">
		<thead>
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>地点</th>
				<th>日期</th>
				<th>状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${signinList}" var="signin">
			<tr>
				<td>${signin.snum}</td>
				<td>${signin.sname}</td>
				<td>${signin.siaddr}</td>
				<td>${signin.sidate}</td>
				<td>${signin.sistate}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<button style="background-color: transparent;border:transparent" onclick="pagesub1(${coursekey},${page},${pagetotal})"> < </button>
	<span>${page+1}</span>
	<button style="background-color: transparent;border:transparent" onclick="pageadd1(${coursekey},${page})"> > </button>
</div>
</body>
</html>