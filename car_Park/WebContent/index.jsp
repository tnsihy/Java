<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>停车场管理系统首页</title>
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
            filter: alpha(opacity=70);
            opacity: 0.7;
        }

        .btn {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 1;
            border: 1px solid rgb(31, 177, 245);
            border-radius: 5px;
            height: 400px;
        }

        .btn input {
            border-radius: 5px;
            border: 0;
            background-color: rgb(31, 177, 245);
            color: #fff;
            width: 120px;
            height: 70px;
            margin: 20px;
            cursor: pointer;
            outline: none;
            -webkit-box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.2);
            -moz-box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.2);
            box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.2);
            transition: all 0.5s ease-out;
            -webkit-transition: all 0.5s ease-out;
            -moz-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
        }

        .btn input:hover {
            background-color: rgb(61, 25, 221);
            transform: scale(1.55) translateZ(0);
            -webkit-transform: scale(1.55) translateZ(0);
            -moz-transform: scale(1.55) translateZ(0);
            -o-transform: scale(1.55) translateZ(0);
        }

        h2 {
            color: rgb(31, 177, 245);
            text-align: center;
            margin-top: 50px;
            margin-bottom: 30px;
        }
    </style>
</head>

<body>
    <div id="bgimg">
        <div class="btn">
            <h2>ChOOSE A ROLE</h2>
            <input type="button" value="临时用户" onclick="location.href='person1.jsp'" />
            <input type="button" value="会员" onclick="location.href='person2.jsp'" />
            <br />
            <input type="button" value="系统操作员" onclick="location.href='person3.jsp'" />
            <input type="button" value="系统管理员" onclick="location.href='person4.jsp'" />
        </div>
        <img src="image/01.jpg">
    </div>
</body>

</html>