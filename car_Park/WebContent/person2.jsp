<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>会员注册与登录</title>
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
            /* filter: alpha(opacity=70);
            opacity: 0.7; */
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

        #select li {
            float: left;
            padding: 5px;
            text-align: center;
            font-size: 10px;
            width: 50%;
            cursor: pointer;
            border-radius: 5px;
        }

        .blue {
            background-color: rgb(103, 192, 252);
        }

        .hide {
            display: none;
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
                <p>会员注册与登录</p>
                <ul id="select">
                    <li class="">Register</li>
                    <li class="blue">Login</li>
                </ul>
                <div class="register hide">
                    <form action="./userservlet?select=memregister" method="post">
                        <input type=hidden name="select" value="message" />
                        <ul>
                            <li>
                                <select id="carSize" name="carsize">
                                    <option>小型车(&lt;7m)</option>
                                    <option>中型车(>7m and &lt;10m)</option>
                                    <option>大型车(>10m)</option>
                                </select>
                            </li>
                            <li><input type="text" name="carnum" placeholder=" 车牌号码" id="num" required
                                    onchange="checkNum()" /></li>
                            <li><input type="text" name="tel" placeholder=" 联系方式" id="tel1" required
                                    onchange="checkPhone1()" /></li>
                            <li><input type="password" name="mempwd" required placeholder=" 密码(6-12位),含数字,大小写字母"
                                    id="password" onchange="checkPassword()" /></li>
                            <li class='btn'><input type="submit" value="提交注册" /></li>
                        </ul>
                    </form>
                </div>
                <div class="login">
                    <form action="./userservlet?select=memlogin" method="post">
                        <input type=hidden name="select" value="message" />
                        <ul>
                            <li><input type="text" name="tel" required placeholder=" 联系方式" id="tel2"
                                    onchange="checkPhone2()" /></li>
                            <li><input type="password" required name="mempwd" placeholder=" 密码" /></li>
                            <li class='btn'><input type="submit" value="提交登录" /></li>
                        </ul>
                    </form>
                </div>
                <input class='exit' type="button" value="返回" onclick="location.href='index.jsp'">
            </div>
            <img src="image/01.jpg">
        </div>
    </div>
    <script type="text/javascript">
        //·检查手机号码
        function checkPhone1() {
            var tel1 = document.getElementById('tel1').value;
            if(tel1 == ""){}
            else if (!(/^1[34578]\d{9}$/.test(tel1))) {
                alert("手机号码有误，请重试");
            }
        }

        function checkPhone2() {
            var tel2 = document.getElementById('tel2').value;
            if(tel2 == ""){}
            else if (!(/^1[34578]\d{9}$/.test(tel2))) {
                alert("手机号码有误，请重试");
            }
        }
        //·检查密码
        function checkPassword() {
            var password = document.getElementById('password').value;
            if(password == ""){}
            else if (!(/((?=.*[0-9])(?=.*[a-z])|(?=.*[0-9])(?=.*[A-Z])|(?=.*[a-z])(?=.*[AZ]))^[0-9A-Za-z]{6,12}$/.test(
                    password))) {
                alert("密码设置有误，请重试");
            }
        }
        //·检查车牌号码
        function checkNum() {
            var num = document.getElementById('num').value;
            if(num != ""){
                if (!(/^([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领][A-Z][A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳使领])$/.test(num))) {
                    /*传统车牌：
                    第1位为省份简称（汉字）
                    第2位为发牌机关代号（A-Z的字母）
                    第3到第7位为序号（由字母或数字组成，但不存在字母I和O，防止和数字1、0混淆，
                    另外最后1位(第7位)可能是“挂学警港澳使领”中的一个汉字*/
                    alert("车牌输入有误，请重试");
                }
            }
        }


        window.onload = function () {
            //·注册与登录隐藏与显示处理
            function hideShow() {
                var oSelect = document.getElementById('select');
                var li_0 = oSelect.getElementsByTagName('li')[0];
                var li_1 = oSelect.getElementsByTagName('li')[1];
                var div_register = document.getElementsByClassName('register')[0];
                var div_login = document.getElementsByClassName('login')[0];

                li_0.onclick = function () {
                    li_0.className = 'blue';
                    li_1.className = '';
                    div_register.className = 'register';
                    div_login.className += ' hide';
                }

                li_1.onclick = function () {
                    li_1.className = 'blue';
                    li_0.className = '';
                    div_login.className = 'register';
                    div_register.className += ' hide';
                }
            }
            hideShow();
        }
    </script>
</body>

</html>