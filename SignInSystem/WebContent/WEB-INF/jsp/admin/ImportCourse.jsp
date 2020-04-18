<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>导入/导出课程表</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="./jquery-easyui-1.9.4/jquery.min.js"></script>
<script type="text/javascript" src="./jquery-easyui-1.9.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="./jquery-easyui-1.9.4/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="./jquery-easyui-1.9.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="./jquery-easyui-1.9.4/themes/icon.css">

<script type="text/javascript">
  $(function(){
	Init();//打开页面就去查询了
 });
 
  //查询所有课程信息
 function Init(){
  $('#excel').datagrid({
		    type : 'post',
			url : './ImportDaoServlet',
	    	loadMsg : '数据加载中,请稍等!!!!!!!!',
			nowrap : false,
			striped : true,
			fit : true,
			pagination:true,
			columns : [[
						 {field:'checkbox',checkbox:true},
			             {field : 'csmajor_key',title : '编号',width : 100,align:'center'}, 
			             {field : 'csname',title : '课程名',width : 120,align:'center'}, 
			             {field : 'tmajor_key',title : '任课教师',width : 100,align:'center'}, 
			             {field : 'cszhou',title : '周数',width : 120,align:'center'}, 
			             {field : 'csweek',title : '星期',width : 100,align:'center'}, 
			             {field : 'csno',title : '节数',width : 100,align:'center'},
			             {field : 'csallowablet',title : '是否发送签到',width : 100,align:'center'},
			             {field : 'csexist',title : '是否存在',width : 100,align:'center'}
			             ]],
			             toolbar: [{
			            	width:'50',
			         		iconCls: 'icon-undo',
			         		handler: function(){ExcelImport();}
			         	},'-',{
			         		width:'50',
			         		iconCls: 'icon-redo',
			         		handler: function(){ExcelExport();}
			         	}]
		});
 }
 
	/*Excel导入  */
	function ExcelImport() {
		alert("导入excel!")
		var url="./ExcelImportServlet";
		window.open(url);
	}

	/*Excel导出  */
    function ExcelExport(){
      alert("导出excel!")
      var url="./ExcelExportServlet";
      window.open(url);
}
	
	
	
</script>
</head>
<body>
<div align="center">
	<div class="easyui-panel" title="###课程表导入导出###"
		style="width: 930px; height: 350px; background: #fafafa;"
		data-options="border:false">
		<table id="excel"></table>
	</div>
</div>
</body>
</html>