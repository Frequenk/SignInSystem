<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script language="javascript" src="/Global/jquery.min.js"></script>
	<script language="javascript" src="/Global/jquery.json.min.js"></script>
	<script language="javascript" src="/Global/Widget.js"></script>
	<script language="javascript" src="/Global/Global.js"></script>
	<script type="text/javascript">
	var flag1=0; 
	var flag2=0;
	var flag3=0;
	function gogo(){
		$("#tipDiv").html("");
		if(flag1==1&&flag2==1&&flag3==1){
		document.forms['modifyPwd'].submit();
		}else{
			$("#tipDiv").html("请先解决所有错误");
		}
	}
$(document).ready(function() {
	$("#oldPwd").blur(function() {
		$("#oldpwdDiv").html("");
		var oldPwd = this.value;
		if (oldPwd == null || oldPwd == "") {
			$("#oldPwdDiv").html("密码不能为空！");
		} else{
			$.ajax({
				//请求路径
				url : "${pageContext.request.contextPath }/student/yanzhengSpwdJson",
				//请求类型
				type : "post",
				//data表示发送的数据
				data : JSON.stringify({spwd:oldPwd}),
				//定义发送请求的数据格式为JSON字符串
				contentType : "application/json;charset=utf-8",
				//定义回调响应的数据格式为JSON字符串，该属性可以省略
				dataType : "json",
				//成功响应的结果
				success : function(data){
					if(data != null){
						flag1=1;
						$("#oldPwdDiv").html("旧密码正确");
					}
				},
				error : function(){
					flag1=0;
						$("#oldPwdDiv").html("旧密码错误");
				}				
			});
		}
	});//end of blur()
	$("#newPwd1").blur(function() {
		var newPwd1 = this.value;
		if (newPwd1 == null || newPwd1 == "") {
			$("#newPwd1Div").html("密码不能为空！");
			flag2=0;
		} else{
			$("#newPwd1Div").html("");
			flag2=1;
		}
		
	});
	$("#newPwd2").blur(function() {
		var newPwd1=document.getElementById("newPwd1").value;		
		var newPwd2 = this.value;
		$("#newPwd2").html("222");
		if (newPwd2 == null || newPwd2 == "") {
			$("#newPwd2Div").html("密码不能为空！");
			flag3=0;
		}else if(newPwd1!=newPwd2)  {
			$("#newPwd2Div").html("两次密码不一致");
			flag3=0;
		}
		else{
			$("#newPwd2Div").html("");
			flag3=1;
		}
	});
	
});
	</script>

</head>

<body>
<div style="padding:10px 10px 10px">
	<button class="btn btn-default" style="width:50px; height:50px; border-radius:50%;border-color:transparent" onclick="window.location.href='main'"><span class="glyphicon glyphicon-chevron-left"></span></button>

</div>
<div style="padding:100px 50px 10px">
	<div class="panel-group" id="accordion">

		<div class="panel panel-success" >
			<div class="panel-heading">
				<h4 class="panel-title" style="text-align:center">
					<a data-toggle="collapse" data-parent="#accordion"
					   href="#collapseTwo">
						<span style="font-weight:100;font-size: 30px;">修改联系电话</span>
					</a>
				</h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse">
				<div class="panel-body" style="text-align:center">
				<span>${msgTel}当前电话：${Student.stel}</span>
					<form:form action="modifyTel"  modelAttribute="student" method="post">
					<div class="form-group">
						<form:input path="stel" class="form-control"/>
						</div>
						<div class="form-group">
						<input type="submit" class="btn btn-default" value="完成">
						<input type="reset" class="btn btn-default" value="重置">
						</div>
					</form:form>					
				</div>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title" style="text-align:center">
					<a data-toggle="collapse" data-parent="#accordion"
					   href="#collapseThree">
						<span style="font-weight:100;font-size: 30px;">修改密码</span>
					</a>
				</h4>
			</div>
			<div id="collapseThree" class="panel-collapse collapse">
				<div class="panel-body" style="text-align:center">
				<span>${msgPwd}</span>
					<form:form action="modifyPwd"  modelAttribute="student" method="post" name="modifyPwd">
						<input type="password" class="form-control" placeholder="原密码" id="oldPwd">
						<div id="oldPwdDiv" style="display: inline"></div><br>
						<form:password path="spwd"  class="form-control" placeholder="新密码" id="newPwd1"/><br>
						<div id="newPwd1Div" style="display: inline"></div><br>
						<input type="password" class="form-control" placeholder="确认密码" id="newPwd2"><br>
						<div id="newPwd2Div" style="display: inline"></div><br>
						<input type="button" onclick="gogo()" class="btn btn-default" value="完成">
						<input type="reset" class="btn btn-default" value="重置">
						<br><div id="tipDiv" style="display: inline"></div>
					</form:form>
				</div>
			</div>
		</div>

	</div>
</div>
 <p>欢迎${Student.sname}<a href="exit" class="btn btn-primary" role="button">注销</a></p>
<script>
    $(function () { $('#collapseTwo').collapse('hide')});
    $(function () { $('#collapseThree').collapse('hide')});
</script>
</body>
</html>