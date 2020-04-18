<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>  
  <base href="<%=basePath%>">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生登录</title>
    	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	//确定按钮
	function gogo(){
		document.forms[0].submit();
	}
	</script>
	
<script type="text/javascript">
$(document).ready(function() {
	$("#snum").blur(function() {
		var snum = this.value;
		if (snum == null || snum == "") {
			$("#nameDiv").html("账号不能为空！");
		} else{
			$.ajax({
				//请求路径
				url : "${pageContext.request.contextPath }/student/yanzhengSnumJson",
				//请求类型
				type : "post",
				//data表示发送的数据
				data : JSON.stringify({snum:snum}),
				//定义发送请求的数据格式为JSON字符串
				contentType : "application/json;charset=utf-8",
				//定义回调响应的数据格式为JSON字符串，该属性可以省略
				dataType : "json",
				//成功响应的结果
				success : function(data){
					if(data != null){
						$("#nameDiv").html("学生账号 ："+data.snum+" 存在");
					}
				},
				error : function(){
						$("#nameDiv").html("学生账号： "+snum+" 不存在");
				}
				

			});
		}
	});//end of blur()
});
	</script>
  </head>
  <body>
  <div class="jumbotron">
        <h1 class="text-center">学生登录</h1>
   </div>
  	<form:form action="student/login" modelAttribute="student" method="post" class="form-horizontal">
	<div class="form-group">
		<label for="firstname" class="col-sm-6 control-label">账号</label>
		<div class="col-sm-2">
				<form:input path="snum" cssClass="textSize"  id="snum"/>

		</div>
					<div id="nameDiv" style="display: inline"></div>
			</div>
		<div class="form-group">
		<label for="lastname" class="col-sm-6 control-label">密码</label>
		<div class="col-sm-2">
				<form:password path="spwd" cssClass="textSize" maxlength="20"/>
			</div>
	</div>
			<div class="form-group">
		<div class="text-center">
				<input type="button" value="确定" onclick="gogo()" class="btn btn-default">
		</div>
	</div>
				<div class="form-group">
		<div class="text-center">
				${msg }
		</div>
	</div>
	</form:form>

  </body>
</html>
