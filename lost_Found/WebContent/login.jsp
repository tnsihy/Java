<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>失物招领平台</title>
<style type="text/css">
      *{
         margin:0;
         padding:0;
      }
      .main{
         width:360px;
         height:450px;
         /*border:1px solid rgb(82, 138, 221);*/
         text-align: center;
         margin:0 auto;
      }
      li{
         list-style: none;
      }
      h3{
         font-size: 45px;
         color: rgb(63, 161, 116);
         text-align: center;
         margin:50px auto;
         padding-top:50px;
         text-shadow:5px 2px 6px #ccc;
      }
      #ul1 li{
         display: inline-block;
         color:rgb(152, 153, 153);
         font-weight: bold;
         margin-left: 10px;
      }
      #ul1 li.active{
         width:50px;
         text-align: center;
         border:2px solid rgb(63, 161, 116);
         border-top: none;
         border-left: none;
         border-right:none;
      }
      .hide{
         display: none;
      }
      #ul1 li:hover{
         cursor:pointer;
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
         background-color: rgb(63, 161, 116);
         -webkit-appearance: none ;
         color:#fff;
      }
      .loginContent{
      /*background-image: url("image/05.png");*/
      }
</style>
<script type="text/javascript">
window.onload = function () {

    var loginButton = document.querySelector('.login');
    var registerButton = document.querySelector('.register');
    var loginContent = document.querySelector('.loginContent');
    var registerContent = document.querySelector('.registerContent');
    loginButton.addEventListener('click', function (e) {
       loginButton.className = 'active login';
       registerButton.className = 'register';
       registerContent.className = 'hide registerContent';
       loginContent.className = 'loginContent';
    })
    registerButton.addEventListener('click', function (e) {
       loginButton.className = 'login';
       registerButton.className = 'active register';
       registerContent.className = 'registerContent';
       loginContent.className = 'hide loginContent';
    })
 }
 
 function zhuce(){
	 alert("注册成功");
 }
</script>
</head>
<body>
   <div>
      <div class="main">
         <h3>失物招领平台</h3>
         <ul id="ul1">
            <li class="active login">登录</li>
            <li class="register">注册</li>
         </ul>
         <br />
         <div class="loginContent">
         <form action="${pageContext.request.contextPath}/messageservlet?method=login" method="post">
            <ul>
               <li><input type="text" id="num" name="num" placeholder="账号" required="" /></li>
               <li><input type="password" id="pwd" name="pwd" placeholder="密码" required="" /></li><br />
               <li><input class="button" type="submit" value="登录"></li>
            </ul>
         </form>
         </div>
         <div class="hide registerContent">
         <form action="messageservlet?method=register" method="post">
            <ul>
               <li><input type="text" name="num" placeholder="请输入注册邮箱" required="" /></li>
               <li><input type="text" name="name" placeholder="请输入昵称" required="" /></li>
               <li><input type="text" name="pwd" placeholder="请输入密码"  required=""/></li>
                <li><input type="text" name="tel" placeholder="请输入联系方式"  required=""/></li><br />
               <li><input class="button" type="submit" value="注册"  onclick="zhuce()"></li>
            </ul>
          </form>
         </div>
      </div>
   </div>
</body>
</html>