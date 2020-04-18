<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<div style="padding: 10px 10px 0px;">
<button type="button" class="btn btn-primary" onclick="window.location.href='modifyInfo'" style="width:50px; height:50px; border-radius:50%; margin:5px; background-color:rgba(53,134,255,0.6)"><span style="font-weight:100;font-size: 28px;">${Teacher.tname.subSequence(0, 1)}</span></button>
		<a href="exit" class="btn btn-primary" style="width:100px; height:40px;  margin:5px; background-color:rgba(53,134,255,0.6)"><span style="font-weight:100;font-size: 18px;" role="button">注销</a>
	</div>
<div style="padding: 60px 50px 0px;">
    <form class="bs-example bs-example-form" role="form">
        <button type="button" class="btn btn-primary" onclick="window.location.href='attendance'" style="width:140px; height:140px; border-radius:50%; margin:5px; background-color:rgba(53,134,255,0.6)"><span style="font-weight:100;font-size: 30px;">签到情况</span></button>
        <button type="button" class="btn btn-primary" style="width:140px; height:140px; border-radius:50%; margin:5px; background-color:rgba(53,134,255,0.6)" onclick="window.location.href='startSign'"><span style="font-weight:100;font-size: 30px;">发起签到</span></button>
    </form>
</div>
</body>
</html>