<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>系统管理员的信息</title>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1106298_hahkukp2xft.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1121330_gsxjms7b30p.css">
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
            box-shadow: 0px 0px 5px #8b8383;
            border-bottom-left-radius: none;
            border-bottom-right-radius: none;
            height: 100%;
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
            margin: 5px;
            width: 95%;
            border-collapse: collapse;
        }

        .personMessage .table td {
            text-align: center;
            border-bottom: 1px solid #ccc;
            padding: 7px;
        }

        .input {
            height: 30px;
            line-height: 30px;
            outline: none;
            margin-top: 10px;
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

        #idData {
            margin: 0 auto;
        }

        #idData tr {
            border-bottom: 1px solid rgb(46, 132, 230);
        }

        #idData td {
            text-align: center;
            width: 130px;
            height: 40px;
        }

        #barcon {
            text-align: center;
            margin-top: 10px;
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
                <p style="text-indent:-40px">用户管理<span style="float:right;font-size:12px"><i
                            class="icon iconfont icon-unfold"></i></span></p>
                <p class="clicked">
                    <span class="span" style="float:left">&nbsp;&nbsp;</span>
                    <a href="person4_message.jsp?select=personOne" class="small"><i class="icon iconfont icon-linshi"
                            style="font-size:20px;"></i> 临时用户管理</a>
                </p>
                <p>
                    <span style="float:left">&nbsp;&nbsp;</span>
                    <a href="./userservlet?select=personTwo" class="small"><i
                            class="icon iconfont icon-huiyuan"></i> 会员管理</a>
                </p>
                <p>
                    <span style="float:left">&nbsp;&nbsp;</span>
                    <a href="./userservlet?select=personThree " class="small"><i
                            class="icon iconfont icon-Shapecopy"></i> 系统操作员管理</a>
                </p>

                <p style="text-indent:-40px">信息管理<span style="float:right;font-size:12px"><i
                            class="icon iconfont icon-unfold"></i></span></p>
                <p>
                    <span style="float:left">&nbsp;&nbsp;</span>
                    <a href="person4_message.jsp?select=message" class="small"><i
                            class="icon iconfont icon-yonghutianchong"></i> 个人信息</a>
                </p>

                <p style="text-indent:-40px">账户与安全<span style="float:right;font-size:12px"><i
                            class="icon iconfont icon-unfold"></i></span></p>
                <p>
                    <span style="float:left">&nbsp;&nbsp;</span>
                    <a href="person4_message.jsp?select=password" class="small"><i
                            class="icon iconfont icon-xiugaitianchong"></i> 密码更改</a>
                </p>

                <p style="text-indent:-40px">历史记录<span style="float:right;font-size:12px"><i
                            class="icon iconfont icon-unfold"></i></span></p>
                <p>
                    <span style="float:left">&nbsp;&nbsp;</span>
                    <a href="./userservlet?select=adminhistorySearch" class="small"><i
                            class="icon iconfont icon-countdown" style="font-size:20px;"></i> 历史查询</a>
                </p>
            </div>
        </div>
        <div class="right col-9">
            <div class="right-top">
                <c:forEach items="${administratorlist}" var="admin">
                   <p><span style="margin-right:100px;color:red;">剩余车位：${carport}</span> ${admin.adminnum}（系统管理员）您好，欢迎来到停车场管理系统！｜<a href="index.jsp">退出</a></p>
                </c:forEach>
            </div>
            <div class="right-bottom">
                <div class="personMessage">
                    <c:choose>
                    
                 

                        <%--personOne临时用户管理 --%>
                         <c:when test="${param.select eq 'personOne' }">
                            <span class='one-border'>临时用户管理</span>
                            <p><input type="text" class="input" id="carnuminput" name="carnum" required/>&nbsp;
                            <button class="btn" type="submit" onclick="person1()">搜索</button></p>
                            <table class="table">
                                <tbody>
                                    <tr class='one-border'>
                                        <td>车型</td>
                                        <td>车牌号码</td>
                                        <td>操作</td>
                                    </tr>
                                    <c:forEach items="${personOneList}" var="person">
                                    <tr>
                                    <td>${person.carsize}</td>
                                    <td>${person.carnum}</td>
                                    <td><a href="./userservlet?select=delpersonOne&carnum=${person.carnum}" 
                                    style="padding:4px;background-color:#F56C6C;color:white;text-decoration:none;border-radius:5px"onclick="return deleteDemo()">删除</a></td> 
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                    </table>                  
                            </c:when>
                            
                            <c:when test="${param.select eq 'person1'}">
                             <span class='one-border'>临时用户管理</span>
                            <p><input type="text" class="input" id="carnuminput" name="carnum" required/>&nbsp;
                            <button class="btn" type="submit" onclick="person1()">搜索</button></p>
                            </c:when>
                            
                              <%--临时用户搜索结果 --%>
                        <c:when test="${param.select eq 'personOneList'}">
                             <span class='one-border'>临时用户管理</span>
                            <p><input type="text" class="input" id="carnuminput" name="carnum" required/>&nbsp;
                            <button class="btn" type="submit" onclick="person1()">搜索</button></p>
                            <table class="table">
                                <tbody>
                                    <tr class='one-border'>
                                        <td>车型</td>
                                        <td>车牌号码</td>
                                        <td>操作</td>
                                    </tr>
                                     <c:forEach items="${personOnelist}" var="person1">
                                    <tr>
                                        <td>${person1.carsize}</td>
                                        <td>${person1.carnum}</td>
                                        <td><button class="btn" style="border-radius:4px;padding:5px;background-color:#F56C6C" onclick="delpersonOne()">删除</button>
                                        </td>
                                    </tr>
                                    </c:forEach>                            
                                </tbody>
                            </table>  
                        </c:when>
                
                
                        <%--personTwo会员管理 --%>
                        <c:when test="${param.select eq 'personTwo' }">
                            <span class='one-border'>会员管理</span>
                            <p><input type="text" class="input" id="carnuminput" name="carnum" required/>&nbsp;<button style="margin-left:4px;" class="btn" onclick="person2()">搜索</button></p>
                            <table class="table">
                                <tbody>
                                    <tr class='one-border'>
                                        <td>车型</td>
                                        <td>车牌号码</td>
                                        <td>联系方式</td>
                                        <td>余额</td>
                                        <td>操作</td>
                                    </tr>
                                    <c:forEach items="${personTwoList}" var="person">

                                    <tr>
                                        <td>${person.carsize}</td>
                                        <td>${person.carnum}</td>
                                        <td>${person.tel }</td>
                                        <td>${person.balance}</td>
                                        <td><a href="./userservlet?select=delpersonTwo&carnum=${person.carnum}" 
                                        style="border-radius:5px;padding:4px;background-color:#F56C6C;color:white;text-decoration:none" onclick="return deleteDemo()">删除</a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        
                        <%--会员信息单独搜索 --%>
                        <c:when test="${param.select eq 'person2' }">
                         <span class='one-border'>会员管理</span>
                         <p><input type="text" class="input" id="carnuminput" name="carnum" required/>&nbsp;
                         <button class="btn"  type="submit" onclick="person2()">搜索</button></p>  
                        </c:when>
                        
                        <%--搜索的结果 --%>
                        <c:when test="${param.select eq 'personTwoList' }">
                        <span class='one-border'>会员管理</span>
                            <p><input type="text" class="input" id="carnuminput" name="carnum"  required/>&nbsp;
                            <button class="btn" type="submit"  onclick="person2()">搜索</button></p>
                            <table class="table">
                                <tbody>
                                    <tr class='one-border'>
                                        <td>车型</td>
                                        <td>车牌号码</td>
                                        <td>联系方式</td>
                                        <td>余额</td>
                                        <td>操作</td>
                                    </tr>
                                    <c:forEach items="${personTwolist}" var="person2">
                                    <tr>
                                        <td>${person2.carsize}</td>
                                        <td>${person2.carnum}</td>
                                        <td>${person2.tel }</td>
                                        <td>${person2.balance}</td>
                                        <td><button class="btn" style="padding:4px;background-color:#F56C6C" onclick="delpersonTwo()">删除</button></td>
                                        </tr>
                                    </c:forEach>
                                 </tbody>
                             </table>
                                        <div id="barcon"></div>
                         </c:when>

                        <%--personThree系统操作员管理 --%>
                        <c:when test="${param.select eq 'personThree' }">
                            <span class='one-border'>系统操作员管理</span>
                            <table class="table">
                                <tbody>
                                    <tr class='one-border'>
                                        <td>工号</td>
                                        <td>操作</td>
                                    </tr>
                                    <c:forEach items="${personThreeList}" var="person3">
                                    <tr>
                                        <td>${person3.opernum}</td>
                                        <td><a href="./userservlet?select=delpersonThree&opernum=${person3.opernum}" 
                                        style="border-radius:5px;padding:3px;background-color:#F56C6C;color:white;text-decoration:none" onclick="return deleteDemo()">删除</a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:when>

                        <%--message个人信息 --%>
                        <c:when test="${param.select eq'message'}">
                            <span class='one-border'>个人信息</span>
                            <p style="margin: 10px 0 0 20px">系统管理员工号：
                                <c:forEach items="${administratorlist}" var="admin">${admin.adminnum}</c:forEach>
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

                        <%--adminhistorySearch历史查询 --%>
                        <c:when test="${param.select eq 'adminhistorySearch'}">
                            <span class='one-border'>历史查询</span>

                                <br />
                                <p><input type="text" class="input" id="carnuminput" name="carnum" />&nbsp;<button class="btn" type="submit" onclick="history()">搜索</button></p>
                                <table class="table">
                                    <tbody>
                                        <tr  class="one-border">
                                            <td>车牌号码</td>
                                            <td>入场时间</td>
                                            <td>入口</td>
                                            <td>出口</td>
                                            <td>停车时长</td>
                                            <td>扣除费用</td>
                                            <td>状态</td>
                                        </tr>
                                        <c:forEach items="${adminhistoryList}" var="history">
                                        <tr>
                                            <td>${history.carnum}</td>
                                            <td>${history.entertime }</td>
                                            <td>${history.entrance}</td>
                                            <td>${history.exit1}</td>
                                            <td>${history.staytime }</td>
                                            <td>${history.fee }</td>
                                            <td><span
                                                style="background-color:rgb(88, 243, 127);border-radius:5px;padding:5px;color:#fff">${history.status}</span></td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div id="barcon"></div>
                                <br />

                        </c:when>
                        <%--单独搜索 --%>
                        <c:when test="${param.select eq 'admin_check' }">
                        <span class='one-border'>历史查询</span>
                            <div class="one-box">
                                <br />
                                <p><input type="text" class="input" id="carnuminput" name="carnum" />&nbsp;<button class="btn" onclick="history()">搜索</button></p>
                            </div>
                        </c:when>
                                
                             <%--搜索结果如下 --%>   
                             <c:when test="${param.select eq 'List'}">
                            <span class='one-border'>历史查询</span>

                                <p><input type="text" class="input" id="carnuminput" name="carnum" />&nbsp;<button class="btn" onclick="history()">搜索</button></p>
                                
                                <table class="table">
                                    <tbody>
                                        <tr class="one-border">
                                            <td>车牌号码</td>
                                            <td>入场时间</td>
                                            <td>入口</td>
                                            <td>出口</td>
                                            <td>停车时长</td>
                                            <td>扣除费用</td>
                                            <td>状态</td>
                                        </tr>
                                        <c:forEach items="${adminhistorylist}" var="history">
                                        <tr>
                                            <td>${history.carnum}</td>
                                            <td>${history.entertime }</td>
                                            <td>${history.entrance}</td>
                                            <td>${history.exit1}</td>
                                            <td>${history.staytime }</td>
                                            <td>${history.fee }</td>
                                            <td><span
                                                style="background-color:rgb(88, 243, 127);border-radius:5px;padding:5px;color:#fff">${history.status}</span></td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div id="barcon"></div>
                                <br />

                            </c:when>
                        

                    </c:choose>
                </div>
            </div>
        </div>
    </div>
    <script type='text/javascript'>
    
    //修改密码
        function changePassword() {
        var password=${administratorlist[0].getAdminpwd()};
        var adminnum = "${administratorlist[0].getAdminnum()}";
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
        		data:{newPassword:newPassword,adminnum:adminnum,role:"admin"},
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
        
        function deleteDemo(){
      	  var msg=confirm("确定删除吗？");
    	  if(msg==true){
    		  return true;
    	  }
    	  else{
    		  return false;
    	  }
        }
      //·临时用户车牌搜索
        function person1() {
        	
            var carnuminput = document.getElementById('carnuminput').value;
            if (/^([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领][A-Z][A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳使领])$/.test(
                carnuminput)) {
                window.location.href = "./userservlet?select=person1&carnum=" + carnuminput;
            } else if (carnuminput == "" || carnuminput == null) {
                alert("搜索不能为空，请重新输入");
                window.location.href = "person4_message.jsp?select=personOne";
            } else {
                alert("车牌格式不正确，请重新输入");
                window.location.href = "person4_message.jsp?select=personOne";
            }
        }
      


      //.删除临时用户信息(搜索)
      <c:forEach items="${personOnelist}" var="person1">
      function delpersonOne(){
    	  var msg=confirm("确定删除吗？");
    	  if(msg==true){
    		  window.location.href="./userservlet?select=delpersonOne&carnum=${person1.carnum} ";
    	  }
    	  else{
    		  alert("已取消删除!");
    	  }
      }
      </c:forEach>
      
      //·会员车牌搜索
      function person2() {
      	
          var carnuminput = document.getElementById('carnuminput').value;
          if (/^([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领][A-Z][A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳使领])$/.test(
              carnuminput)) {
              window.location.href = "./userservlet?select=person2&carnum=" + carnuminput;
          } else if (carnuminput == "" || carnuminput == null) {
              alert("搜索不能为空，请重新输入");
              window.location.href = "person4_message.jsp?select=personTwo";
          } else {
              alert("车牌格式不正确，请重新输入");
              window.location.href = "person4_message.jsp?select=personTwo";
          }
      }
    
    //.删除会员信息(搜索)
      <c:forEach items="${personTwolist}" var="person2">
      function delpersonTwo(){
    	  var msg=confirm("确定删除吗？");
    	  if(msg==true){
    		  window.location.href="./userservlet?select=delpersonTwo&carnum=${person2.carnum} ";
    	  }
    	  else{
    		  alert("已取消删除!");
    	  }
      }
      </c:forEach>
      
      
      
      //·历史车牌搜索
      function history() {
      	
          var carnuminput = document.getElementById('carnuminput').value;
          if (/^([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领][A-Z][A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳使领])$/.test(
              carnuminput)) {
              window.location.href = "./userservlet?select=admin_check&carnum=" + carnuminput;
          } else if (carnuminput == "" || carnuminput == null) {
              alert("搜索不能为空，请重新输入");
              window.location.href = "person4_message.jsp?select=adminhistorySearch";
          } else {
              alert("车牌格式不正确，请重新输入");
              window.location.href = "person4_message.jsp?select=adminhistorySearch";
          }
      }
        //·分页
/*         if (request('select') == 'adminhistorySearch') {
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

        window.onload = function () {
            function highLight() {
                var selectName;
                if (window.location.search) {
                    selectName = window.location.search.split('?')[1].split('=')[1];
                }
                var selectedDoms = document.querySelectorAll('p'),
                    selectedSpans = document.querySelectorAll('span'),
                    domOne = selectedDoms[1].className;
                spanOne = selectedSpans[1].className;

                if (selectName == 'personoOne') {
                    selectedDoms[1].className = 'clicked';
                    selectedSpans[1].className = 'span';
                } else if (selectName == 'personTwo' || selectName == 'personTwoList') {
                    selectedDoms[1].className = '';
                    selectedSpans[1].className = '';
                    selectedDoms[2].className = 'clicked';
                    selectedSpans[2].className = 'span';
                } else if (selectName == 'personThree') {
                    selectedDoms[1].className = '';
                    selectedSpans[1].className = '';
                    selectedDoms[3].className = 'clicked';
                    selectedSpans[3].className = 'span';
                } else if (selectName == 'message') {
                    selectedDoms[1].className = '';
                    selectedSpans[1].className = '';
                    selectedDoms[5].className = 'clicked';
                    selectedSpans[5].className = 'span';
                } else if (selectName == 'password') {
                    selectedDoms[1].className = '';
                    selectedSpans[1].className = '';
                    selectedDoms[7].className = 'clicked';
                    selectedSpans[7].className = 'span';
                } else if (selectName == 'adminhistorySearch' || selectName == 'List') {
                    selectedDoms[1].className = '';
                    selectedSpans[1].className = '';
                    selectedDoms[9].className = 'clicked';
                    selectedSpans[9].className = 'span';
                }
            }
            highLight();
        }
    </script>
</body>

</html>

