<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>错误提示</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style>
	body{
	    position:relative;
	}
	#img{
	    width:300px;
	    height:300px;
		position:absolute;
		left:50%;
		top:30%;
		transform:translate(-50%,-50%);
	}
	h2{
		position:absolute;
		left:50%;
		top:55%;
		transform:translate(-50%,-50%);
		color:rgb(46, 132, 230);
	}
	a{
		position:absolute;
		left:50%;
		top:63%;
		transform:translate(-50%,-50%);
	    color:rgb(46, 132, 230);
	    cursor:pointer;
	}
	</style>
  </head>
  
  <body>
    <img id="img" src="image\03.jpg"/>
    <h2>Hi，真不巧，识别失败</h2>
    <a onclick="history.go(-1)">返回</a>
  </body>
</html>