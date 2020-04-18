<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>发送签到信息</title>
	<script>
		var course;
		function xuanke(obj){
			course=obj.firstChild.innerHTML ;
			}
		function tijiao(){
			if(course!=null){
				document.getElementById("tishi").innerHTML = course;
			}
			else{
				document.getElementById("tishi").innerHTML = "你还没有选课欧";
			}
		}
	</script>
</head>

<body>
<div style="padding:10px 10px 10px">
	<button class="btn btn-default" style="width:50px; height:50px; border-radius:50%;border-color:transparent" onclick="window.location.href='${ pageContext.request.contextPath }/teacher/main'"><span class="glyphicon glyphicon-chevron-left"></span></button>
</div>
${msg }
<div style="padding: 30px 50px 0px;">
<c:forEach items="${course_class }" var="c">
<tr>
<td>
		<button type="button" class="btn btn-primary" onclick="window.location.href='${ pageContext.request.contextPath }/teacher/putSign/${c.csmajor_key}/${c.csname}'" style="width:140px; height:140px; border-radius:50%; margin:5px; background-color:rgba(53,134,255,0.6);word-wrap: break-word !important; word-break: break-all !important; white-space: normal !important;" ><span style="font-weight:100;font-size: 15px;">${c.csname}<br>${c.cname}</span></button>
</td>
</tr>

</c:forEach>
</div >
<div style="padding: 30px 110px 0px;">
	<button type="button" class="btn btn-danger" style="width:180px; height:70px; margin:5px;" onclick="window.location.href='${ pageContext.request.contextPath }/teacher/endSign'"><span style="font-weight:100;font-size: 15px;">停止所有进行中的签到</span></button>
</div>
<span id="tishi" name="tishi"></span>
</body>
</html>