<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>系统管理员登录</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #ccc;
            position: relative;
        }

        #bgimg {
            width: 1000px;
            height: 560px;
            position: relative;
            left: 50%;
            transform: translate(-50%, 0%);
            margin-top: 20px;
        }

        img {
            width: 100%;
            height: 100%;
            border-radius: 10px;
            box-shadow: 10px 10px 10px rgb(70, 58, 58);
        }

        .bgcontainer {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #ccc;
            filter: alpha(opacity=70);
            opacity: 0.7;
            width: 400px;
            height: 400px;
            border-radius: 10px;
        }

        .container {
            z-index: 1;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .container p {
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
            font-size: 20px;
        }

        ul li {
            list-style: none;
        }

        ul li input,
        .exit {
            border: 0;
            height: 30px;
            width: 200px;
            margin: 5px;
            border-radius: 5px;
            outline: none;
        }

        .btn input,
        .exit {
            background-color: rgb(103, 192, 252);
            cursor: pointer;
        }

        .btn input:hover,
        .exit:hover {
            background-color: rgb(53, 85, 228);
            color: #fff;
        }

        #carSize {
            height: 30px;
            width: 200px;
            border-radius: 5px;
            margin: 5px;
            outline: none;
        }
    </style>
</head>

<body>
    <div>
        <div id="bgimg">
            <div class="bgcontainer"></div>
            <div class="container">
                <p>系统管理员登录</p>
                <div class="login">
                    <form action="./userservlet?select=adminlogin" method="post">
                        <input type=hidden name="select" value="personOne" />
                        <ul>
                            <li><input type="text" required name="adminnum" placeholder=" 管理员账号" /></li>
                            <li><input type="password" required name="adminpwd" placeholder=" 密码" /></li>
                            <li class='btn'><input type="submit" value="提交登录" /></li>
                        </ul>
                    </form>
                </div>
                <input class='exit' type="button" value="返回" onclick="location.href='index.jsp'">
            </div>
            <img src="image/01.jpg">
        </div>
    </div>
</body>

</html>