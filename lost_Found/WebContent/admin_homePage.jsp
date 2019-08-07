<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>失物招领后台管理</title>
<style type="text/css">
*{
margin:0;
padding:0;
}
.top,.top a{
background-color:rgb(31, 121, 206);
height:30px;
color:#fff;
font-size:14px;
margin:8px;
text-decoration:none;
padding-top:5px;
}
.top{
border-radius:4px;
box-shadow:0 4px 10px #bbb;
}
a {
color: #333;
text-decoration: none
}
ul {
list-style: none;
}
.nav {
height: 30px;
/*border-bottom: 5px solid rgb(31, 121, 206);*/
margin-left: 83px;
width: 600px;
}
.nav li {
float: left;
position: relative;
height: 30px;
width: 120px;
}
.nav li a {
display: block;
height: 30px;
text-align: center;
line-height: 30px;
width: 120px;
background: #efefef;
margin-left: 1px;
}
.subNav {
position: absolute;
top: 30px;
left: 0;
width: 120px;
height: 0;
overflow: hidden;
}
.subNav li a {
background: #efefef;
}
.subNav li a:hover {
background: rgb(31, 121, 206);
}
.demo1,.demo2{
margin-left:80px;
word-wrap: break-word;
word-break: break-all;
font-size:15px;
}
.demo1{
width:1200px;
}
.demo2{
width:600px;
float:left;
margin-right:100px;
}
.demo1 td,.demo2 td{
height:35px;
text-align:center;
border-bottom:2px solid #ccc;
border-left:0px;
border-right:0px;
}
.lostandfound{
margin-left:100px;
font-size:15px;
line-height:25px;
}
.lostandfound input{
	border:none;
    border-bottom:1px solid #ccc;
    outline:none;
}
.demo{
border:1px solid rgb(131, 133, 136);
margin-left:150px;
font-size:15px;
border-radius:5px;
margin-bottom:5px;
}
.demo th{
font-weight:normal;
height:25px;
}
.demo td{
width:600px;
}
.demo3{
margin-top:30px;
margin-left:100px;
border:2px solid rgb(31, 121, 206);
border-radius:6px;
padding:10px 20px 10px 5px;
}
.demo3 th{
font-weight:normal;
font-size:15px;
width:180px;
height:30px;
}
.demo3 input{
border-left:none;
border-right:none;
border-top:none;
text-align:center;
border-bottom:1px solid #ccc;
outline:none;
}
.demo4{
border:2px solid rgb(31, 121, 206);
padding:10px 20px 10px 5px;
border-radius:8px;

}
.demo4 th{
font-weight:normal;
font-size:15px;
width:120px;
height:30px;
}
.demo4 input{
border-left:none;
border-right:none;
border-top:none;
text-align:center;
border-bottom:1px solid #ccc;
outline:none;
}
</style>
<script type="text/javascript">
window.onload = function () {
	var aLi = document.getElementsByTagName('li');
	for (var i = 0; i < aLi.length; i++) {
	aLi[i].onmouseover = function () {
	var oSubNav = this.getElementsByTagName('ul')[0];
	if (oSubNav) {
	var This = oSubNav;
	clearInterval(This.time)
	This.time = setInterval(function () {
	This.style.height = This.offsetHeight + 30 + "px";
	if (This.offsetHeight >= 150) {
	clearInterval(This.time)
	}}, 30)
  }
}     
	aLi[i].onmouseout = function () {
	var oSubNav = this.getElementsByTagName('ul')[0];
	if (oSubNav) {
	var This = oSubNav;
	clearInterval(This.time)
	This.time = setInterval(function () {
	This.style.height = This.offsetHeight - 30 + "px";
	if (This.offsetHeight <= 0) {
	This.style.height = 0;
	clearInterval(This.time)
	}}, 30)
	}
   }
  }
}
</script>
</head>
<body>
<div class="top">
<span style="float:left;margin-left:20px">后台管理✍</span>
<span style="float:right;margin-right:20px">欢迎您，
<c:forEach items="${adminlist}" var="admin">
<span>${admin.name}</span>
</c:forEach>
<a href="admin.jsp">退出登录</a>
</span>
</div>
<br />
<div class="main">
<div>
    <ul class="nav">
        <li><a href="">用户管理</a>
            <ul class="subNav">
                <li><a href="messageservlet?method=front_User">前台用户管理</a></li>
                <li><a href="messageservlet?method=after_User">管理员管理</a></li>
            </ul>
        </li>
        <li><a href="admin_homePage.jsp?method=admin_Record">拾物发布</a></li>
        <li><a href="">信息管理</a>
            <ul class="subNav">
                <li><a href="messageservlet?method=admin_lostMessage">挂失信息管理</a></li>
                <li><a href="messageservlet?method=admin_foundMessage">拾物信息管理</a></li>
                <li><a href="messageservlet?method=admin_Found">失物领取登记</a></li>
            </ul>
        </li>
        <li><a href="messageservlet?method=get_Search">归还查询</a></li>
        <li><a href="admin_homePage.jsp?method=admin_Pwd">密码修改</a></li>
  </ul>
 </div>
 <div class="bottom">
 <c:choose>
 
 <%--front_User前台所有用户表 --%>
 <c:when test="${param.method eq 'front_User'}">
 <span style="font-size:15px;display:block;height:30px;width:1200px;margin:0 auto;padding-top:5px;background-color:rgb(31, 121, 206);color:#fff;text-indent:20px">
前台所有用户表</span>
<br />
<table class="demo1" cellspacing="0">
<tr>
<td width="25%">邮箱</td>
<td width="25%">昵称</td>
<td width="25%">联系方式</td>
<td width="10%">操作</td>
</tr>
<c:forEach items="${userlist}" var="user">
<tr>
<td>${user.num}</td>
<td>${user.name}</td>
<td>${user.tel}</td>
<td><a href="messageservlet?method=front_Delete&num=${user.num}" style="border:1px solid red;border-radius:5px;padding:2px;color:red;">删除</a></td>
</tr>
</c:forEach>
</table>
 </c:when>
 
 
 <%--after_User后台所有用户表 --%>
 <c:when test="${param.method eq 'after_User'}">
  <span style="font-size:15px;display:block;height:30px;width:1200px;margin:0 auto;padding-top:5px;background-color:rgb(31, 121, 206);color:#fff;text-indent:20px">
后台所有用户表</span>
<br />
<div>
<table class="demo2" id="table1" cellspacing="0">
<tr>
<td width="20%">邮箱</td>
<td width="20%">昵称</td>
<td width="20%">密码</td>
<td width="15%">操作</td>
</tr>
<c:forEach items="${admin_list}" var="admin">
<tr>
<td>${admin.num}</td>
<td>${admin.name}</td>
<td>${admin.pwd}</td>
<td>
<a href="messageservlet?method=after_Delete&num=${admin.num}" style="border:1px solid red;border-radius:5px;padding:2px;color:red;">删除</a>
</td>
</tr>
</c:forEach>
</table>
<br />
</div>
<div class="main_right">
<form action="messageservlet?method=admin_Add" method="post">
<table class="demo4">
<tr>
<th>管理员账号：</th>
<td><input type="text" name="num" placeholder="添加管理员邮箱"  required=""/></td>
</tr>
<tr>
<th>管理员昵称：</th>
<td><input type="text" name="name" placeholder="添加管理员昵称"  required=""/></td>
</tr>
<tr>
<th>管理员密码：</th>
<td><input type="text" name="pwd" placeholder="添加管理员密码"  required=""/></td>
</tr>
<tr>
<th></th>
<td><input type="submit" value="添加管理员"  style="border:1px solid rgb(31, 121, 206);border-radius:5px;padding:2px;color:rgb(31, 121, 206);
background-color:#fff;height:30px;font-size:15px;margin-left:80px;margin-top:20px;cursor:pointer"/></td>
</tr>
</table>
</form>
</div>
 </c:when>


 <%--admin_Record管理员 发布招领信息 --%>
 <c:when test="${param.method eq 'admin_Record'}">
 <span style="font-size:15px;display:block;height:30px;width:1200px;margin:0 auto;padding-top:5px;background-color:rgb(31, 121, 206);color:#fff;text-indent:20px">
管理员发布招领信息，请填写以下内容：</span>
<br />
<form action="messageservlet?method=admin_Record" method="post">
<table class="lostandfound">
<tr>
<td>拾到地点：</td>
<td><input type="text" name="pick_site" style="width:350px;"></td>
</tr>
<tr>
<td>拾到时间：</td>
<td><input type="text" name="pick_time" placeholder="格式：1997-08-30"></td>
</tr>
<tr>
<td>物品名称：</td>
<td><input type="text" name="pick_name"></td>
</tr>
<tr>
<td>物品颜色：</td>
<td><input type="text" name="pick_color" style="width:100px;"></td>
</tr>
<tr>
<td>联系方式：</td>
<td><input type="text" name="pick_tel" value="0663-8888888"></td>
</tr>
<tr>
<td>当前状态：</td>
<td><select name="pick_status">
<option>未领取</option>
</select></td>
</tr>
</table>
<br />
<input value="提交"  type="submit" onclick="tijiao()" style="background-color:rgb(31, 121, 206);
color:#fff;width:100px;height:30px;margin-left:260px;cursor:pointer"/>
</form>
 </c:when>
 
 
 <%--admin_lostMessage管理员 前台挂失信息管理 --%>
 <c:when test="${param.method eq 'admin_lostMessage'}">
 <span style="font-size:15px;display:block;height:30px;width:1200px;
 margin:0 auto;padding-top:5px;background-color:rgb(31, 121, 206);color:#fff;text-indent:20px;margin-left:85px">
前台挂失信息管理</span>
<br />
<table class="demo1" cellspacing="0">
<tr>
<td width="25%">丢失地点</td>
<td width="10%">丢失时间</td>
<td width="10%">物品名称</td>
<td width="10%">物品颜色</td>
<td width="10%">发布者</td>
<td width="10%">联系方式</td>
<td width="15%">当前状态</td>
<td width="15%">操作</td>
</tr>
<c:forEach items="${lostlist}" var="lost">
<tr>
<td>${lost.lost_site}</td>
<td>${lost.lost_time}</td>
<td>${lost.lost_name}</td>
<td>${lost.lost_color}</td>
<td>${lost.name}</td>
<td>${lost.lost_tel}</td>
<td>${lost.lost_status}</td>
<td><a href="messageservlet?method=admin_lostDelete&lost_site=${lost.lost_site}&lost_time=${lost.lost_time}"
 style="border:1px solid red;border-radius:5px;padding:2px;color:red;">删除</a></td>
</tr>
</c:forEach>
</table>
<br />
<br />
<br />
 </c:when>
 
 
 <%--admin_foundMessage管理员 前台拾物信息管理 --%>
 <c:when test="${param.method eq 'admin_foundMessage'}">
  <span style="font-size:15px;display:block;height:30px;width:1200px;
 margin:0 auto;padding-top:5px;background-color:rgb(31, 121, 206);color:#fff;text-indent:20px;margin-left:85px">
前台拾物信息管理</span>
<br />
<table class="demo1" cellspacing="0">
<tr>
<td width="25%">拾到地点</td>
<td width="10%">拾到时间</td>
<td width="10%">物品名称</td>
<td width="10%">物品颜色</td>
<td width="10%">发布者</td>
<td width="10%">联系方式</td>
<td width="15%">当前状态</td>
<td width="15%">操作</td>
</tr>
<c:forEach items="${picklist}" var="pick">
<tr>
<td>${pick.pick_site}</td>
<td>${pick.pick_time}</td>
<td>${pick.pick_name}</td>
<td>${pick.pick_color}</td>
<td>${pick.name}</td>
<td>${pick.pick_tel}</td>
<td>${pick.pick_status}</td>
<td><a href="messageservlet?method=admin_foundDelete&pick_site=${pick.pick_site}&pick_time=${pick.pick_time}"
 style="border:1px solid red;border-radius:5px;padding:2px;color:red;">删除</a></td>
</tr>
</c:forEach>
</table>
<br />
<br />
<br />
 </c:when>
 
 
 <%--admin_Found 管理员 发布拾物信息 --%>
 <c:when test="${param.method eq 'admin_Found'}">
   <span style="font-size:15px;display:block;height:30px;width:1200px;
 margin:0 auto;padding-top:5px;background-color:rgb(31, 121, 206);color:#fff;text-indent:20px;margin-left:85px">
失物领取登记</span>
<br />
<c:forEach items="${admin_picklist}" var="pick">
<span style="display:block;margin-left:90px;color:rgb(131, 133, 136);font-size:15px">${pick.name}：</span>
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
<a href="admin_homePage.jsp?method=get_Record" style="background-color:rgb(31, 121, 206);display:inline-block;
color:#fff;width:80px;height:25px;margin-left:150px;margin-bottom:10px;text-align:center;padding-top:3px;margin-right:20px">领取登记</a>
<a href="messageservlet?method=admin_foundDelete&pick_site=${pick.pick_site}&pick_time=${pick.pick_time}" style="background-color:rgb(31, 121, 206);display:inline-block;
color:#fff;width:80px;height:25px;text-align:center;padding-top:3px">删除</a>
</td>
</tr>
</table>
</c:forEach>
 </c:when>


<%--get_Record 失主来领取 --%>
<c:when test="${param.method eq 'get_Record'}">
<span style="font-size:15px;display:block;height:30px;width:1200px;margin:0 auto;padding-top:5px;background-color:rgb(31, 121, 206);color:#fff;text-indent:20px">
失主领取时需登记内容</span>
<br />
<form action="messageservlet?method=get_Record" method="post">
<table class="lostandfound">
<tr>
<td>物品名称：</td>
<c:forEach items="${admin_picklist}" var="pick">
<td><input type="text" name="get_name" style="width:350px;" value="${pick.pick_name}"></td>
</c:forEach>
</tr>
<tr>
<td>自取地点：</td>
<td><input type="text" name="get_site" value="失物招领处"></td>
</tr>
<tr>
<td>归还时间：</td>
<td><input type="text" name="get_time"></td>
</tr>
<tr>
<td>联系方式：</td>
<td><input type="text" name="get_tel" required=""></td>
</tr>
<tr>
<td>归还状态：</td>
<td><select name="get_status">
<option>已领取</option>
</select></td>
</tr>
</table>
<br />
<input value="提交"  type="submit" onclick="tijiao()" style="background-color:rgb(31, 121, 206);
color:#fff;width:100px;height:30px;margin-left:260px;cursor:pointer"/>
</form>
</c:when>


<%--admin_Pwd管理员密码修改 --%>
<c:when test="${param.method eq 'admin_Pwd'}">
<span style="font-size:15px;display:block;height:30px;width:1200px;margin:0 auto;padding-top:5px;background-color:rgb(31, 121, 206);color:#fff;text-indent:20px">
修改密码</span>
<br />
<form action="messageservlet?method=admin_Pwd" method="post">
<table class="demo3">
<tr>
<th>请输入你的旧密码：</th>
<td><input type="password" name="old_pwd" /></td>
</tr>
<tr>
<th>新密码：</th>
<td><input type="password" name="new_pwd"></td>
</tr>
<tr>
<th>重复输入新密码：</th>
<td><input type="password" name="re_pwd"></td>
</tr>
<tr>
<th></th>
<td><input type="submit" value="确定" style="background-color:rgb(31, 121, 206);
color:#fff;width:100px;height:30px;margin-top:10px;margin-left:30px;"/></td>
</tr>
</table>
</form>
</c:when>


<%--get_Search归还信息输出 --%>
<c:when test="${param.method eq 'get_Search'}">
 <span style="font-size:15px;display:block;height:30px;width:1200px;margin:0 auto;padding-top:5px;background-color:rgb(31, 121, 206);color:#fff;text-indent:20px">
归还信息表</span>
<br />
<table class="demo1" cellspacing="0">
<tr>
<td width="15%">物品名称</td>
<td width="15%">自取地点</td>
<td width="15%">归还时间</td>
<td width="15%">联系方式</td>
<td width="15%">归还状态</td>
<td width="15%">操作</td>
</tr>
<c:forEach items="${getterlist}" var="get">
<tr>
<td>${get.get_name}</td>
<td>${get.get_site}</td>
<td>${get.get_time}</td>
<td>${get.get_tel}</td>
<td>${get.get_status}</td>
<td><a href="messageservlet?method=get_Delete&get_name=${get.get_name}&get_time=${get.get_time}" style="border:1px solid red;border-radius:5px;padding:2px;color:red;">删除</a></td>
</tr>
</c:forEach>
</table>
</c:when>

 </c:choose>
 </div>
</div>
</body>
</html>