<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>临时用户的信息</title>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_1106298_hahkukp2xft.css">
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
			transition: transform 0.5s;
			box-shadow: 0px 0px 2px #8b8383;
		}

		.one-box:hover {
			box-shadow: 0px 0px 5px #8b8383;
			/*border-bottom-left-radius:none; 
            border-bottom-right-radius:none; */
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

		.personMessage table {
			margin: 20px;
			width: 95%;
			border-collapse: collapse;
		}

		.personMessage table td {
			text-align: center;
			border-bottom: 1px solid #ccc;
			padding: 7px;
			white-space: nowrap;
		}

		#img {
			width: 300px;
			height: 300px;
			position: absolute;
			left: 50%;
			top: 30%;
			transform: translate(-20%, -20%);
		}

		#h3 {
			position: absolute;
			left: 58%;
			top: 20%;
			transform: translate(-50%, -50%);
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
				<p style="text-indent: -40px">信息管理<span style="float: right; font-size: 12px"><i
							class="icon iconfont icon-unfold"></i></span></p>
				<p class="clicked">
					<span class="span" style="float: left">&nbsp;&nbsp;</span>
					<a href="person1_message.jsp?select=message" class="small"><i
							class="icon iconfont icon-yonghutianchong"></i> 个人信息</a>
				</p>
				<p style="text-indent: -40px">停车记录<span style="float: right; font-size: 12px"><i
							class="icon iconfont icon-unfold"></i></span></p>
				<p>
					<span style="float: left">&nbsp;&nbsp;</span>
					<a href="./userservlet?select=guesthistory&role=guest&carnum=${guesthistory[0].getCarnum()}"
						class="small"><i class="icon iconfont icon-qian"></i>
						扣费查询</a>
				</p>
			</div>
		</div>
		<div class="right col-9">
			<div class="right-top">
				<p>
					${guesthistory[0].getCarnum()}（临时用户）您好，欢迎来到停车场管理系统！｜<a href="index.jsp">退出</a>
				</p>
			</div>
			<div class="right-bottom">
				<div class="personMessage">

					<c:choose>
						<%--message个人信息 --%>
						<c:when test="${param.select eq'message'}">
							<c:if test="${guestmessage==null}">
								<img id="img" src="image\03.jpg" />
								<h3 id="h3">您当前没有停车！</h3>
							</c:if>
							<c:forEach items="${guestmessage}" var="guest">
								<span class='one-border'>个人信息</span>
								<p class="explain">扣费说明：停车2h以内（包括2h）统一收取5元。超过2h的部分，每1h按1元算，不超过1h按1元算。</p>
								<div class="one-box">
									<p>车型：${guest.carsize}</p>
									<p>车牌号码：${guest.carnum}</p>
									<p>入口：${guest.entrance}</p>
									<p>入场时间：<span id="enterTime">${guest.entertime}</span></p>
									<p>停车时长：<span id="showOne"></span></p>
									<p>即时费用：<span id="showTwo"></span></p>
								</div>
							</c:forEach>
						</c:when>

						<%--cost扣费纪录 --%>
						<c:when test="${param.select eq 'cost' }">
							<span class='one-border'>扣费记录</span>
							<table id="idData">
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
									<c:forEach items="${guesthl}" var="hl">
										<tr>
											<td>${hl.carnum}</td>
											<td>${hl.carsize}</td>
											<td>${hl.entertime}</td>
											<td>${hl.entrance}</td>
											<td>${hl.exittime}
											</td>
											<td>${hl.exit1}</td>
											<td>${hl.staytime}</td>
											<td>${hl.fee}</td>
											<td><span class="state"
													style="padding:5px;border-radius:5px">${hl.status}</span></td>
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
		window.onload = function () {
			//·左侧导航高亮
			function highLight() {
				var selectName;
				if (request('select') == 'message' || request('select') == 'cost') {
					selectName = window.location.search.split('?')[1].split('=')[1];
				}
				if (selectName == 'message') {
					var selectedDom = document.querySelectorAll('p')[1];
					var selectedSpan = document.querySelectorAll('span')[1];
					selectedDom.className = 'clicked';
					selectedSpan.className = 'span';
				} else if (selectName == 'cost') {
					document.querySelectorAll('p')[1].className = '';
					document.querySelectorAll('span')[1].className = '';
					var selectedDom = document.querySelectorAll('p')[3];
					var selectedSpan = document.querySelectorAll('span')[3];
					selectedDom.className = 'clicked';
					selectedSpan.className = 'span';
				}
			}
			highLight();
			//获取状态颜色
			function getState() {
				var state = document.getElementsByClassName('state');
				for (var i = 0; i < state.length; i++) {
					if (state[i].innerHTML == '已缴费') {
						state[i].style.backgroundColor = 'rgb(82, 238, 43)';
						state[i].style.color = '#fff';
					} else if (state[i].innerHTML == '未缴费') {
						state[i].style.backgroundColor = 'rgb(238, 43, 43)';
						state[i].style.color = '#fff';
					}
				}
			}
			getState();
			//·将毫秒转化为时分秒
			function formatTime(result) {
				var days = parseInt(result / (1000 * 60 * 60 * 24));
				var hours = parseInt((result % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
				var minutes = parseInt((result % (1000 * 60 * 60)) / (1000 * 60));
				var seconds = (result % (1000 * 60)) / 1000;
				var mix = days * 24 + hours; //将天数计为小时单位
				var showTwo = document.getElementById('showTwo');
				if (mix > 2) { //5元/2h以内包括2h；超过2h +1元/h，不足1h按1h算
					if (minutes != 0 || seconds != 0) {
						showTwo.innerHTML = (5 + (mix - 2) * 1 + 1);
					} else {
						showTwo.innerHTML = (5 + (mix - 2) * 1);
					}
				} else {
					showTwo.innerHTML = 5;
				}
				//console.log(days + '天' + hours + '时' + minutes + '分' + seconds + '秒');
				return showTwo.innerHTML;
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
			if (request('select') == 'message') {
				var enterTime = document.getElementById('enterTime');
				var showOne = document.getElementById('showOne');
				showOne.innerHTML = year + '-' + month + '-' + date + ' ' + myDate.toLocaleTimeString(
					'en', {
						hour12: false
					});
				var result = new Date(Date.parse((showOne.innerHTML).replace(/-/g, "/"))) - new Date(
					Date.parse((enterTime.innerHTML).replace(/-/g, "/")));
				showTwo.innerHTML = formatTime(result);
			}
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