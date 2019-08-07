<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>会员用户的信息</title>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1106298_hahkukp2xft.css">
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    <style>
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
            /* background-color: #ccc; */
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
            /* background-color: rgb(214, 236, 162); */
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

        .personMessage .table {
            margin: 20px;
            width: 95%;
            border-collapse: collapse;
        }

        .personMessage .table td {
            text-align: center;
            border-bottom: 1px solid #ccc;
            padding: 7px;
            white-space:nowrap;
        }

        .input {
            height: 30px;
            line-height: 30px;
            margin: 10px 0 20px 10px;
            outline: none;
        }

        .btn {
            padding: 7px 25px;
            background-color: rgb(46, 132, 230);
            color: #fff;
            border: 0;
            outline: none;
            border-radius: 5px;
            font-size: 14px;
            margin-bottom: 20px;
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

        .table1 {
            margin: 20px;
        }

        .table1 tr {
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

                <p style="text-indent:-40px">信息管理<span style="float:right;font-size:12px"><i
                            class="icon iconfont icon-unfold"></i></span></p>
                <p class="clicked">
                    <span class="span" style="float:left">&nbsp;&nbsp;</span>
                    <a href="person2_message.jsp?select=message" class="small"><i
                            class="icon iconfont icon-yonghutianchong"></i> 个人信息</a>
                </p>

                <p style="text-indent:-40px">停车记录<span style="float:right;font-size:12px"><i
                            class="icon iconfont icon-unfold"></i></span></p>
                <p>
                    <span style="float:left">&nbsp;&nbsp;</span>
                    <a href="./userservlet?select=memhistory&role=member&carnum=${memberlist[0].getCarnum()}" class="small"><i class="icon iconfont icon-qian"></i>
                        扣费查询</a>
                </p>

                <p style="text-indent:-40px">账户与安全<span style="float:right;font-size:12px"><i
                            class="icon iconfont icon-unfold"></i></span></p>
                <p>
                    <span style="float:left">&nbsp;&nbsp;</span>
                    <a href="person2_message.jsp?select=charge" class="small"><i
                            class="icon iconfont icon-zuanshitianchong"></i> 余额充值</a>
                </p>
                <p>
                    <span style="float:left">&nbsp;&nbsp;</span>
                    <a href="person2_message.jsp?select=password" class="small"><i
                            class="icon iconfont icon-xiugaitianchong"></i> 密码更改</a>
                </p>

            </div>
        </div>
        <div class="right col-9">
            <div class="right-top">
                <c:forEach items="${memberlist}" var="member">
                    <p>${member.carnum}（会员）您好，欢迎来到停车场管理系统！｜<a href="index.jsp">退出</a></p>
                </c:forEach>
            </div>
            <div class="right-bottom">
                <div class="personMessage">

                    <c:choose>
                    
                    <%--message个人信息 --%>
                        <c:when test="${param.select eq'message'}">
                            <span class='one-border'>个人信息</span>
                            <p class="explain">扣费说明：停车2h以内（包括2h）统一收取5元。超过2h的部分，每1h按1元算，不超过1h按1元算。</p>
                            <c:forEach items="${memberlist}" var="memberlist">
                            <div class="one-box">
                                <p>车型：${memberlist.carsize}</p>
                                <p>车牌号码：${memberlist.carnum}</p>
                                <p>联系方式：${memberlist.tel}</p>
                                <p>余额：${memberlist.balance}</p>
                            </div>
                            </c:forEach>
                        </c:when>

                        <%--message个人信息 --%>
                        <c:when test="${param.select eq'carmessage'}">
                            <span class='one-border'>个人信息</span>
                            <p class="explain">扣费说明：在这里说明停车扣费的情况，我还没组织好语言。</p>
                            <div class="one-box">
                                <p>车型：</p>
                                <p>车牌号码：</p>
                                <p>联系方式：</p>
                                <p>入口：</p>
                                <p>入场时间：</p>
                                <p>停车时长：</p>
                                <p>即时费用：</p>
                            </div>
                        </c:when>

                        <%-- cost扣费纪录 --%>
                        <c:when test="${param.select eq 'cost' }">
                            <span class='one-border'>扣费记录</span>
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
                                    <c:forEach items="${memberhl}" var="memberhl">
                                    <tr>
                                        <td>${memberhl.carnum}</td>
                                        <td>${memberhl.carsize}</td>
                                        <td>${memberhl.entertime}</td>
                                        <td>${memberhl.entrance}</td>
                                        <td>${memberhl.exittime}</td>
                                        <td>${memberhl.exit1}</td>
                                        <td>${memberhl.staytime}</td>
                                        <td>${memberhl.fee}</td>
                                        <td><span class="state" style="padding:5px;border-radius:5px">${memberhl.status}</span></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:when>

                        <%--charge余额查询和充值 --%>
                        <c:when test="${param.select eq 'charge' }">
                            <span class='one-border'>余额查询和充值</span>
                            <div class="one-box">
                            <c:forEach items="${memberlist}" var="memberlist">
                                <p>余额：${memberlist.balance}</p>
                            </c:forEach>
                                <input type="text" class="input" />
                                <button class='btn' onclick="handleClick()">充值</button>
                                <p style="color:rgb(167, 157, 157);font-size:14px">充值优惠套餐</p>
                                <div id="div">
                                 <p>
                                    <button class="btn1">30元<br />售价29.94元</button>
                                    <button class="btn1">50元<br />售价49.90元</button>
                                    <button class="btn1">100元<br />售价99.80元</button>
                                </p>
                                <p>
                                    <button class="btn1">200元<br />售价199.60元</button>
                                    <button class="btn1">300元<br />售价299.40元</button>
                                    <button class="btn1">500元<br />售价499.00元</button>
                                </p>
                                </div>
                            </div>
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
                                <button class='btn' type="button" onclick="changePassword()" style="margin-left:200px">确认</button>
                        </c:when>

                    </c:choose>
                </div>
            </div>
        </div>
    </div>
    <script type='text/javascript'>
    
    //修改密码
        function changePassword() {
        var password="${memberlist[0].getMempwd()}";
        var memnum = "${memberlist[0].getCarnum()}";
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
        		data:{newPassword:newPassword,memnum:memnum,role:"member"},
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
    	//·充值
    	$("#div").click(function(event){
    		var reCharge = event.target.innerHTML.split('元')[0]; //获取点击的充值数
    		<c:forEach items="${memberlist}" var="memberlist">
    		var firstBalance = '${memberlist.balance}';
    		var carnum = '${memberlist.carnum}';
    		</c:forEach>
        	$.ajax({
        	    type:'POST',
        		async:true,
        		data:{reCharge:reCharge,firstBalance:firstBalance,carnum:carnum},
        		url:'./userservlet?select=recharge',
        		success:function(){
        			alert('充值成功！');
        			window.location='http://localhost:8080/car_Park/person2_message.jsp?select=charge';
        		}
        	})
    	})
        
    	function handleClick(){
    		var doc = document.getElementsByClassName('input')[0].value;
    		<c:forEach items="${memberlist}" var="memberlist">
    		var firstBalance = '${memberlist.balance}';
    		var carnum = '${memberlist.carnum}';
    		</c:forEach>
        	$.ajax({
        	    type:'POST',
        		async:true,
        		data:{reCharge:doc,firstBalance:firstBalance,carnum:carnum},
        		url:'./userservlet?select=recharge',
        		success:function(){
        			alert('充值成功！');
        			window.location='http://localhost:8080/car_Park/person2_message.jsp?select=charge';
        		}
        	})
    	}
    	
        window.onload = function () {
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

                if (selectName == 'message') {
                    selectedDoms[1].className = 'clicked';
                    selectedSpans[1].className = 'span';
                } else if (selectName == 'cost') {
                    selectedDoms[1].className = '';
                    selectedSpans[1].className = '';
                    selectedDoms[3].className = 'clicked';
                    selectedSpans[3].className = 'span';
                } else if (selectName == 'charge') {
                    selectedDoms[1].className = '';
                    selectedSpans[1].className = '';
                    selectedDoms[5].className = 'clicked';
                    selectedSpans[5].className = 'span';
                } else if (selectName == 'password') {
                    selectedDoms[1].className = '';
                    selectedSpans[1].className = '';
                    selectedDoms[6].className = 'clicked';
                    selectedSpans[6].className = 'span';
                }
            }
            highLight();
			//获取状态颜色
			function getState(){
			  var state = document.getElementsByClassName('state');
			  for(var i=0;i<state.length;i++){
			  	if(state[i].innerHTML == '已缴费'){
			  		state[i].style.backgroundColor = 'rgb(82, 238, 43)'; 
			  		state[i].style.color = '#fff';
			  	}else if(state[i].innerHTML == '未缴费'){
			  		state[i].style.backgroundColor = 'rgb(238, 43, 43)'; 
			  		state[i].style.color = '#fff';
			  	}
			  }
			}
			getState();
            //·获取select值
            function request(key) {
                var url = location.search; //获取url中"?"符后的字串
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
        }
    </script>
</body>

</html>