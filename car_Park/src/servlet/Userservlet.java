package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.OCR;
import bean.administrator_bean;
import bean.member_bean;
import bean.operator_bean;
import bean.record_bean;
import dao.Selectdao;

/**
 * Servlet implementation class Userservlet
 */
@WebServlet("/userservlet")
public class Userservlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)// select
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");// —设置字符集
		response.setCharacterEncoding("UTF-8");
		String select = request.getParameter("select");// 获取jsp界面的参数来判断执行什么方法

		HttpSession session = request.getSession();
		Selectdao port = new Selectdao();
		session.setAttribute("carport", port.Portnum());// 当前车位剩余数量;

		if (select.equals("memregister"))// 会员注册
		{
			memberRegister(request, response);
		} else if (select.equals("memlogin"))// 会员登录
		{
			memberLogin(request, response);
		} else if (select.equals("operlogin"))// 操作员登录
		{
			operLogin(request, response);
		} else if (select.equals("adminlogin"))// · 管理员登录
		{
			adminLogin(request, response);
		} else if (select.equals("enterrecord"))// 入场登记
		{
			enterRecord(request, response);
		} else if (select.equals("carnumsearch"))// 车牌搜索
		{
			carnumSearch(request, response);
		} else if (select.equals("OCR"))// OCR
		{
			OCR(request, response);
		} else if (select.equals("moneyinput")) // 现金缴费与余额缴费
		{
			moneyInput(request, response);
		} else if (select.equals("historysearch") || select.equals("guesthistory") || select.equals("memhistory"))// 历史查询
		{
			historySearch(request, response);
		} else if (select.equals("changepassword")) // 修改密码
		{
			changePassword(request, response);
		} else if (select.equals("guestlogin")) // 临时用户登录
		{
			guestLogin(request, response);
		} else if (select.equals("person1")) // 管理员查询临时用户信息
		{
			personOne(request, response);
		} else if (select.equals("delpersonOne")) // 临时用户信息删除
		{
			DelpersonOne(request, response);
		} else if (select.equals("personTwo")) // 管理员查询会员信息
		{
			personTwoSearch(request, response);
		} else if (select.equals("delpersonTwo")) // 管理员删除会员信息
		{
			DelpersonTwo(request, response);
		} else if (select.equals("person2")) // 单独搜索会员信息
		{
			personTwo(request, response);
		} else if (select.equals("personThree")) // 管理员查询操作员信息
		{
			personThreeSearch(request, response);
		} else if (select.equals("delpersonThree")) // 管理员删除操作员信息
		{
			DelpersonThree(request, response);
		} else if (select.equals("adminhistorySearch")) // 管理员历史查询
		{
			adminHistorySearch(request, response);
		} else if (select.equals("admin_check")) // 搜索历史查询
		{
			adminHistory(request, response);
		} else if (select.equals("recharge")) // 优惠充值
		{
			memberRecharge(request, response);
		} else if (select.equals("moneyinput")) // 任意充值
		{
			moneyInput(request, response);
		}
	}

	// ·会员充值
	protected void memberRecharge(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String reCharge = request.getParameter("reCharge"); // 30
		String firstBalance = request.getParameter("firstBalance"); // 1000
		String carnum = request.getParameter("carnum"); // 车牌号码
		int balance = Integer.parseInt(firstBalance) + Integer.parseInt(reCharge);

		Selectdao person2 = new Selectdao();
		person2.memberRecharge(carnum, balance);
		Selectdao person3 = new Selectdao();
		HttpSession session = request.getSession();
		ArrayList<member_bean> memberlist = new ArrayList<member_bean>();
		memberlist = person3.memberAgain(carnum);
		session.setAttribute("memberlist", memberlist);
	}

	// ·识别车牌
	protected void OCR(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		// ·火狐浏览器文件路径
		String fil = "E:\\桌面\\image\\" + request.getParameter("image");
		// String fil = request.getParameter("image");

		String action = request.getParameter("action");
		Selectdao cd = new Selectdao();
		session.setAttribute("car_Message", cd.OCR(fil));
		if (action.equals("enter")) {
			request.getRequestDispatcher("person3_message.jsp?select=OCR").forward(request, response);
		} else if (action.equals("exit")) {
			ArrayList<OCR> car_Message = (ArrayList<OCR>) session.getAttribute("car_Message");
			OCR carmessage = car_Message.get(0);
			String carnum = carmessage.getNumber();// ·获取识别的车牌号
			String status = "未缴费";
			Selectdao record = new Selectdao();
			ArrayList<record_bean> recordlist = new ArrayList<record_bean>();
			recordlist = record.carnumSearch(carnum, status);
			session.setAttribute("recordlist", recordlist);

			Selectdao member3 = new Selectdao();
			HttpSession session1 = request.getSession();
			session1.removeAttribute("memberlist1");
			ArrayList<member_bean> memberlist1 = new ArrayList<member_bean>();
			memberlist1 = member3.obtainBalance(carnum);
			session1.setAttribute("memberlist1", memberlist1);
			response.sendRedirect(request.getContextPath() + "/person3_message.jsp?select=outAccount");
		}
	}

	// ·会员注册 member1
	protected void memberRegister(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		String carsize = request.getParameter("carsize");
		String carnum = request.getParameter("carnum");
		String tel = request.getParameter("tel");
		String mempwd = request.getParameter("mempwd");

		Selectdao member1 = new Selectdao();
		int flag = member1.findMember(carnum);

		// flag=0时会员不存在，可进行注册
		if (flag == 0) {
			member1.addMember(carsize, carnum, tel, mempwd);
			response.setContentType("text/html; charset=UTF-8");
			out.flush();
			out.println("<script language=\"javascript\" type=\"text/javascript\" charset = \"UTF-8\">");
			out.println("alert('注册成功，请重新登录!');");
			out.println("window.location.href='/car_Park/person2.jsp'");
			out.println("</script>");
		} else {
			response.sendRedirect(request.getContextPath() + "/person2.jsp");
		}
	}

	// 临时用户登录
	protected void guestLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String carnum = request.getParameter("carnum");
		String status = "未缴费";

		Selectdao guest = new Selectdao();
		// 查询临时用户是否有历史停车记录
		session.setAttribute("guesthistory", guest.historySearch(carnum));
		if (session.getAttribute("guesthistory") != "") {
			// 查询临时用户目前有没有停车行为
			session.setAttribute("guestmessage", guest.carnumSearch(carnum, status));
			response.sendRedirect(request.getContextPath() + "/person1_message.jsp?select=message");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			out.flush();
			out.println("<script language='javascript' type='text/javascript' charset ='UTF-8'>");
			out.println("alert('该车当前没有任何停车记录');");
			out.println("window.history.back();");
			out.println("</script>");
			out.close();// 关闭流资源
		}
	}

	// ·会员登录 member2 memberlist
	protected void memberLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String tel = request.getParameter("tel");
		String mempwd = request.getParameter("mempwd");

		Selectdao member2 = new Selectdao();
		int flag = member2.memberLogin(tel, mempwd);
		if (flag == 1) {
			ArrayList<member_bean> memberlist = new ArrayList<member_bean>();
			memberlist = member2.memberLogin_msg(tel, mempwd);
			HttpSession session = request.getSession();
			session.setAttribute("memberlist", memberlist);
			response.sendRedirect(request.getContextPath() + "/person2_message.jsp?select=message");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			out.flush();
			out.println("<script language='javascript' type='text/javascript' charset ='UTF-8'>");
			out.println("alert('输入联系方式或密码有误');");
			out.println("window.history.back();");
			out.println("</script>");
			out.close();// 关闭流资源
		}
	}

	// ·操作员登录 oper1 operatorlist
	protected void operLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String opernum = request.getParameter("opernum");
		String operpwd = request.getParameter("operpwd");

		Selectdao oper1 = new Selectdao();
		int flag = oper1.operLogin(opernum, operpwd);
		if (flag == 1) {
			ArrayList<operator_bean> operatorlist = new ArrayList<operator_bean>();
			operatorlist = oper1.operLogin_msg(opernum, operpwd);
			HttpSession session = request.getSession();
			session.setAttribute("operatorlist", operatorlist);
			response.sendRedirect(request.getContextPath() + "/person3_message.jsp?select=enterRecord");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			out.flush();
			out.println("<script language='javascript' type='text/javascript' charset ='UTF-8'>");
			out.println("alert('登录员工号或密码有误!');");
			out.println("window.history.back();");
			out.println("</script>");
			out.close();// 关闭流资源
		}
	}

	// ·管理员登录 admin1 administratorlist
	protected void adminLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String adminnum = request.getParameter("adminnum");
		String adminpwd = request.getParameter("adminpwd");
		Selectdao admin1 = new Selectdao();
		int flag = admin1.adminLogin(adminnum, adminpwd);
		if (flag == 1) {
			ArrayList<administrator_bean> administratorlist = new ArrayList<administrator_bean>();
			administratorlist = admin1.adminLogin_msg(adminnum, adminpwd);
			HttpSession session = request.getSession();
			session.setAttribute("administratorlist", administratorlist);
			Selectdao person2 = new Selectdao();
			ArrayList<record_bean> personOneList = new ArrayList<record_bean>();
			personOneList = person2.personOne_Search();
			session.setAttribute("personOneList", personOneList);
			response.sendRedirect(request.getContextPath() + "/person4_message.jsp?select=personOne");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			out.flush();
			out.println("<script language='javascript' type='text/javascript' charset ='UTF-8'>");
			out.println("alert('登录员工号或密码有误!');");
			out.println("window.history.back();");
			out.println("</script>");
			out.close();// 关闭流资源
		}
	}

	// ·入场登记 oper2
	protected void enterRecord(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String carsize = request.getParameter("carsize");
		String carnum = request.getParameter("carnum");
		String entrance = request.getParameter("entrance");
		String entertime = request.getParameter("entertime");
		String operator = request.getParameter("operator");

		Selectdao oper2 = new Selectdao();
		oper2.addEnterRecord(carsize, carnum, entrance, entertime, operator);
		int count = (int) session.getAttribute("carport") - 1;// 车位-1;
		session.setAttribute("carport", count);// 更新剩余车位数量;
		// int port1=(int) session.getAttribute("carport");
		// port1=port1-1;
		// session.setAttribute("carport", port1);
		response.setContentType("text/html; charset=UTF-8");
		out.flush();
		out.println("<script language='javascript' type='text/javascript' charset ='UTF-8'>");
		out.println("alert('成功登记')");
		out.println("window.location='person3_message.jsp?select=enterRecord'");
		out.println("</script>");

	}

	// ·车牌搜索 record recordlist menber3 memberlist1
	protected void carnumSearch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		String carnum = request.getParameter("carnum");// ·获取到搜索的车牌号
		String status = "未缴费";
		Selectdao record = new Selectdao();
		ArrayList<record_bean> recordlist = new ArrayList<record_bean>();
		recordlist = record.carnumSearch(carnum, status);
		if (recordlist != null) {
			HttpSession session = request.getSession();
			session.setAttribute("recordlist", recordlist);
			// 搜索到车牌号后再判断是否会员有余额
			Selectdao member3 = new Selectdao();
			HttpSession session1 = request.getSession();
			/*
			 * session1.removeAttribute("memberlist1"); // 清除session
			 * System.out.println(session1);
			 */

			ArrayList<member_bean> memberlist1 = new ArrayList<member_bean>();
			memberlist1 = member3.obtainBalance(carnum);
			session1.setAttribute("memberlist1", memberlist1);
			response.sendRedirect(request.getContextPath() + "/person3_message.jsp?select=outAccount");
		} else {
			// System.out.println(recordlist);输出为null
			response.setContentType("text/html; charset=UTF-8");
			out.flush();
			out.println("<script language='javascript' type='text/javascript' charset ='UTF-8'>");
			out.println("alert('未搜索到该车辆!');");
			out.println("window.history.back();");
			out.println("</script>");
			out.close();// 关闭流资源
		}
	}

	// ·现金缴费与余额缴费 record1 recordlist1
	protected void moneyInput(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String carnum = request.getParameter("carnum");
		String exit1 = request.getParameter("exit1");
		String exittime = request.getParameter("exittime");
		String staytime = request.getParameter("staytime");
		int fee = Integer.parseInt((request.getParameter("fee")));// 结算
		String exitopernum = request.getParameter("exitopernum");
		String method = request.getParameter("method");// 判断是现金还是余额
		if (method.equals("card")) { // 如果是余额
			int balance = Integer.parseInt((request.getParameter("balance")));// 余额
			if (fee <= balance) { // 如果足够扣余额
				balance -= fee;// 减后的余额
				Selectdao record1 = new Selectdao();
				record1.insertRecord(carnum, exit1, exittime, staytime, fee, exitopernum);
				Selectdao member4 = new Selectdao();
				member4.insertMember(carnum, balance);
				int count = (int) session.getAttribute("carport") + 1;// ·车位-1;
				session.setAttribute("carport", count);// 更新剩余车位数量;
				response.setContentType("text/html; charset=UTF-8");
				out.flush();
				out.println("<script language='javascript' type='text/javascript' charset ='UTF-8'>");
				out.println(
						"setTimeout(function(){alert('余额缴费成功！');window.location='http://localhost:8080/car_Park/person3_message.jsp?select=exitRecord'},0)");
				out.println("</script>");
				out.close();// 关闭流资源
			} else {
				response.setContentType("text/html; charset=UTF-8");
				out.flush();
				out.println("<script language='javascript' type='text/javascript' charset ='UTF-8'>");
				out.println("alert('余额已不足，请及时充值!');");
				out.println("window.history.back();");
				out.println("</script>");
				out.close();// 关闭流资源
			}
		} else if (method.equals("cash")) {// 如果是现金
			Selectdao record1 = new Selectdao();
			record1.insertRecord(carnum, exit1, exittime, staytime, fee, exitopernum);
			int count = (int) session.getAttribute("carport") + 1;// 车位-1;
			session.setAttribute("carport", count);// 更新剩余车位数量;
			response.sendRedirect(request.getContextPath() + "/person3_message.jsp?select=exitRecord");
		}
	}

	// ·历史搜索 record recordlist menber3 memberlist1
	protected void historySearch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String carnum = request.getParameter("carnum");// ·获取到搜索的车牌号
		String role = request.getParameter("role");// 判断用户角色
		String method = request.getParameter("method");
		Selectdao history = new Selectdao();
		if (method != null && method.equals("all")) {
			session.setAttribute("Allhistorylist", history.adminHistory_Search());
			response.sendRedirect(request.getContextPath() + "/person3_message.jsp?select=historySearch");
		} else {
			session.setAttribute("historylist", history.historySearch(carnum));
			if (session.getAttribute("historylist") != null) {
				if (role.equals("guest")) {
					session.setAttribute("guesthl", history.historySearch(carnum));
					response.sendRedirect(request.getContextPath() + "/person1_message.jsp?select=cost");
				} else if (role.equals("operator")) {
					response.sendRedirect(request.getContextPath() + "/person3_message.jsp?select=historyList");
				} else if (role.equals("member")) {
					session.setAttribute("memberhl", history.historySearch(carnum));
					response.sendRedirect(request.getContextPath() + "/person2_message.jsp?select=cost");
				}
			} else {
				// System.out.println(recordlist);输出为null
				response.setContentType("text/html; charset=UTF-8");
				out.flush();
				out.println("<script language='javascript' type='text/javascript' charset ='UTF-8'>");
				out.println("alert('该车辆没有停车记录');");
				out.println("window.history.back();");
				out.println("</script>");
				out.close();// 关闭流资源
			}
		}
	}

	// 修改密码
	protected void changePassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String role = request.getParameter("role");
		String newPassword = request.getParameter("newPassword");
		String opernum = request.getParameter("opernum");
		String memnum = request.getParameter("memnum");
		String adminnum = request.getParameter("adminnum");
		Selectdao change = new Selectdao();
		if (role.equals("operator")) {
			change.operchangePassword(opernum, newPassword);
		} else if (role.equals("member")) {
			change.memchangePassword(memnum, newPassword);
		} else if (role.equals("admin")) {
			change.adminchangePassword(adminnum, newPassword);
		}

	}

	// .临时用户查询 personOneList person2
	protected void personOneSearch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		// System.out.print("person2");
		Selectdao person2 = new Selectdao();
		ArrayList<record_bean> personOneList = new ArrayList<record_bean>();
		personOneList = person2.personOne_Search();
		session.setAttribute("personOneList", personOneList);

	}

	// .临时用户信息搜索 personOnelist person1
	protected void personOne(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String carnum = request.getParameter("carnum");// ·获取到搜索的车牌号
		Selectdao person1 = new Selectdao();
		session.setAttribute("personOnelist", person1.personOne(carnum));

		if (session.getAttribute("personOnelist") != null) {
			response.sendRedirect(request.getContextPath() + "/person4_message.jsp?select=personOneList");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			out.flush();
			out.println("<script language='javascript' type='text/javascript' charset ='UTF-8'>");
			out.println("alert('该车辆没有停车记录或者不是临时用户!');");
			out.println("window.history.back();");
			out.println("</script>");
			out.close();// 关闭流资源
		}

	}

	// 删除临时用户信息
	protected void DelpersonOne(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String carnum = request.getParameter("carnum");// ·获取到搜索的车牌号
		Selectdao person2 = new Selectdao();
		person2.DelpersonOne(carnum);
		session.setAttribute("personOneList", person2.personOne_Search());
		session.setAttribute("carport", person2.Portnum());

		response.setContentType("text/html; charset=UTF-8");
		out.flush();
		out.println("<script language='javascript' type='text/javascript' charset ='UTF-8'>");
		out.println(
				"setTimeout(function(){alert('删除成功！');window.location='person4_message.jsp?select=personOne'},100)");
		out.println("</script>");

	}

	// .管理员查询会员信息 personTwoList person3
	protected void personTwoSearch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		Selectdao person3 = new Selectdao();
		ArrayList<member_bean> personTwoList = new ArrayList<member_bean>();
		personTwoList = person3.personTwo_Search();
		session.setAttribute("personTwoList", personTwoList);
		response.sendRedirect(request.getContextPath() + "/person4_message.jsp?select=personTwo");
	}

	// .管理员删除会员信息
	protected void DelpersonTwo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String carnum = request.getParameter("carnum");
		Selectdao person = new Selectdao();
		person.DelpersonTwo(carnum);
		session.setAttribute("personTwoList", person.personTwo_Search());

		response.setContentType("text/html; charset=UTF-8");
		out.flush();
		out.println("<script language='javascript' type='text/javascript' charset ='UTF-8'>");
		out.println(
				"setTimeout(function(){alert('删除成功！');window.location='person4_message.jsp?select=personTwo'},100)");
		out.println("</script>");

	}

	// .会员信息搜索 personTwolist person
	protected void personTwo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String carnum = request.getParameter("carnum");// ·获取到搜索的车牌号
		Selectdao person = new Selectdao();
		session.setAttribute("personTwolist", person.personTwo(carnum));

		if (session.getAttribute("personTwolist") != null) {
			response.sendRedirect(request.getContextPath() + "/person4_message.jsp?select=personTwoList");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			out.flush();
			out.println("<script language='javascript' type='text/javascript' charset ='UTF-8'>");
			out.println("alert('该车辆不是会员用户!');");
			out.println("window.history.back();");
			out.println("</script>");
			out.close();// 关闭流资源
		}

	}

	// .管理员查询操作员信息 personThreeList
	protected void personThreeSearch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Selectdao person = new Selectdao();
		ArrayList<operator_bean> personThreeList = new ArrayList<operator_bean>();
		personThreeList = person.personThree_Search();
		session.setAttribute("personThreeList", personThreeList);
		response.sendRedirect(request.getContextPath() + "/person4_message.jsp?select=personThree");
	}

	// .管理员删除操作员信息
	protected void DelpersonThree(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String opernum = request.getParameter("opernum");
		;
		Selectdao person = new Selectdao();
		person.DelpersonThree(opernum);
		session.setAttribute("personThreeList", person.personThree_Search());

		response.setContentType("text/html; charset=UTF-8");
		out.flush();
		out.println("<script language='javascript' type='text/javascript' charset ='UTF-8'>");
		out.println(
				"setTimeout(function(){alert('删除成功！');window.location='person4_message.jsp?select=personThree'},100)");
		out.println("</script>");
	}

	// .管理员查询停车历史信息 adminhistoryList
	protected void adminHistorySearch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		Selectdao car = new Selectdao();
		ArrayList<record_bean> adminhistoryList = new ArrayList<record_bean>();
		adminhistoryList = car.adminHistory_Search();
		session.setAttribute("adminhistoryList", adminhistoryList);
		response.sendRedirect(request.getContextPath() + "/person4_message.jsp?select=adminhistorySearch");
	}

	// .管理员历史信息搜索 adminhistorylist
	protected void adminHistory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		session.removeAttribute("adminhistorylist");

		String carnum = request.getParameter("carnum");

		Selectdao car = new Selectdao();
		session.setAttribute("adminhistorylist", car.adminHistory2(carnum));

		if (session.getAttribute("adminhistorylist") != null) {
			response.sendRedirect(request.getContextPath() + "/person4_message.jsp?select=List");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			out.flush();
			out.println("<script language='javascript' type='text/javascript' charset ='UTF-8'>");
			out.println("alert('该车辆尚未停过车!');");
			out.println("window.history.back();");
			out.println("</script>");
			out.close();// 关闭流资源
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}