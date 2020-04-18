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
                        开设信息
                    </a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse">
                <div class="panel-body">
                    <!--注册表单-->
                    <div style="padding: 0px 100px">
                    
                            <!--信息输入-->
                            <!--姓名-->
                            <span>${msg}</span>
					<form:form action="modifyCourse"  modelAttribute="course" method="post">
                       
                            <div class="form-group">
                                <label for="snum">课程名</label>
                                <form:input  path="csname" type="text" class="form-control" placeholder="课程名"/>
                            </div>
                            <div class="form-group">
                                <label for="spwd">任课教师id</label>
                                <form:input path="tmajor_key" type="text" class="form-control" placeholder="任课教师id"/>
                            </div>
                            <div class="form-group">
                                <label for="sname">上课周</label>
                                <form:input path="cszhou" type="text" class="form-control" placeholder="上课周"/>
                            </div>
                             <div class="form-group">
                                <label for="sname">星期</label>
                                <form:input path="csweek" type="text" class="form-control" placeholder="星期"/>
                            </div>
                            <div class="form-group">
                                <label for="sname">第几次课</label>
                                <form:input path="csno" type="text" class="form-control" placeholder="第几次课"/>
                            </div>
                           <!--  <div class="form-group">
                                <label for="sname">星期</label>
                                <form:select path="csweek"  class="input-medium required">
                                    <form:options  itemLabel="星期一" itemValue="1" htmlEscape="false"/>
                                    <form:options  itemLabel="星期二" itemValue="2" htmlEscape="false"/>
                                    <form:options  itemLabel="星期三" itemValue="3" htmlEscape="false"/>
                                    <form:options  itemLabel="星期四" itemValue="4" htmlEscape="false"/>
									<form:options  itemLabel="星期五" itemValue="5" htmlEscape="false"/>
									<form:options  itemLabel="星期六" itemValue="6" htmlEscape="false"/>
									<form:options  itemLabel="星期日" itemValue="7" htmlEscape="false"/>
                                </form:select>
                            </div>
                            <div class="form-group">
                                <form:select path="csno"  class="input-medium required">
                                    <form:options  itemLabel="第一节课" itemValue="1" htmlEscape="false"/>
                                    <form:options  itemLabel="第二节课" itemValue="2" htmlEscape="false"/>
                                    <form:options  itemLabel="第三节课" itemValue="3" htmlEscape="false"/>
                                    <form:options  itemLabel="第四节课" itemValue="4" htmlEscape="false"/>
                                    <form:options  itemLabel="第五节课" itemValue="5" htmlEscape="false"/>
                                    <form:options  itemLabel="第六节课" itemValue="6" htmlEscape="false"/>
                                    <form:options  itemLabel="第七节课" itemValue="7" htmlEscape="false"/>
                                    <form:options  itemLabel="第八节课" itemValue="8" htmlEscape="false"/>
                                </form:select> --> 
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
                        课程信息查询
                    </a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <div class="panel-body">
                   <!--   <form class="form-horizontal" role="form"> -->
                    <span>${msg}</span>
					<form:form action="selectCourse"  modelAttribute="course" method="post">
                        <div class="form-group">
                            <label for="firstname" class="col-sm-1 control-label">课程名</label>
                            <div class="col-sm-3">
                                <form:input path="csname" type="text" class="form-control" placeholder="请输入课程名"/>
                            </div>
<%--                             <label for="firstname" class="col-sm-1 control-label">任课教师id</label>
                            <div class="col-sm-3">
                                <form:input path="tmajor_key" type="text" class="form-control" placeholder="请输入任课教师id"/>
                            </div> --%>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-1 col-sm-11">
                                <button type="submit" class="btn btn-default">查询</button>
                            </div>
                        </div>
                    </form:form>
                    <table class="table">
                        <caption>课程信息</caption>
                        <thead>
                        <tr>
                            <th>课程名</th>
                            <th>任课教师id</th>
                            <th>上课周</th>
                            <th>星期</th>
                            <th>时间</th>
                            <th>是否删除（删除0/未删1）</th>
                            <th>操作</th>
                        </tr>
                    
                        </thead>
                        <tbody>
                        <c:forEach items="${Course}" var="c">
                        <tr>
                            <td>${c.csname}</td>
                            <td>${c.tmajor_key}</td>
                            <td>${c.cszhou}</td>
                            <td>${c.csweek}</td>
                            <td>${c.csno}</td>
                            <td>${c.csexist}</td>
                            <td><a href="delcouBycsname/${c.csname}">删除课程</a>&nbsp;
                            <a href="updcouBycsname/${c.csname}">修改信息</a></td>
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