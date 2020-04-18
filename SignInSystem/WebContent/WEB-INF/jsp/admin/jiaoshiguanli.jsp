<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script type="text/javascript">
	function gogo(){
		document.forms['modifyTeacher'].submit();
	}
	</script>
</head>
<body>
<div style="margin-left: auto;margin-right: auto;width:1516px;height:760px;">
<div style="padding:10px 10px 10px">
    <button class="btn btn-default" style="width:50px; height:50px; border-radius:50%;border-color:transparent" onclick="javascript:history.back(-1);"><span class="glyphicon glyphicon-chevron-left"></span></button>
</div>
<div style="padding: 100px 200px">
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseOne">
                        教师信息注册
                    </a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse">
                <div class="panel-body">
                    <!--注册表单-->
                    <div style="padding: 0px 100px">
                       <!--   <form role="form"> -->
                            <!--信息输入-->
                            <!--姓名-->
                            <form:form action="modifyTeacher"  modelAttribute="teacher" method="post">
                            <div class="form-group">
                                <label for="snum">教师编号</label>
                                <form:input path="tnum" type="text" class="form-control" placeholder="教师编号"/>
                            </div>
                            <div class="form-group">
                                <label for="spwd">密码</label>
                                <form:input path="tpwd" type="text" class="form-control" placeholder="密码"/>
                            </div>
                            <div class="form-group">
                                <label for="sname">姓名</label>
                                <form:input path="tname" type="text" class="form-control" placeholder="姓名"/>
                            </div>
                            <div class="form-group">
                                <label for="sname">性别</label>
                                <form:input path="tsex" type="text" class="form-control" placeholder="性别"/>
                            </div>
                          <!--   <div class="form-group">
                                <label for="ssex">性别</label><br>
                                <label class="radio-inline">
                                    <input type="radio" name="optionsRadiosinline" id="optionsRadios3" value="option1" checked/> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="optionsRadiosinline" id="optionsRadios4"  value="option2"/> 女
                                </label>
                            </div> -->
                            <div class="form-group">
                                <label for="stel">联系电话</label>
                                <form:input path="ttel" type="text" class="form-control" placeholder="联系电话"/>
                            </div>
                            <button type="submit" class="btn btn-default">提交</button>
                            <button type="reset" class="btn btn-default">重置</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseThree">
                        教师信息查询
                    </a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <div class="panel-body">
                    <!--  form class="form-horizontal" role="form"-->
                    <form:form action="selectTeacher"  modelAttribute="teacher" method="post" name="modifyTeacher">
                        <div class="form-group">
                            <label for="firstname" class="col-sm-1 control-label">教师编号</label>
                            <div class="col-sm-3">
                                <form:input type="text" path="tnum" class="form-control" placeholder="请输入教师编号"/>
                            </div>

                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-1 col-sm-11">
                                <button onclick="gogo()" class="btn btn-default">查询</button>
                            </div>
                        </div>
                    </form:form>
                    <table class="table">
                        <caption>教师信息</caption>
                        <thead>
                        <tr>
                            <th>教师编号</th>
                            <th>密码</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>联系方式</th>
                            <th>是否删除（删除0/未删1）</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${Teacher}" var="t">
                        <tr>
                            <td>${t.tnum}</td>
                            <td>${t.tpwd}</td>
                            <td>${t.tname}</td>
                            <td>${t.tsex}</td>
                            <td>${t.ttel}</td>
                            <td>${t.texist}</td>
                            <td><a href="delteaBytnum/${t.tnum}">删除教师</a>&nbsp;
                            <a href="updteaBytnum/${t.tnum}">修改信息</a></td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    </div>

</div>

</body>
</html>