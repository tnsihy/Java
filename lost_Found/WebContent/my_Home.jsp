<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心</title>
<style type="text/css">
*{
margin:0;
padding:0;
}
.top,.top a{
background-color:rgb(63, 161, 116);
height:30px;
color:#fff;
font-size:14px;
margin:8px;
text-decoration:none;
padding-top:5px;
}
.left{
float:left;
width:170px;
height:240px;
margin:20px;
margin-top:40px;
font-size:15px;
background-color:rgb(63, 161, 116);
border-radius :20px;
}
li{
list-style:none;
text-indent:50px;
border:1px solid #fff;
height:58px;
line-height: 50px;
}
a{
text-decoration: none;
color:#fff;
}
.right{
float:right;
border:1px solid #ccc;
width:1000px;
margin-right:80px;
margin-top:40px;
}
table{
margin:0 30px 30px 30px;
}
td,tr{
color:rgb(131, 133, 136);
line-height:30px;
}
td input{
border: 1px solid rgb(131, 133, 136);
line-height:20px;
}
.demo{
border:1px solid rgb(131, 133, 136);
margin-left:150px;
font-size:15px;
overflow:hidden;
border-radius:6px;
}
.demo td{
width:600px;
}
.demo2 th{
font-weight:normal;
font-size:15px;
}
.demo2 input{
border-left:none;
border-right:none;
border-top:none;
text-align:center;
outline:none;
}

</style>
<script type="text/javascript">
function queding(){
	alert("恭喜您修改成功");
}
function shanchu(){
	alert("恭喜您删除成功");
}
function quxiao(){
	window.history.go(-1);
}
</script>
</head>
<body>

<div class="top">
<span style="float:left;margin-left:20px">
失物招领平台✍</span>
<span style="float:right;margin-right:20px">
<c:forEach items="${userlist}" var="user">
<span>${user.name}</span>
</c:forEach>
欢迎您进入个人中心
<a href="home_Page.jsp">回到首页</a>
<a href="login.jsp">退出登录</a>
</span>
</div>
<div class="main">
<div class="left">
<c:forEach items="${userlist}" var="user">
<ul>
<li><a href="messageservlet?method=my_Search">我的寻物</a></li>
<li><a href="messageservlet?method=my_Found">我的招领</a></li>
<li><a href="my_Home.jsp?method=my_Message&name=${user.name}">修改资料</a></li>
<li><a href="my_Home.jsp?method=my_Pwd">修改密码</a></li>
</ul>
</c:forEach>
</div>
<div class="right">

<c:choose>

<%--my_Search登录者 作为失主 发布的信息 ①③--%>
<c:when test="${param.method eq 'my_Search'}">
<span style="font-size:15px;display:block;height:30px;padding-top:5px;background-color:rgb(63, 161, 116);color:#fff;text-indent:20px;">
以下是您发布的挂失消息：</span>
<br />
<c:forEach items="${my_lostlist}" var="lost">
<table class="demo">
<tr>
<th>丢失地点：</th>
<td>${lost.lost_site}</td>
</tr>
<tr>
<th>丢失时间：</th>
<td>${lost.lost_time}</td>
</tr>
<tr>
<th>物品名称：</th>
<td>${lost.lost_name}</td>
</tr>
<tr>
<th>物品颜色：</th>
<td>${lost.lost_color}</td>
</tr>
<tr>
<th>联系方式：</th>
<td>${lost.lost_tel}</td>
</tr>
<tr>
<th>当前状态：</th>
<td>${lost.lost_status}</td>
</tr>
<tr>
<th></th>
<td>
<br/>
<a href="my_Home.jsp?method=loster_Status&lost_site=${lost.lost_site}&lost_time=${lost.lost_time}&lost_name=${lost.lost_name}&lost_color=${lost.lost_color}&lost_tel=${lost.lost_tel}&lost_status=${lost.lost_status}"
 style="background-color:rgb(63, 161, 116);display:inline-block;text-align:center;
color:#fff;width:100px;height:30px;margin-left:350px;">状态更改</a>

<a href="messageservlet?method=loster_Delete&lost_site=${lost.lost_site}&lost_time=${lost.lost_time}&lost_name=${lost.lost_name}" style="background-color:rgb(63, 161, 116);display:inline-block;text-align:center;
color:#fff;width:100px;height:30px;" onclick="shanchu()">删除</a>

</td>
</tr>
</table>

</c:forEach>
</c:when>

<%--my_Message登录者  修改资料信息 --%>
<c:when test="${param.method eq 'my_Message'}">
<span style="font-size:15px;display:block;height:30px;padding-top:5px;background-color:rgb(63, 161, 116);color:#fff;text-indent:20px;">
修改资料</span>
<br />
<form action="messageservlet?method=my_Message" method="post">
<c:forEach items="${userlist}" var="user">
<table class="demo2">
<tr>
<th>邮箱账号:</th>
<td style="text-align:center">${user.num}</td>
</tr>
<tr>
<th>昵称:</th>
<td><input type="text" name="name" value="${user.name}"></td>
</tr>
<tr>
<th>联系方式:</th>
<td><input type="text" name="tel" value="${user.tel}"></td>
</tr>
</table>
<input type="submit" value="确定" onclick="queding()" style="background-color:rgb(63, 161, 116);
color:#fff;width:100px;height:30px;margin-left:150px;margin-bottom:10px;cursor:pointer"/>
</c:forEach>
</form>
</c:when>

<%--my_Pwd登录者  修改密码信息 --%>
<c:when test="${param.method eq 'my_Pwd'}">
<span style="font-size:15px;display:block;height:30px;padding-top:5px;background-color:rgb(63, 161, 116);color:#fff;text-indent:20px;">
修改密码</span>
<br />
<form action="messageservlet?method=my_Pwd" method="post">
<table class="demo2">
<tr>
<th>请输入你的旧密码：</th>
<td><input type="text" name="old_pwd" /></td>
</tr>
<tr>
<th>新密码：</th>
<td><input type="text" name="new_pwd"></td>
</tr>
<tr>
<th>重复输入新密码：</th>
<td><input type="text" name="re_pwd"></td>
</tr>
</table>
<input type="submit" value="确定" style="background-color:rgb(63, 161, 116);
color:#fff;width:100px;height:30px;margin-left:150px;margin-bottom:10px"/>
</form>
</c:when>

<%--loster_Status登录者 作为失主  更新挂失状态信息② --%>
<c:when test="${param.method eq 'loster_Status'}">
<span style="font-size:15px;display:block;height:30px;padding-top:5px;background-color:rgb(63, 161, 116);color:#fff;text-indent:20px;">
更新状态</span>
<br />
<form action="messageservlet?method=loster_Status&lost_site=${param.lost_site}" method="post">
<table class="demo">
<tr>
<th>丢失地点：</th>
<td>${param.lost_site}</td>
</tr>
<tr>
<th>丢失时间：</th>
<td>${param.lost_time}</td>
</tr>
<tr>
<th>物品名称：</th>
<td>${param.lost_name}</td>
</tr>
<tr>
<th>物品颜色：</th>
<td>${param.lost_color}</td>
</tr>
<tr>
<th>联系方式：</th>
<td><input type="text" name="lost_tel" value="${param.lost_tel}" /></td>
</tr>
<tr>
<th>当前状态：</th>
<td>
<select name="lost_status">
<option>未找到</option>
<option>已找到</option>
</select>
</td>
</tr>
<tr>
<th></th>
<td><input type="button" value="取消" onclick="quxiao()" style="background-color:rgb(63, 161, 116);
color:#fff;width:100px;height:30px;margin-bottom:10px;cursor:pointer;margin-left:200px" />
<input type="submit" value="提交" style="background-color:rgb(63, 161, 116);
color:#fff;width:100px;height:30px;margin-bottom:10px;cursor:pointer"/>
</td></tr>
</table>
<br />
</form>
</c:when>

<%--my_Found登录者 作为拾主 发布的信息①③ --%>
<c:when test="${param.method eq 'my_Found'}">
<span style="font-size:15px;display:block;height:30px;padding-top:5px;background-color:rgb(63, 161, 116);color:#fff;text-indent:20px;">
以下是您发布的拾物消息：</span>
<br />
<c:forEach items="${my_picklist}" var="pick">
<table class="demo">
<tr>
<th>拾到地点：</th>
<td>${pick.pick_site}</td>
</tr>
<tr>
<th>拾到时间：</th>
<td>${pick.pick_time}</td>
</tr>
<tr>
<th>物品名称：</th>
<td>${pick.pick_name}</td>
</tr>
<tr>
<th>物品颜色：</th>
<td>${pick.pick_color}</td>
</tr>
<tr>
<th>联系方式：</th>
<td>${pick.pick_tel}</td>
</tr>
<tr>
<th>当前状态：</th>
<td>${pick.pick_status}</td>
</tr>
<tr>
<th></th>
<td>
<br/>
<a href="my_Home.jsp?method=picker_Status&pick_site=${pick.pick_site}&pick_time=${pick.pick_time}&pick_name=${pick.pick_name}&pick_color=${pick.pick_color}&pick_tel=${pick.pick_tel}&pick_status=${pick.pick_status}"
 style="background-color:rgb(63, 161, 116);display:inline-block;text-align:center;
color:#fff;width:100px;height:30px;margin-left:350px;">状态更改</a>
<a href="messageservlet?method=picker_Delete&pick_site=${pick.pick_site}&pick_time=${pick.pick_time}&pick_name=${pick.pick_name}" style="background-color:rgb(63, 161, 116);display:inline-block;text-align:center;
color:#fff;width:100px;height:30px;" onclick="shanchu()">删除</a>
</td>
</tr>
</table>
</c:forEach>
</c:when>

<%--picker_Status登录者 作为拾主 更新挂失状态信息② --%>
<c:when test="${param.method eq 'picker_Status'}">
<span style="font-size:15px;display:block;height:30px;padding-top:5px;background-color:rgb(63, 161, 116);color:#fff;text-indent:20px;">
更新状态</span>
<br />
<form action="messageservlet?method=picker_Status&pick_site=${param.pick_site}" method="post">
<table class="demo">
<tr>
<th>拾到地点：</th>
<td>${param.pick_site}</td>
</tr>
<tr>
<th>拾到时间：</th>
<td>${param.pick_time}</td>
</tr>
<tr>
<th>物品名称：</th>
<td>${param.pick_name}</td>
</tr>
<tr>
<th>物品颜色：</th>
<td>${param.pick_color}</td>
</tr>
<tr>
<th>联系方式：</th>
<td><input type="text" name="pick_tel" value="${param.pick_tel}" /></td>
</tr>
<tr>
<th>当前状态：</th>
<td>
<select name="pick_status">
<option>未领取</option>
<option>已领取</option>
</select>
</td>
</tr>
<tr>
<th></th>
<td><input type="button" value="取消" onclick="quxiao()" style="background-color:rgb(63, 161, 116);
color:#fff;width:100px;height:30px;margin-bottom:10px;cursor:pointer;margin-left:200px" />
<input type="submit" value="提交" style="background-color:rgb(63, 161, 116);
color:#fff;width:100px;height:30px;margin-bottom:10px;cursor:pointer"/>
</td></tr>
</table>
<br />
</form>
</c:when>


</c:choose>
</div>
</div>
</body>
</html>