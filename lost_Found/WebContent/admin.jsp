<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      .main{
         width:360px;
         height:450px;
         text-align: center;
         margin:0 auto;
      }
       li{
         list-style: none;
      }
      h3{
         font-size: 45px;
         color: rgb(31, 121, 206);
         text-align: center;
         margin:0 auto;
         padding-top:120px;
         margin-bottom:30px;
         text-shadow:5px 2px 6px #ccc;
      }
      h4{
      color: rgb(31, 121, 206);
      font-weight:normal;
      }
       input{
         line-height: 30px;
         margin-bottom: 10px;
         width:180px;
         border-radius:6px;
         outline:none;
      }
      .button{
         text-align: center;
         width:220px;
         height:35px;
         background-color: rgb(31, 121, 206);
         color:#fff;
      }
</style>
</head>
<body>
<div class="main">
<h3>失物招领后台管理</h3>
         <div>
         <form action="messageservlet?method=admin_Login" method="post">
         <h4 style="margin-bottom:30px;">-------管理员失物招领后台管理-------</h4>
            <ul>
               <li><input type="text" id="num" name="num" placeholder="账号" required="" /></li>
               <li><input type="password" id="pwd" name="pwd" placeholder="密码" required="" /></li><br />
               <li><input class="button" type="submit" value="登录"></li>
            </ul>
         </form>
         </div>
</div>
</body>
</html>