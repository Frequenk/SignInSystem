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
    <title>管理员后台登录</title>
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
	$("#anum").blur(function() {
		var anum = this.value;
		if (anum == null || anum == "") {
			$("#nameDiv").html("账号不能为空！");
		} else{
			$.ajax({
				//请求路径
				url : "${pageContext.request.contextPath }/admin/yanzhengJson",
				//请求类型
				type : "post",
				//data表示发送的数据
				data : JSON.stringify({anum:anum}),
				//定义发送请求的数据格式为JSON字符串
				contentType : "application/json;charset=utf-8",
				//定义回调响应的数据格式为JSON字符串，该属性可以省略
				dataType : "json",
				//成功响应的结果
				success : function(data){
					if(data != null){
						$("#nameDiv").html("管理员账号 ："+data.anum+" 存在");
					}
				},
				error : function(){
						$("#nameDiv").html("管理员账号： "+anum+" 不存在");
				}
				

			});
		}
	});//end of blur()
});
	</script>
  </head>
  <body>
  <div class="jumbotron">
        <h1 class="text-center">管理员登录</h1>
   </div>
  	<form:form action="admin/login" modelAttribute="admin" method="post" class="form-horizontal">
	<div class="form-group">
		<label for="anum" class="col-sm-6 control-label">账号</label>
		<div class="col-sm-2">
				<form:input path="anum" cssClass="textSize"  id="anum"/>

		</div>
					<div id="nameDiv" style="display: inline"></div>
			</div>
		<div class="form-group">
		<label for="lastname" class="col-sm-6 control-label">密码</label>
		<div class="col-sm-2">
				<form:password path="apwd" cssClass="textSize" maxlength="20"/>
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
