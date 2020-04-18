<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <script src="http://cdn.jsdelivr.net/sockjs/1.0.1/sockjs.min.js"></script>
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.4.6&key=b8eda965d4e77c9bef1a2c8fab670fe5"></script> 
    <meta charset="utf-8">
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <meta content="email=no" name="format-detection">
    <meta name="baseUrl" content="${ctx}"/>
    <meta name="roleId" content="${roleId}"/>
    <title>学生</title>

    <script type="text/javascript">
    //赋初值
    var csmajor_key="0"
    if('${Course.csmajor_key}'!=""){
    csmajor_key='${Course.csmajor_key}'
    }
        function getLocation()
        {
            if (navigator.geolocation)
            {
                navigator.geolocation.getCurrentPosition(showPosition);
            }
            else
            {
                x.innerHTML="该浏览器不支持获取地理位置。";
            }
        }

        function showPosition(position)//点击签到后获取地理位置，并向服务器发送
        {
        	
            
            var x = position.coords.latitude; //经度
            var y = position.coords.longitude; //纬度
            $.ajax({
                type: "get",
                url: "https://restapi.amap.com/v3/geocode/regeo",
                data: {
                  key: "key",//将key改为你在高德地图api申请到的key
                  location: y + "," + x 
                },
                success(v) {
                  console.log("高德地图api", v.regeocode);
                  //向服务器发送地址
                  window.location.href='${ pageContext.request.contextPath }/student/getSign/'+csmajor_key+'/'+v.regeocode.formatted_address;

                }
              });
            
        }
        //日历
        $(document).ready(function(){
            var weekDay = ["星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
            var date=new Date;
            var year=date.getFullYear(); 
            var month=date.getMonth()+1;
            var date=date.getDate();
            var index;//下标
            var days;//一个月的天数
            var day=year+"/"+month+"/1"
            var myDate = new Date(Date.parse(day));
            for(var i=0;i<7;i++){
                if(weekDay[myDate.getDay()]==weekDay[i]){
                    break;
                }
            }
            index=i;
            document.getElementById((index+date-1).toString()).style.color="red";
            if(month=="1"||month=="3"||month=="5"||month=="7"||month=="8"||month=="10"||month=="12"){
                days=31;
            }else if(month=="4"||month=="6"||month=="9"||month=="11"){
                days=30;
            }else if(month=="2"&&Number(year)%4==0&&Number(year)%100!=0){
                days=29;
            }else{
                days=28;
            }
            for(var j=0;j<days;j++){
                var k=index+j;
                var id=k.toString()
                var num=(1+j).toString()
                document.getElementById(id).innerHTML = num;
            }
            for(var j=days+index;j<41;j++){
                var id=j.toString()
                var num=" "
                document.getElementById(id).innerHTML = num;
            }
            document.getElementById("yearmonth").innerHTML = year+"年"+month+"月";
        })
    </script>


</head>

<body>
	<script>
    //websocket
    $(function () {
        var baseUrl = $('meta[name="baseUrl"]').attr("content");
        //判断当前浏览器是否支持WebSocket
        var websocket;
        //websocket的连接地址，在不同网络环境下选择不同的链接地址，如果出现无法签到的问题，就是地址没改对。
        if ('WebSocket' in window) {
           websocket = new WebSocket("ws://localhost:8080/SignInSystem/student/myHandler");//本机地址
           //websocket = new WebSocket("ws://192.168.1.7:8080/SignInSystem/student/myHandler");//局域网地址
        } else if ('MozWebSocket' in window) {
            websocket = new MozWebSocket('ws://localhost:8080/SignInSystem/student/myHandler'); //未测试
        } else {
            websocket = new SockJS('http://localhost:8080/SignInSystem/student/myHandler'); //未测试
        }

        websocket.onopen = function () {
                    console.log("正在打开连接,准备发消息给服务器...");
            websocket.send("我的学号是："+${Student.snum});
        }
        websocket.onclose = function () {
                    console.log("服务器关闭连接:onclose");
        }

        websocket.onmessage = function (msg) {
                    console.log("收到服务器推送数据:"+msg.data);
                    document.getElementById('courseDiv').innerHTML=msg.data.trim().split(/\s+/)[1]+" 开始签到";
                    csmajor_key=msg.data.trim().split(/\s+/)[0];
        }


    })
</script>
<div style="padding: 10px 10px 0px;">
    <button type="button" class="btn btn-primary" onclick="window.location.href='${ pageContext.request.contextPath }/student/modifyInfo'" style="width:50px; height:50px; border-radius:50%; margin:5px; background-color:rgba(53,134,255,0.6)"><span style="font-weight:100;font-size: 24px;">${Student.sname.subSequence(0, 1)}</span></button>
</div>
<div style="padding: 60px 50px 0px;">

    <button type="button" class="btn btn-primary" onclick="window.location.href='${ pageContext.request.contextPath }/student/main'">刷新</button>签到推送：<div id="courseDiv" style="display: inline">${msg} ${msgCourse}</div>
    <form class="bs-example bs-example-form" role="form">
        <button type="button" class="btn btn-primary" onclick="getLocation()" style="width:140px; height:140px; border-radius:50%; margin:5px; background-color:rgba(53,134,255,0.6)"><span style="font-weight:100;font-size: 30px;">签到</span></button>
        <button type="button" class="btn btn-primary" style="width:140px; height:140px; border-radius:50%; margin:5px; background-color:rgba(53,134,255,0.6)" onclick="window.location.href='${ pageContext.request.contextPath }/student/select'"><span style="font-weight:100;font-size: 30px;">历史<br>签到</span></button>
    </form>
</div>
<div class="text-center" style="padding: 10px 10px 10px;"><button style="background-color: transparent;border:transparent">  </button><span id="yearmonth" style="font-size: 18px;">----年--月</span><button style="background-color: transparent;border:transparent"> </button></div>
<div style="padding: 10px 10px 10px;">
    <table class="table">
        <thead>
        <tr style="background-color:rgba(53,134,255,0.2)">
            <th class="text-center" style="font-size: 18px;">日</th>
            <th class="text-center" style="font-size: 18px;">一</th>
            <th class="text-center" style="font-size: 18px;">二</th>
            <th class="text-center" style="font-size: 18px;">三</th>
            <th class="text-center" style="font-size: 18px;">四</th>
            <th class="text-center" style="font-size: 18px;">五</th>
            <th class="text-center" style="font-size: 18px;">六</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td id="0" class="text-center" style="font-size: 18px;"></td><td id="1" class="text-center" style="font-size: 18px;"></td><td id="2" class="text-center" style="font-size: 18px;"></td><td id="3" class="text-center" style="font-size: 18px;"></td><td id="4" class="text-center" style="font-size: 18px;"></td><td id="5" class="text-center" style="font-size: 18px;"></td><td id="6" class="text-center" style="font-size: 18px;">1</td>
        </tr>
        <tr>
            <td id="7" class="text-center" style="font-size: 18px;">2</td><td id="8" class="text-center" style="font-size: 18px;">3</td><td id="9" class="text-center" style="font-size: 18px;">4</td><td id="10" class="text-center" style="font-size: 18px;">5</td><td id="11" class="text-center" style="font-size: 18px;">6</td><td id="12" class="text-center" style="font-size: 18px;">7</td><td id="13" class="text-center" style="font-size: 18px;">8</td>
        </tr>
        <tr>
            <td id="14" class="text-center" style="font-size: 18px;">9</td><td id="15" class="text-center" style="font-size: 18px;">10</td><td id="16" class="text-center" style="font-size: 18px;">11</td><td id="17" class="text-center" style="font-size: 18px;">12</td><td id="18" class="text-center" style="font-size: 18px;">13</td><td id="19" class="text-center" style="font-size: 18px;">14</td><td id="20" class="text-center" style="font-size: 18px;">15</td>
        </tr>
        <tr>
            <td id="21" class="text-center" style="font-size: 18px;">16</td><td id="22" class="text-center" style="font-size: 18px;">17</td><td id="23" class="text-center" style="font-size: 18px;">18</td><td id="24" class="text-center" style="font-size: 18px;">19</td><td id="25" class="text-center" style="font-size: 18px;">20</td><td id="26" class="text-center" style="font-size: 18px;">21</td><td id="27" class="text-center" style="font-size: 18px;">22</td>
        </tr>
        <tr>
            <td id="28" class="text-center" style="font-size: 18px;">23</td><td id="29" class="text-center" style="font-size: 18px;">24</td><td id="30" class="text-center" style="font-size: 18px;">25</td><td id="31" class="text-center" style="font-size: 18px;">26</td><td id="32" class="text-center" style="font-size: 18px;">27</td><td id="33" class="text-center" style="font-size: 18px;">28</td><td id="34" class="text-center" style="font-size: 18px;">29</td>
        </tr>
        <tr>
            <td id="35" class="text-center" style="font-size: 18px;">30</td><td id="36" class="text-center" style="font-size: 18px;">31</td><td id="37" class="text-center" style="font-size: 18px;"></td><td id="38" class="text-center" style="font-size: 18px;"></td><td id="39" class="text-center" style="font-size: 18px;"></td><td id="40" class="text-center" style="font-size: 18px;"></td><td id="41" class="text-center" style="font-size: 18px;"></td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>