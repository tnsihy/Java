<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>系统操作员的信息</title>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1106298_hahkukp2xft.css">
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    <style>
        @import url("//unpkg.com/element-ui@2.6.3/lib/theme-chalk/index.css");

        .col-2-5 {
            width: 19%;
        }

        .col-9 {
            width: 75%;
        }

        [class*="col-"] {
            float: left;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
        }

        .left {
            height: 600px;
            margin: 15px 0 0 15px;
        }

        .left-top {
            padding: 15px;
            background-color: rgb(46, 132, 230);
            text-align: center;
            color: #fff;
            font-size: 16px;
            border-top-left-radius: 10px;
            outline: none;
        }

        .left-bottom {
            height: 550px;
            background-color: rgb(83, 81, 81);
            border-bottom-left-radius: 10px;
        }

        .left-bottom p,
        .left-bottom a {
            color: #fff;
            text-align: center;
            height: 30px;
            line-height: 30px;
        }

        .left-bottom a {
            text-decoration: none;
        }

        .small {
            font-size: 14px;
        }

        .clicked {
            background-color: black;
        }

        .span {
            background-color: rgb(46, 132, 230);
        }

        .right {
            height: 600px;
            margin: 15px 0 0 0;
        }

        .right-top {
            background-color: rgb(241, 237, 237);
            padding: 15px;
            font-size: 16px;
            text-align: right;
            border-top-right-radius: 10px;
        }

        .right-top a {
            text-decoration: none;
            color: rgb(46, 132, 230);
        }

        .right-top a:hover {
            color: red;
        }

        .personMessage {
            margin: 15px 0 0 25px;
        }

        .one-border {
            border-bottom: 2px solid rgb(46, 132, 230);
        }

        .one-box {
            margin: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 2px #8b8383;
            transition: transform 0.5s;
            position: relative;
        }

        .one-box:hover {
            box-shadow: 0px 0px 5px #8b8383;
            transform: translate(0, -10px);
        }

        .one-box p {
            padding: 10px;
        }

        p.explain {
            font-size: 11px;
            color: rgb(160, 153, 153);
            padding: 10px;
            text-indent: 20px;
        }

        p.residue {
            font-size: 17px;
            color: rgb(236, 47, 47);
            margin-top: 15px;
            text-indent: 20px;
        }

        .personMessage .table {
            margin: 5px;
            width: 95%;
            border-collapse: collapse;
        }

        .personMessage .table td {
            text-align: center;
            border-bottom: 1px solid #ccc;
            padding: 10px;
            white-space:nowrap;
        }

        .input {
            height: 32px;
            line-height: 32px;
            outline: none;
            width:150px;
            border-radius:5px;
            border:1px solid #ddd;
            background-color:#fafafa;
        }

        .btn {
            padding: 7px 25px;
            background-color: rgb(46, 132, 230);
            color: #fff;
            border: 0;
            outline: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: rgb(53, 85, 228);
        }

        .btn1 {
            padding: 7px 25px;
            border: 1px solid rgb(46, 132, 230);
            outline: none;
            border-radius: 5px;
            background-color: #fff;
            color: rgb(46, 132, 230);
            cursor: pointer;
        }

        .btn1:hover {
            border: 1px solid rgb(73, 240, 176);
            color: rgb(73, 240, 176);
        }

        .table2 {
            box-shadow: 0px 0px 5px #8b8383;
            width: 35%;
            border-radius: 5px;
            margin: 20px 0 0 60px;
        }

        .table1 {
            margin: 20px;
        }

        .table1 tr,
        .table2 tr {
            height: 30px;
            line-height: 30px;
        }

        .table1 tbody:first-child {
            text-align: center;
        }

        .table1 input {
            border: 0;
            border-bottom: 1px solid rgb(46, 132, 230);
            outline: none;
            text-align: center;
        }

        #choice {
            border: 1px solid rgb(46, 132, 230);
            padding: 2px 5px;
            border-radius: 5px;
        }

        #where {
            border-radius: 5px;
            box-shadow: 0 0 5px #ccc;
            width: 800px;
            height: 300px;
            position: absolute;
            top: 0;
            left: 0;
            background: #fff;
            padding: 5px;
            font-size: 14px;
            overflow: scroll;
        }

        .provice {
            color: rgb(180, 186, 190);
        }

        div#where>span {
            cursor: pointer;
            display: inline-block;
            width: 30px;
        }

        div#where>span:hover {
            color: rgb(46, 132, 230);
        }

        .hide {
            display: none;
        }

        .active {
            display: block;
        }

        .idData {
            margin: 0 auto;
        }

         .idData tr {
            border-bottom: 1px solid #ccc;
        } 

        .idData td {
            text-align: center;
            width: 130px;
            height: 40px;
            white-space:nowrap;
        }

        #barcon {
            text-align: center;
            margin-top: 10px;
        }

        .a-upload {
            padding: 0px 10px;
            position: relative;
            cursor: pointer;
            color: #888;
            background: #fafafa;
            border: 1px solid #ddd;
            border-radius: 4px;
            overflow: hidden;
            display: inline-block;
            text-decoration: none;
            margin-top: 10px;
        }

        .a-upload input {
            position: absolute;
            right: 0;
            top: 0;
            opacity: 0;
            filter: alpha(opacity=0);
            cursor: pointer
        }

        .a-upload:hover {
            color: #444;
            background: #eee;
            border-color: #ccc;
            text-decoration: none
        }
    </style>

    <style type="text/css">
        .el-pagination {
            margin: 0 auto;
            width: 30%;
        }
    </style>

</head>

<body>
    <div class="container">
        <div class="left col-2-5">
            <div class="left-top">
                <i class="icon iconfont icon-chuzuchetianchong"></i> 停车场管理系统
            </div>
            <div class="left-bottom">
                <br />
                <p style="text-indent:-40px">停车管理<span style="float:right;font-size:12px"><i
                            class="icon iconfont icon-unfold"></i></span></p>
                <p class="clicked">
                    <span class="span" style="float:left">&nbsp;&nbsp;</span>
                    <a href="person3_message.jsp?select=enterRecord" class="small"><i
                            class="icon iconfont icon-edit"></i> 入场登记</a>
                </p>
                <p>
                    <span style="float:left">&nbsp;&nbsp;</span>
                    <a href="person3_message.jsp?select=exitRecord" class="small"><i
                            class="icon iconfont icon-qian"></i> 出场结算</a>
                </p>

                <p style="text-indent:-40px">信息管理<span style="float:right;font-size:12px"><i
                            class="icon iconfont icon-unfold"></i></span></p>
                <p>
                    <span style="float:left">&nbsp;&nbsp;</span>
                    <a href="person3_message.jsp?select=message" class="small"><i
                            class="icon iconfont icon-yonghutianchong"></i> 个人信息</a>
                </p>

                <p style="text-indent:-40px">账户与安全<span style="float:right;font-size:12px"><i
                            class="icon iconfont icon-unfold"></i></span></p>
                <p>
                    <span style="float:left">&nbsp;&nbsp;</span>
                    <a href="person3_message.jsp?select=password" class="small"><i
                            class="icon iconfont icon-xiugaitianchong"></i> 密码更改</a>
                </p>

                <p style="text-indent:-40px">历史记录<span style="float:right;font-size:12px"><i
                            class="icon iconfont icon-unfold"></i></span></p>
                <p>
                    <span style="float:left">&nbsp;&nbsp;</span>
                    <a href="./userservlet?select=historysearch&method=all" class="small"><i
                            class="icon iconfont icon-countdown" style="font-size:20px;"></i> 历史查询</a>
                </p>
            </div>
        </div>
        <div class="right col-9">
            <div class="right-top">
                <c:forEach items="${operatorlist}" var="operator">
                    <p><span style="margin-right:100px;color:red;">剩余车位：${carport}</span> ${operator.opernum}（系统操作员）您好，欢迎来到停车场管理系统！｜<a href="index.jsp">退出</a></p>
                </c:forEach>
            </div>
            <div class="right-bottom">
                <div class="personMessage">
                    <c:choose>

                        <%--OCR返回结果 --%>
                        <c:when test="${param.select eq 'OCR' }">
                            <c:forEach items="${car_Message}" var="car">
                                <span class='one-border'>登记信息</span>
                                <div class="one-box">
                                    <form action="./userservlet?select=enterrecord" method="post">
                                        <table class="table1">
                                            <tbody>
                                                <tr>
                                                    <td>车牌号码：</td>
                                                    <td><input type="text" name="carnum" value="${car.number}" /></td>
                                                </tr>
                                                <tr>
                                                    <td>车型：</td>
                                                    <td>
                                                        <select style="outline:none;font-size:16px;border-radius:5px"
                                                            name="carsize">
                                                            <option>小型车(&lt;7m)</option>
                                                            <option>中型车(>7m and &lt;10m)</option>
                                                            <option>大型车(>10m)</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>入口：</td>
                                                    <td>
                                                        <select style="outline:none;font-size:16px;border-radius:5px;"
                                                            name="entrance">
                                                            <option>A入口</option>
                                                            <option>B入口</option>
                                                            <option>C入口</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>入场时间：</td>
                                                    <td><input class="timer" type="text" name="entertime" /></td>
                                                </tr>
                                                <tr>
                                                    <td>入场操作员：</td>
                                                    <td>
                                                        <c:forEach items="${operatorlist}" var="operator">
                                                            <input type="text" name="operator" readonly
                                                                value="${operator.opernum}" />
                                                        </c:forEach>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <input type="submit" class='btn' style="margin-left:220px;margin-bottom:10px"
                                            value="确定" />
                                    </form>
                                    <button class="btn" onclick="history.go(-1)"
                                        style="position:absolute;top:182px;left:130px">返回</button>
                                </div>
                            </c:forEach>
                        </c:when>

                        <%--enterRecord入场登记 --%>
                        <c:when test="${param.select eq 'enterRecord' }">

                            <span class='one-border'>登记信息</span>
                            <div class="one-box">
                                <form action="userservlet?select=OCR&action=enter" method="post">
                                    <table class="table1">
                                        <tbody>
                                            <tr>
                                                <td>智能识别车牌：</td>
                                                <td id="td">
                                                    <a href="javascript:void(0)" class="a-upload">
                                                        <input type="file" name="image" />点击这里上传文件
                                                    </a>
                                                </td>
                                                <td><input type="submit" class='btn' style="margin-left:20px;"
                                                        value="获取车牌" /></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>

                                <form action="./userservlet?select=enterrecord" method="post">
                                    <table class="table1">
                                        <tbody>
                                            <tr>
                                                <td>车型:</td>
                                                <td>
                                                    <select style="outline:none;font-size:16px;border-radius:5px"
                                                        name="carsize">
                                                        <option>小型车(&lt;7m)</option>
                                                        <option>中型车(>7m and &lt;10m)</option>
                                                        <option>大型车(>10m)</option>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>车牌号码：</td>
                                                <td id="td">
                                                    <span id="choice">选择☰</span>
                                                    <input type="text" class="enterInput" required value=""
                                                        name="carnum" />
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>入口：</td>
                                                <td>
                                                    <select style="outline:none;font-size:16px;border-radius:5px;"
                                                        name="entrance">
                                                        <option>A入口</option>
                                                        <option>B入口</option>
                                                        <option>C入口</option>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>入场时间：</td>
                                                <td><input class="timer" type="text" required name="entertime" /></td>
                                            </tr>
                                            <tr>
                                                <td>入场操作员：</td>
                                                <td>
                                                    <c:forEach items="${operatorlist}" var="operator">
                                                        <input type="text" name="operator" readonly
                                                            value="${operator.opernum}" />
                                                    </c:forEach>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <button class="btn"
                                        style="margin-left:200px;margin-bottom:10px;background-color:rgb(197, 181, 157);"
                                        onclick="history.go(0)">重置</button>
                                    <button class='btn' type="submit">确认</button>
                                </form>
                                <div id="where" class="hide">
                                    <p class="provice">四川省（川）</p>
                                    <span>川A</span><span>川B</span><span>川C</span>
                                    <span>川D</span><span>川E</span><span>川F</span>
                                    <span>川H</span><span>川 J</span><span>川K</span>
                                    <span>川L</span><span>川M</span><span>川Q</span>
                                    <span>川R</span><span>川S</span><span>川T</span>
                                    <span>川U</span><span>川V</span><span>川W</span>
                                    <span>川X</span><span>川Y</span><span>川Z</span>
                                    <hr />
                                    <p class="provice">湖北省（鄂）</p>
                                    <span>鄂A</span><span>鄂B</span><span>鄂C</span>
                                    <span>鄂D</span><span>鄂E</span><span>鄂F</span>
                                    <span>鄂G</span><span>鄂H</span><span>鄂 J</span>
                                    <span>鄂K</span><span>鄂L</span><span>鄂M</span>
                                    <span>鄂N</span><span>鄂P</span><span>鄂Q</span>
                                    <span>鄂R</span><span>鄂S</span>
                                    <hr />
                                    <p class="provice">甘肃省（甘）</p>
                                    <span>甘A</span><span>甘B</span><span>甘C</span>
                                    <span>甘D</span><span>甘E</span><span>甘F</span>
                                    <span>甘G</span><span>甘H</span><span>甘 J</span>
                                    <span>甘K</span><span>甘L</span><span>甘M</span>
                                    <span>甘N</span><span>甘P</span>
                                    <hr />
                                    <p class="provice">江西省（赣）</p>
                                    <span>赣A</span><span>赣B</span><span>赣C</span>
                                    <span>赣D</span><span>赣E</span><span>赣F</span>
                                    <span>赣G</span><span>赣H</span><span>赣 J</span>
                                    <span>赣K</span><span>赣L</span><span>赣M</span>
                                    <hr />
                                    <p class="provice">贵州省（贵）</p>
                                    <span>贵A</span><span>贵B</span><span>贵C</span>
                                    <span>贵D</span><span>贵E</span><span>贵F</span>
                                    <span>贵G</span><span>贵H</span><span>贵 J</span>
                                    <hr />
                                    <p class="provice">广西壮族（桂）</p>
                                    <span>桂A</span><span>桂B</span><span>桂C</span>
                                    <span>桂D</span><span>桂E</span><span>桂F</span>
                                    <span>桂G</span><span>桂H</span><span>桂 J</span>
                                    <span>桂K</span><span>桂L</span><span>桂M</span>
                                    <span>桂N</span><span>桂P</span><span>桂R</span>
                                    <hr />
                                    <p class="provice">黑龙江省（黑）</p>
                                    <span>黑A</span><span>黑B</span><span>黑C</span>
                                    <span>黑D</span><span>黑E</span><span>黑F</span>
                                    <span>黑G</span><span>黑H</span><span>黑 J</span>
                                    <span>黑K</span><span>黑L</span><span>黑M</span>
                                    <span>黑N</span><span>黑P</span><span>黑R</span>
                                    <hr />
                                    <p class="provice">上海市（沪）</p>
                                    <span>沪A</span><span>沪B</span><span>沪C</span>
                                    <span>沪D</span>
                                    <hr />
                                    <p class="provice">吉林省（吉）</p>
                                    <span>吉A</span><span>吉B</span><span>吉C</span>
                                    <span>吉D</span><span>吉E</span><span>吉F</span>
                                    <span>吉G</span><span>吉H</span><span>吉 J</span>
                                    <hr />
                                    <p class="provice">河北省（冀）</p>
                                    <span>冀A</span><span>冀B</span><span>冀C</span>
                                    <span>冀D</span><span>冀E</span><span>冀F</span>
                                    <span>冀G</span><span>冀H</span><span>冀 J</span>
                                    <span>冀R</span><span>冀T</span>
                                    <hr />
                                    <p class="provice">天津市（津）</p>
                                    <span>津A</span><span>津B</span><span>津C</span>
                                    <span>津E</span>
                                    <hr />
                                    <p class="provice">山西省（晋）</p>
                                    <span>晋A</span><span>晋B</span><span>晋C</span>
                                    <span>晋D</span><span>晋E</span><span>晋F</span>
                                    <span>晋H</span><span>晋 J</span><span>晋K</span>
                                    <span>晋L</span><span>晋M</span>
                                    <hr />
                                    <p class="provice">北京市（京） </p>
                                    <span>京A</span><span>京B</span><span>京C</span>
                                    <span>京E</span><span>京F</span><span>京G</span>
                                    <span>京H</span>
                                    <hr />
                                    <p class="provice">辽宁省（辽） </p>
                                    <span>辽A</span><span>辽B</span><span>辽C</span>
                                    <span>辽D</span><span>辽E</span><span>辽F</span>
                                    <span>辽G</span><span>辽H</span><span>辽 J</span>
                                    <span>辽K</span><span>辽L</span><span>辽M</span>
                                    <span>辽N</span><span>辽P</span><span>辽V</span>
                                    <hr />
                                    <p class="provice">山东省（鲁） </p>
                                    <span>鲁A</span><span>鲁B</span><span>鲁C</span>
                                    <span>鲁D</span><span>鲁E</span><span>鲁F</span>
                                    <span>鲁G</span><span>鲁H</span><span>鲁 J</span>
                                    <span>鲁K</span><span>鲁L</span><span>鲁M</span>
                                    <span>鲁N</span><span>鲁P</span><span>鲁Q</span>
                                    <span>鲁R</span><span>鲁S</span><span>鲁U</span>
                                    <span>鲁V</span><span>鲁Y</span>
                                    <hr />
                                    <p class="provice"> 内蒙古（蒙）</p>
                                    <span>蒙A</span><span>蒙B</span><span>蒙C</span>
                                    <span>蒙D</span><span>蒙E</span><span>蒙F</span>
                                    <span>蒙G</span><span>蒙H</span><span>蒙 J</span>
                                    <span>蒙K</span><span>蒙L</span><span>蒙M</span>
                                    <hr />
                                    <p class="provice">福建省（闽）</p>
                                    <span>闽A</span><span>闽B</span><span>闽C</span>
                                    <span>闽D</span><span>闽E</span><span>闽F</span>
                                    <span>闽G</span><span>闽H</span><span>闽 J</span>
                                    <span>闽K</span>
                                    <hr />
                                    <p class="provice"> 宁夏回族（宁）</p>
                                    <span>宁A</span><span>宁B</span><span>宁C</span>
                                    <span>宁D</span>
                                    <hr />
                                    <p class="provice">青海省（青）</p>
                                    <span>青A</span><span>青B</span><span>青C</span>
                                    <span>青D</span><span>青E</span><span>青F</span>
                                    <span>青G</span><span>青H</span>
                                    <hr />
                                    <p class="provice">海南省（琼）</p>
                                    <span>琼A</span><span>琼B</span><span>琼C</span>
                                    <span>琼E</span>
                                    <hr />
                                    <p class="provice"> 陕西省（陕）</p>
                                    <span>陕A</span><span>陕B</span><span>陕C</span>
                                    <span>陕D</span><span>陕E</span><span>陕F</span>
                                    <span>陕G</span><span>陕H</span><span>陕 J</span>
                                    <span>陕K</span><span>陕U</span><span>陕V</span>
                                    <hr />
                                    <p class="provice"> 江苏省（苏）</p>
                                    <span>苏A</span><span>苏B</span><span>苏C</span>
                                    <span>苏D</span><span>苏E</span><span>苏F</span>
                                    <span>苏G</span><span>苏H</span><span>苏 J</span>
                                    <span>苏K</span><span>苏L</span><span>苏M</span>
                                    <span>苏N</span>
                                    <hr />
                                    <p class="provice"> 安徽省（晥）</p>
                                    <span>晥A</span><span>晥B</span><span>晥C</span>
                                    <span>晥D</span><span>晥E</span><span>晥F</span>
                                    <span>晥G</span><span>晥H</span><span>晥 J</span>
                                    <span>晥K</span><span>晥L</span><span>晥M</span>
                                    <span>晥N</span><span>晥P</span><span>晥Q</span>
                                    <span>晥R</span><span>晥S</span>
                                    <hr />
                                    <p class="provice">新疆维吾尔（新）</p>
                                    <span>新A</span><span>新B</span><span>新C</span>
                                    <span>新D</span><span>新E</span><span>新F</span>
                                    <span>新G</span><span>新H</span><span>新 J</span>
                                    <span>新K</span><span>新L</span><span>新M</span>
                                    <span>新N</span><span>新P</span><span>新Q</span>
                                    <span>新R</span>
                                    <hr />
                                    <p class="provice">湖南省（湘）</p>
                                    <span>湘A</span><span>湘B</span><span>湘C</span>
                                    <span>湘D</span><span>湘E</span><span>湘F</span>
                                    <span>湘G</span><span>湘H</span><span>湘 J</span>
                                    <span>湘K</span><span>湘L</span><span>湘M</span>
                                    <span>湘N</span><span>湘U</span><span>湘S</span>
                                    <hr />
                                    <p class="provice"> 重庆市（渝）</p>
                                    <span>渝A</span><span>渝B</span><span>渝C</span>
                                    <span>渝F</span><span>渝G</span><span>渝H</span>
                                    <hr />
                                    <p class="provice">河南省（豫）</p>
                                    <span>豫A</span><span>豫B</span><span>豫C</span>
                                    <span>豫D</span><span>豫E</span><span>豫F</span>
                                    <span>豫G</span><span>豫H</span><span>豫 J</span>
                                    <span>豫K</span><span>豫L</span><span>豫M</span>
                                    <span>豫N</span><span>豫P</span><span>豫Q</span>
                                    <span>豫R</span><span>豫S</span><span>豫U</span>
                                    <hr />
                                    <p class="provice">广东省（粤）</p>
                                    <span>粤A</span><span>粤B</span><span>粤C</span>
                                    <span>粤D</span><span>粤E</span><span>粤F</span>
                                    <span>粤G</span><span>粤H</span><span>粤 J</span>
                                    <span>粤K</span><span>粤L</span><span>粤M</span>
                                    <span>粤N</span><span>粤P</span><span>粤Q</span>
                                    <span>粤R</span><span>粤S</span><span>粤T</span>
                                    <span>粤U</span><span>粤V</span><span>粤W</span>
                                    <span>粤X</span><span>粤Y</span><span>粤Z</span>
                                    <hr />
                                    <p class="provice"> 云南省（云）</p>
                                    <span>云A</span><span>云C</span><span>云D</span>
                                    <span>云E</span><span>云F</span><span>云G</span>
                                    <span>云H</span><span>云 J</span><span>云K</span>
                                    <span>云L</span><span>云M</span><span>云N</span>
                                    <span>云P</span><span>云Q</span><span>云R</span>
                                    <span>云S</span>
                                    <hr />
                                    <p class="provice">西藏（藏）</p>
                                    <span>藏A</span><span>藏B</span><span>藏C</span>
                                    <span>藏D</span><span>藏E</span><span>藏F</span>
                                    <span>藏G</span><span>藏H</span><span>藏 J</span>
                                    <hr />
                                    <p class="provice">浙江省（浙）</p>
                                    <span>浙A</span><span>浙B</span><span>浙C</span>
                                    <span>浙D</span><span>浙E</span><span>浙F</span>
                                    <span>浙G</span><span>浙H</span><span>浙 J</span>
                                    <span>浙K</span><span>浙L</span>
                                    <hr />
                                </div>
                            </div>
                        </c:when>

                        <%--exitRecord登记出场--%>
                        <c:when test="${param.select eq 'exitRecord' }">
                            <span class='one-border'>出场结算</span>
                            <div class="one-box" style="height:200px">
                                <br />
                                <form action="userservlet?select=OCR&action=exit" method="post">
                                    <table class="table1" style="margin:10px;">
                                        <tbody>
                                            <tr>
                                                <td>智能识别车牌：</td>
                                                <td id="td">
                                                    <a href="javascript:void(0)" class="a-upload">
                                                        <input type="file" name="image"/>点击这里上传文件
                                                    </a>
                                                </td>
                                                <td><input type="submit" class='btn' style="margin-left:20px;" value="获取车牌" /></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                                <p style="margin-left:20px;">
                                                     人工输入：<input type="text" class="input" id="carnuminput"/>&nbsp;
                                    <button class="btn" onclick="carnumSearch()" style="margin-left:20px;">搜索</button>
                                </p >
                            </div>
                        </c:when>
                        
<%--outAccount出场结算 --%>
<c:when test="${param.select eq 'outAccount' }">
<span class='one-border'>出场结算</span>
<div class="one-box" style="height:480px">
<br />
<p>
<input type="text" class="input" id="carnuminput" name="carnum"/>&nbsp;
<button class="btn" type="submit" onclick="carnumSearch()">搜索</button>
</p>
<div class="smallList">
<form action="./userservlet?select=moneyinput&method=card" method="post">
<c:forEach items="${recordlist}" var="record">
<table class="table1">
<tbody>
<tr>
<td>车型：</td>
<td>${record.carsize}</td>
</tr>
<tr>
<td>车牌号码：</td>
<td><input readonly name="carnum" value="${record.carnum}" id="_carnum"/></td>
</tr>
<tr>
<td>入口：</td>
<td>${record.entrance}</td>
</tr>
<tr>
<td>入场时间：</td>
<td><input type="text" readonly class="timer" value="${record.entertime}"></td>
</tr>
<tr>
<td>出口：</td>
<td><select style="outline:none;font-size:16px;border-radius:5px;" name="exit1" id="_exit1">
<option>A出口</option>
<option>B出口</option>
<option>C出口</option>
</select>
</td>
</tr>
<tr>
<td>出场时间：</td>
<td><input class="timer" type="text" required name="exittime" id="_exittime">
</td>
</tr>
<tr>
<td>停车时长：</td>
<td><input type="text" required readonly name="staytime"
id="staytime"></td>
</tr>
<tr>
<td>结算费用(元)：</td>
<td><input type="text" readonly name="fee" id="fee"></td>
</tr>
<tr>
<td>出场操作员：</td>
<td><c:forEach items="${operatorlist}" var="operator">
<input type="text" name="exitopernum" readonly
value="${operator.opernum}" id="_exitopernum"/>
</c:forEach>
</td>
</tr>
<tr>
<c:forEach items="${memberlist1}" var="member">
<td>余额(元)：</td>
<!-- ·获取入场信息时判断是否在会员表里有余额选项 -->
<td><input type="text" value="${member.balance}"  id="balance" name="balance" readonly/>
</td>
</c:forEach>
</tr>
<tr>
<td><button class="btn" type="button" style="margin-bottom:4px;width:106px;height:30px;background-color:rgb(236, 110, 78);" onclick="window.location.href='./person3_message.jsp?select=exitRecord'">返回</button>
</td>
<td>
<c:forEach items="${memberlist1}" var="member">
<c:if test="${member.balance ne ''}">
<button class="btn" type="submit" id="btn" style="margin-bottom:5px;">余额缴费</button>
</c:if>
</c:forEach>
<button class="btn" onclick="cash()" type="button" style="margin-bottom:5px;">现金缴费</button>
</td>
</tr>
</tbody>
</table>
</c:forEach>
</form>
</div>
</div>
</c:when>


                        <%-- message个人信息 --%>
                        <c:when test="${param.select eq 'message'}">
                            <span class='one-border'>个人信息</span>
                            <p style="margin: 10px 0 0 20px">操作员工号：
                                <c:forEach items="${operatorlist}" var="operator">${operator.opernum}</c:forEach>
                            </p>
                        </c:when>

                        <%--password密码更改 --%>
                        <c:when test="${param.select eq 'password'}">
                            <span class='one-border'>密码更改</span>
                                <table class="table1">
                                    <tbody>
                                        <tr>
                                            <td>原密码：</td>
                                            <td><input type="password" id="oldPassword" name="oldPassword" required/></td>
                                        </tr>
                                        <tr>
                                            <td>新密码：</td>
                                            <td><input type="password"  id="newPassword" name="newPassword" required/></td>
                                        </tr>
                                        <tr>
                                            <td>再次确认密码：</td>
                                            <td><input type="password" id="passwordConfirm" required/></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <button class='btn' type="submit" onclick="changePassword()" style="margin-left:200px">确认</button>
                        </c:when>

                        <%--historySearch历史查询 --%>
                        <c:when test="${param.select eq 'historySearch'}">
                            <span class='one-border'>历史查询</span>
                                <p>
	                                    <input type="text" class="input" id="carnuminput" name="carnum" style="margin-top:5px;"/>&nbsp;
	                                    <button class="btn" type="submit" onclick="historySearch()">搜索</button>
                                    </p>
                                    <c:if test="${Allhistorylist!=null}">
                                    <table class="table">
                                    <tbody>
                                        <tr class='one-border'>
                                            <td>车牌号码</td>
                                            <td>车型</td>
                                            <td>入场时间</td>
                                            <td>入口</td>
                                            <td>出场时间</td>
                                            <td>出口</td>
                                            <td>停车时长</td>
                                            <td>扣除费用</td>
                                            <td>状态</td>
                                        </tr>
                                        <c:forEach items="${Allhistorylist}" var="hl">
                                        <tr> 
                                            <td>${hl.carnum}</td>
                                            <td>${hl.carsize}</td>
                                            <td>${hl.entertime}</td>
                                            <td>${hl.entrance}</td>
                                            <td>${hl.exittime}</td>
                                            <td>${hl.exit1}</td>
                                            <td>${hl.staytime}</td>
                                            <td>${hl.fee}</td>
                                            <td><span style="color:#fff;background-color:rgb(82, 238, 43);border-radius:5px;padding:5px;">${hl.status}</span></td>
                                            </tr>
                                            </c:forEach>
                                    </tbody>
                                </table>
                                </c:if>
                                <br />
                        </c:when>
                        
                        <%--historySearch历史查询结果--%>
                        <c:when test="${param.select eq 'historyList'}">
                            <span class='one-border'>历史查询</span>

                                <br />
                                <p>
	                                    <input type="text" class="input" id="carnuminput" name="carnum" style="margin-top:5px"/>&nbsp;
	                                    <button class="btn" type="submit" onclick="historySearch()">搜索</button>
                                    </p>
                                <table class="table">
                                    <tbody>
                                        <tr class="one-border">
                                            <td>车牌号码</td>
                                            <td>车型</td>
                                            <td>入场时间</td>
                                            <td>入口</td>
                                            <td>出场时间</td>
                                            <td>出口</td>
                                            <td>停车时长</td>
                                            <td>扣除费用</td>
                                            <td>状态</td>
                                        </tr>
                                        <c:forEach items="${historylist}" var="hl">
                                        <tr> 
                                            <td>${hl.carnum}</td>
                                            <td>${hl.carsize}</td>
                                            <td>${hl.entertime}</td>
                                            <td>${hl.entrance}</td>
                                            <td>${hl.exittime}</td>
                                            <td>${hl.exit1}</td>
                                            <td>${hl.staytime}</td>
                                            <td>${hl.fee}</td>
                                            <td><span style="color:#fff;background-color:rgb(82, 238, 43);border-radius:5px;padding:5px;">${hl.status}</span></td>
                                            </tr>
                                            </c:forEach>
                                    </tbody>
                                </table>
                        </c:when>
                    </c:choose>

                </div>
            </div>
        </div>
    </div>
    <script type='text/javascript'>
        //·获取select值
        function request(key) {
            var url = location.search; //·获取url中"?"符后的字串
            var theRequest = {};
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                strs = str.split("&");
                for (var i = 0; i < strs.length; i++) {
                    theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
                }
            }
            return theRequest[key] || null;
        }

        //·车牌搜索
        function carnumSearch() {
            var carnuminput = document.getElementById('carnuminput').value;
            if (/^([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领][A-Z][A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳使领])$/.test(
                carnuminput)) {
                window.location.href = "./userservlet?select=carnumsearch&carnum=" + carnuminput;
            } else if (carnuminput == "" || carnuminput == null) {
                alert("搜索不能为空，请重新输入");
                window.location.href = "person3_message.jsp?select=outAccount";
            } else {
                alert("车牌格式不正确，请重新输入");
                window.location.href = "person3_message.jsp?select=outAccount";
            }
        }
      //现金缴费
        function cash(){
        var carnum = document.getElementById('_carnum').value;
        var exit1 = document.getElementById('_exit1').value;
        var exittime = document.getElementById('_exittime').value;
        var staytime = document.getElementById('staytime').value;
        var fee = document.getElementById('fee').value;
        var exitopernum = document.getElementById('_exitopernum').value;
        $.ajax({
        type:'POST',
        async:true,
        data:{carnum:carnum,exit1:exit1,exittime:exittime,staytime:staytime,fee:fee,exitopernum:exitopernum},
        url:'./userservlet?select=moneyinput&method=cash',
        success:function(){
        alert('现金缴费成功!');
        window.location='http://localhost:8080/car_Park/person3_message.jsp?select=enterRecord';
        }
        })
        }

        //·历史搜索
        function historySearch() {
            var carnuminput = document.getElementById('carnuminput').value;
            if (/^([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领][A-Z][A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳使领])$/.test(
                carnuminput)) {
                window.location.href = "./userservlet?select=historysearch&role=operator&carnum=" + carnuminput;
            } else if (carnuminput == "" || carnuminput == null) {
                alert("搜索不能为空，请重新输入");
                window.location.href = "person3_message.jsp?select=historySearch";
            } else {
                alert("车牌格式不正确，请重新输入");
                window.location.href = "person3_message.jsp?select=historySearch";
            }
        }
        
        //修改密码
        function changePassword() {
        var password=${operatorlist[0].getOperpwd()};
        var opernum = "${operatorlist[0].getOpernum()}";
        //console.log(opernum);
        var oldPassword = document.getElementById('oldPassword').value;
        var newPassword = document.getElementById('newPassword').value;
        var passwordConfirm = document.getElementById('passwordConfirm').value;
        //alert(passwordConfirm);
        if(oldPassword!=""&&newPassword!=""&&passwordConfirm!=""){
        if(password==oldPassword){
        if(newPassword==passwordConfirm){
        	$.ajax({
        	    type:'POST',
        		async:true,
        		data:{newPassword:newPassword,opernum:opernum,role:"operator"},
        		url:'./userservlet?select=changepassword',
        		success:function(){
        			alert('修改成功！请重新登录');
        			window.location='http://localhost:8080/car_Park/';
        			
        		}
        	})
              
              }else{
              alert("两次输入的密码不一致！");
              }
              }else{
              alert("原密码不正确！");
              }
              }else{
              alert("请填写完整信息");
              }
        }

        //·缴费按钮，被点击时调用
/*         function rec() {
            var member = confirm("是会员吗");
            if (member == true) {
                var card = confirm("'余额扣费'选择'确定'，'现金'选择'取消'");
                if (card == true) {
                    var balance = document.getElementById('balance');
                    if (balance.innerHTML > 0) {
                        balance.innerHTML -= 55; //·55是我假设的值
                        var btn = document.getElementById('btn');
                        btn.innerHTML = '已缴费';
                        btn.style.backgroundColor = "rgb(88, 243, 127)";
                    }
                } else if (card == false) {
                    var cash = confirm("是否缴纳了现金？");
                    if (cash == true) {
                        alert("缴纳成功！");
                        var btn = document.getElementById('btn');
                        btn.innerHTML = '已缴费';
                        btn.style.backgroundColor = "rgb(88, 243, 127)";
                    } else if (cash == false) {
                        alert("请重新缴纳费用！");
                    }
                }
            } else if (member == false) {
                alert("请用现金缴费！");
                var cash = confirm("是否缴纳了现金？");
                if (cash == true) {
                    alert("缴纳成功！");
                    btn.innerHTML = '已缴费';
                    btn.style.backgroundColor = "rgb(88, 243, 127)";
                    var btn = document.getElementById('btn');
                } else if (cash == false) {
                    alert("请重新缴纳费用！");
                }
            }
        }
 */
        //·分页
/*         if (request('select') == 'historySearch') {
            goPage(1, 7);
            function goPage(pno, psize) {
                var itable = document.getElementById("idData");
                var num = itable.rows.length; //·表格所有行数(所有记录数)
                var totalPage = 0; //·总页数
                var pageSize = psize; //·每页显示行数
                //·总共分几页
                var numPage = num / pageSize;
                if (numPage > parseInt(numPage)) {
                    totalPage = parseInt(numPage) + 1;
                } else {
                    totalPage = parseInt(numPage);
                }
                var currentPage = pno; //·当前页数
                var startRow = (currentPage - 1) * pageSize + 1; //·开始显示的行 31
                var endRow = currentPage * pageSize; //·结束显示的行  40
                endRow = (endRow > num) ? num : endRow; //40
                //·遍历显示数据实现分页
                for (var i = 1; i < (num + 1); i++) {
                    var irow = itable.rows[i - 1];
                    if (i >= startRow && i <= endRow) {
                        irow.style.display = "block";
                    } else {
                        irow.style.display = "none";
                    }
                }
                var tempStr = "共 " + num + " 条记录  分 " + totalPage + " 页  当前第 " + currentPage + " 页";
                if (currentPage > 1) {
                    tempStr += "<a href=\"#\" onClick=\"goPage(" + (1) + "," + psize + ")\">首页</a>";
                    tempStr += "<a href=\"#\" onClick=\"goPage(" + (currentPage - 1) + "," + psize + ")\"><上一页</a>"
                } else {
                    tempStr += " 首页";
                    tempStr += " <上一页  ";
                }
                if (currentPage < totalPage) {
                    tempStr += "<a href=\"#\" onClick=\"goPage(" + (currentPage + 1) + "," + psize + ")\">下一页></a>";
                    tempStr += "<a href=\"#\" onClick=\"goPage(" + (totalPage) + "," + psize + ")\">尾页</a>";
                } else {
                    tempStr += "  下一页>  ";
                    tempStr += "  尾页";
                }
                document.getElementById("barcon").innerHTML = tempStr;
            }
        } */
        

        //window.onload
        window.onload = function () {
            var where = document.getElementById('where');

            //·下拉框所在位置
            if (request('select') == 'enterRecord') {
                function dropDownPosition() {
                    var td = document.getElementById('td');
                    if (td) {
                        var left = td.offsetLeft;
                        var top = td.offsetTop;
                        where.style.left = left + 10 + 'px';
                        where.style.top = top + td.clientHeight + 90 + 'px';
                    }
                }
                dropDownPosition();

                //·下拉框鼠标移动时出现，空白处点击隐藏
                function dropDownChoice() {
                    var choice = document.getElementById('choice');
                    if (choice) {
                        choice.addEventListener('mouseover', function () {
                            where.className = 'active';
                        });
                        document.onclick = function () {
                            where.className = 'hide';
                        }
                    }
                }
                dropDownChoice();
                //·当下拉框中内容被点击时
                function dropDownClick() {
                    var where = document.getElementById('where');
                    var enterInput = document.getElementsByClassName('enterInput')[0];
                    var Ospan = where.getElementsByTagName('span');
                    if (Ospan && enterInput) {
                        for (var i = 0; i < Ospan.length; i++) {
                            Ospan[i].onclick = function () {
                                enterInput.value = this.innerHTML;
                            }
                        }
                    }
                }
                dropDownClick();
            }

            //·将毫秒转化为时分秒
            function formatTime(result) {
                var days = parseInt(result / (1000 * 60 * 60 * 24));
                var hours = parseInt((result % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = parseInt((result % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = (result % (1000 * 60)) / 1000;
                var mix = days*24 + hours; //将天数计为小时单位
                var fee = document.getElementById('fee');
                if(mix > 2){ //5元/2h以内包括2h；超过2h +1元/h，不足1h按1h算
                	if(minutes !=0 ||seconds != 0){
                		fee.value = (5 + (mix-2)*1 + 1);
                	}else{
                		fee.value = (5 + (mix-2)*1);
                	}
                }else{
                	fee.value = 5;
                }
                return days + '天' + hours + '时' + minutes + '分' + seconds + '秒';
            }

            //·获取时间
            var myDate = new Date();
            var year = myDate.getFullYear();
            var month = Number(myDate.getMonth() + Number(1));
            var date = myDate.getDate();

            function nowTime() {
                if (month < 10) {
                    month = '0' + month;
                } else {
                    return month;
                }

                if (date < 10) {
                    date = '0' + date;
                } else {
                    return date;
                }
            }
            nowTime();
            if (request('select') == 'enterRecord' || request('select') == 'OCR') {
                var timer = document.getElementsByClassName('timer')[0];
                if (timer.addEventListener) {
                    timer.addEventListener('click', function () {
                        timer.value = year + '-' + month + '-' + date + ' ' + myDate.toLocaleTimeString(
                            'en', {
                                hour12: false
                            });
                    })
                } else if (timer.attachEvent) {
                    timer.attachEvent('onclick', function () {
                        timer.value = year + '-' + month + '-' + date + ' ' + myDate.toLocaleTimeString({
                            hour12: false
                        });
                    })
                }
            }
            if (request('select') == 'outAccount') {
                //·搜索后才能有class=timer出现
                var timer = document.getElementsByClassName('timer')[1];
                if (timer.addEventListener) {
                    timer.addEventListener('click', function () {
                        timer.value = year + '-' + month + '-' + date + ' ' + myDate.toLocaleTimeString(
                            'en', {
                                hour12: false
                            });
                        var staytime = document.getElementById('staytime'); //停车时长
                        var demo = document.getElementsByClassName("timer");
                        //·获取出场时间-入场时间的毫秒数
                        var result = new Date(Date.parse((demo[1].value).replace(/-/g, "/"))) - new Date(
                            Date.parse((demo[0].value).replace(/-/g, "/")));
                        console.log(formatTime(result));
                        staytime.value = formatTime(result); //将毫秒数转化为时分秒
                        
                    })
                }
            }

            //·左侧导航高亮
            function highLight() {
                var selectName;
                if (window.location.search) {
                    selectName = window.location.search.split('?')[1].split('=')[1];
                }
                var selectedDoms = document.querySelectorAll('p'),
                    selectedSpans = document.querySelectorAll('span'),
                    domOne = selectedDoms[1].className;
                spanOne = selectedSpans[1].className;

                if (selectName == 'enterRecord') {
                    selectedDoms[1].className = 'clicked';
                    selectedSpans[1].className = 'span';
                } else if (selectName == 'outAccount' ||selectName == 'exitRecord') {
                    selectedDoms[1].className = '';
                    selectedSpans[1].className = '';
                    selectedDoms[2].className = 'clicked';
                    selectedSpans[2].className = 'span';
                } else if (selectName == 'message') {
                    selectedDoms[1].className = '';
                    selectedSpans[1].className = '';
                    selectedDoms[4].className = 'clicked';
                    selectedSpans[4].className = 'span';
                } else if (selectName == 'password') {
                    selectedDoms[1].className = '';
                    selectedSpans[1].className = '';
                    selectedDoms[6].className = 'clicked';
                    selectedSpans[6].className = 'span';
                } else if (selectName == 'historySearch' || selectName == 'historyList') {
                    console.log(selectedDoms[8]);
                    selectedDoms[1].className = '';
                    selectedSpans[1].className = '';
                    selectedDoms[8].className = 'clicked';
                    selectedSpans[8].className = 'span';
                }
            }
            highLight();
        }
    </script>
</body>

</html>