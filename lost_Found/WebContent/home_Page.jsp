<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>失物招领平台</title>
</head>
<style>
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
.top{
border-radius:4px;
box-shadow:0 4px 10px #bbb;
}
.left{
float:left;
width:170px;
height:240px;
margin:20px;
margin-top:40px;
font-size:15px;
border-radius :10px;
box-shadow:0 0 10px #bbb;
border:1px solid rgb(119, 126, 136);
overflow:hidden;
}

li{
list-style:none;
text-align:center;
border:1px solid rgb(119, 126, 136);
border-left:0;
border-right:0;
height:58px;
line-height: 50px;
margin-top:-1px;/*边框不叠加*/
}
li:last-of-type{
border-bottom:0;
}
a{
text-decoration: none;
color:rgb(119, 126, 136);
}
.right{
float:right;
border:1px solid #ccc;
border-radius:10px;
overflow:hidden;
width:1000px;
margin-right:80px;
margin-top:40px;
box-shadow:0 0 10px #bbb;
}
table{
margin:0 30px 30px 30px;
padding-left:10px;
border-radius:4px;
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
}
.demo td{
width:600px;
}
.left a.active{
	color:rgb(63, 161, 116);
	font-weight:bolder;
	font-size:20px;
}
.lostandfound input{
	border:none;
    border-bottom:1px solid rgb(131, 133, 136);
    outline:none;
}
</style>
<script type="text/javascript">
function tijiao(){
	alert("恭喜您提交成功");
}
window.onload=function(){

 var methodName=window.location.search.split('?')[1].split('=')[1];
 console.log(methodName)
 var selectedDom=document.querySelector('.'+methodName);
 selectedDom.className=methodName+' active';
}

</script>
<body>
<div class="top">
<span style="float:left;margin-left:20px">失物招领平台✍</span>
<span style="float:right;margin-right:20px">欢迎您，
<c:forEach items="${userlist}" var="user">
<span>${user.name}</span>
</c:forEach>
<a href="my_Home.jsp">个人中心</a>
<a href="login.jsp">退出登录</a>
</span>
</div>
<div class="main">
<div class="left">
<ul>
<li><a href="messageservlet?method=loster_Search" class='loster_Search'>寻物查询</a></li>
<li><a href="home_Page.jsp?method=loster_Record" class='loster_Record'>寻物登记</a></li>
<li><a href="messageservlet?method=picker_Search" class='picker_Search'>招领查询</a></li>
<li><a href="home_Page.jsp?method=picker_Record" class='picker_Record'>招领登记</a></li>
</ul>
</div>

<div class="right">
<c:choose>

<%--loster_Record失主失物挂失信息 --%>
<c:when test="${param.method eq'loster_Record'}">
<span style="font-size:15px;display:block;height:30px;padding-top:5px;background-color:rgb(63, 161, 116);color:#fff;text-indent:20px">
如您在<span style="border:2px dashed #fff;margin:0 5px;padding:0 5px;">失物</span>后需发布信息，请填写以下内容：</span>
<br />
<form action="messageservlet?method=loster_Record" method="post">
<table class="lostandfound">
<tr>
<td>丢失地点：</td>
<td><input type="text" name="lost_site" style="width:350px;"></td>
</tr>
<tr>
<td>丢失时间：</td>
<td><input type="text" name="lost_time" placeholder="格式：1997-08-30"></td>
</tr>
<tr>
<td>物品名称：</td>
<td><input type="text" name="lost_name"></td>
</tr>
<tr>
<td>物品颜色：</td>
<td><input type="text" name="lost_color" style="width:100px;"></td>
</tr>
<tr>
<td>联系方式：</td>
<td><input type="text" name="lost_tel"></td>
</tr>
<tr>
<td>当前状态：</td>
<td><select name="lost_status">
<option>未找到</option>
</select></td>
</tr>
</table>
<input value="提交"  type="submit" onclick="tijiao()" style="background-color:rgb(63, 161, 116);
color:#fff;width:100px;height:30px;margin-left:180px;cursor:pointer;border-radius:6px;"/>
</form>
<br />
</c:when>

<%--loster_Output挂失公告栏 --%>
<c:when test="${param.method eq'loster_Search'}">
<span style="font-size:15px;display:block;height:30px;padding-top:5px;background-color:rgb(63, 161, 116);color:#fff;text-indent:20px">
物品挂失公告栏</span>
<br />
<c:forEach items="${lostlist}" var="lost">
<c:forEach items="${userlist}" var="user">
<c:choose>
<c:when test="${lost.name eq user.name}">
<span style="display:block;margin-left:120px;color:rgb(131, 133, 136);font-size:15px">我：</span>
</c:when>
<c:when test="${lost.name ne user.name}">
<span style="display:block;margin-left:90px;color:rgb(131, 133, 136);font-size:15px">${lost.name}：</span>
</c:when>
</c:choose>
</c:forEach>
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
</table>
</c:forEach>
</c:when>

<%--picker_Record拾主拾物发布信息--%>
<c:when test="${param.method eq'picker_Record'}">
<span style="font-size:15px;display:block;height:30px;padding-top:5px;background-color:rgb(63, 161, 116);color:#fff;text-indent:20px">
如您在<span style="border:2px dashed #fff;margin:0 5px;padding:0 5px;">拾物</span>后需发布信息，请填写以下内容：</span>
<br />
<form action="messageservlet?method=picker_Record" method="post">
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
<td><input type="text" name="pick_tel"></td>
</tr>
<tr>
<td>当前状态：</td>
<td><select name="pick_status">
<option>未领取</option>
</select></td>
</tr>
</table>
<input value="提交"  type="submit" onclick="tijiao()" style="background-color:rgb(63, 161, 116);
color:#fff;width:100px;height:30px;margin-left:180px;cursor:pointer;border-radius:6px;"/>
</form>
<br />
</c:when>

<%--picker_Output拾物公告栏 --%>
<c:when test="${param.method eq 'picker_Search'}">
<span style="font-size:15px;display:block;height:30px;padding-top:5px;background-color:rgb(63, 161, 116);color:#fff;text-indent:20px">
物品拾物公告栏<span style="color:rgb(235, 231, 36);margin-left:20px">△温馨提示：管理员发布的拾物招领请到失物招领处领取登记</span></span>
<br />
<c:forEach items="${picklist}" var="pick">
<c:forEach items="${userlist}" var="user">
<c:choose>
<c:when test="${pick.name eq user.name}">
<span style="display:block;margin-left:120px;color:rgb(131, 133, 136);font-size:15px">我：</span>
</c:when>
<c:when test="${pick.name ne user.name}">
<span style="display:block;margin-left:90px;color:rgb(131, 133, 136);font-size:15px">${pick.name}：</span>
</c:when>
</c:choose>
</c:forEach>
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
</table>
</c:forEach>
</c:when>

</c:choose>
</div>
</div>
</body>
</html>