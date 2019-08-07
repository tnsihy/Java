<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>临时用户查询</title>
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
                <p>临时用户查询</p>
                <div class="search">
                    <form action="./userservlet?select=guestlogin" method='post'>
                        <input type=hidden name="select" value="message" />
                        <ul>
                            <!--<li>
                                <select id="carSize">
                                    <option>小型车(&lt;7m)</option>
                                    <option>中型车(>7m and &lt;10m)</option>
                                    <option>大型车(>10m)</option>
                                </select>
                            </li>-->
                            <li><input type="text" name="carnum" placeholder=" 车牌号码" id="num" onchange="checkNum()"
                                    required /></li>
                            <li class='btn'><input type="submit" value="提交查询" /></li>
                        </ul>
                    </form>
                    <input class='exit' type="button" value="返回" onclick="location.href='index.jsp'">
                </div>
            </div>
            <img src="image/01.jpg">
        </div>
    </div>
</body>

<script type="text/javascript">
    //·返回首页
    function changeUrl() {
        window.localtion = '/person1_message.jsp'
    }

    //·检查车牌号码
    function checkNum() {
        var num = document.getElementById('num').value;
        if (num != "") {
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
</script>

</html>