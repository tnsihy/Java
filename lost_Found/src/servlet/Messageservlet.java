package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Adminbean;
import bean.Getterbean;
import bean.Losterbean;
import bean.Pickerbean;
import bean.Userbean;
import dao.Messagedao;
import db.DBUtil;

@WebServlet("/messageservlet")
public class Messageservlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");	
		String method=request.getParameter("method");
	
		if(method.equals("login")) {
			login(request,response);
		}if(method.equals("loster_Record")) {
			loster_Record(request,response);
		}if(method.equals("loster_Search")) {
			loster_Search(request,response);
		}if(method.equals("my_Message")) {
			my_Message(request,response);
		}if(method.equals("loster_Delete")) {
			loster_Delete(request,response);
		}if(method.equals("loster_Status")) {
			loster_Status(request,response);
		}if(method.equals("picker_Record")) {
			picker_Record(request,response);
		}if(method.equals("picker_Search")) {
			picker_Search(request,response);
		}if(method.equals("my_Found")) {
			my_Found(request,response);
		}if(method.equals("my_Search")) {
			my_Search(request,response);
		}if(method.equals("picker_Status")) {
			picker_Status(request,response);
		}if(method.equals("picker_Delete")) {
			picker_Delete(request,response);
		}if(method.equals("admin_Login")) {
			admin_Login(request,response);
		}if(method.equals("front_User")) {
			front_User(request,response);
		}if(method.equals("after_User")) {
			after_User(request,response);
		}if(method.equals("front_Delete")) {
			front_Delete(request,response);
		}if(method.equals("after_Delete")) {
			after_Delete(request,response);
		}if(method.equals("admin_Record")) {
			admin_Record(request,response);
		}if(method.equals("admin_lostMessage")) {
			admin_lostMessage(request,response);
		}if(method.equals("admin_lostDelete")) {
			admin_lostDelete(request,response);
		}if(method.equals("admin_foundMessage")) {
			admin_foundMessage(request,response);
		}if(method.equals("admin_foundDelete")) {
			admin_foundDelete(request,response);
		}if(method.equals("admin_Found")) {
			admin_Found(request,response);
		}if(method.equals("get_Record")) {
			get_Record(request,response);
		}if(method.equals("get_Search")) {
			get_Search(request,response);
		}if(method.equals("get_Delete")){
			get_Delete(request,response);
		}if(method.equals("register")) {
			register(request,response);
		}if(method.equals("admin_Pwd")) {
			admin_Pwd(request,response);
		}if(method.equals("my_Pwd")) {
			my_Pwd(request,response);
		}if(method.equals("admin_Add")) {
			admin_Add(request,response);
		}
	}

	protected void login(HttpServletRequest request, HttpServletResponse response)//用户登录
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String num=request.getParameter("num");
	    HttpSession session=request.getSession();
		String pwd=request.getParameter("pwd");
		PrintWriter out = response.getWriter(); 
		Messagedao md=new Messagedao();
		int flag=md.login(num,pwd);
		if(flag==1) {
		    ArrayList<Userbean> userlist = new ArrayList<Userbean>();
		    userlist=md.login_Message(num, pwd);
		    session.setAttribute("userlist", userlist);
	        response.sendRedirect(request.getContextPath()+"/home_Page.jsp?method=home_Page");
		}else {
			response.setContentType("text/html; charset=UTF-8");
            out.println("<script language=\"javascript\" type=\"text/javascript\" charset = \"UTF-8\">"); 
            out.println("alert('输入账号或密码有误');"); 
            out.println("window.history.back();");
            out.println("</script>");
            out.close();//关闭流资源 
		}
	}

	protected void loster_Record(HttpServletRequest request, HttpServletResponse response)//获取寻物登记的信息并插入数据库
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String lost_site=request.getParameter("lost_site");
		String lost_time=request.getParameter("lost_time");
		String lost_name=request.getParameter("lost_name");
		String lost_color=request.getParameter("lost_color");
		String lost_tel=request.getParameter("lost_tel");
		String lost_status=request.getParameter("lost_status");
		HttpSession session=request.getSession();
		ArrayList<Userbean> userlist = (ArrayList<Userbean>)session.getAttribute("userlist");
		Connection conn = DBUtil.getConn();
		try{
			String sql= "insert into loster (lost_site,lost_time,lost_name,lost_color,lost_tel,name,lost_status) values (?,?,?,?,?,?,?)";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, lost_site);
			statement.setString(2, lost_time);
			statement.setString(3, lost_name);
			statement.setString(4, lost_color);
			statement.setString(5, lost_tel);
			statement.setString(6, userlist.get(0).getName());
			statement.setString(7,lost_status);
			statement.executeUpdate();
			statement.close();
			conn.close();
			}catch(Exception e){
					e.printStackTrace();
					}
		response.sendRedirect(request.getContextPath()+"/home_Page.jsp");
	}

	protected void loster_Search(HttpServletRequest request, HttpServletResponse response)//寻物清单输出
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
        Messagedao md = new Messagedao();
		ArrayList<Losterbean> lostlist = new ArrayList<Losterbean>();
		lostlist=md.loster_Output();
	    session.setAttribute("lostlist", lostlist);
		response.sendRedirect(request.getContextPath()+"/home_Page.jsp?method=loster_Search");
	}

	protected void my_Message(HttpServletRequest request, HttpServletResponse response)//资料修改，重新存入数据库
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String name=request.getParameter("name");
		String tel=request.getParameter("tel");
		HttpSession session=request.getSession();
        ArrayList<Userbean> userlist = (ArrayList<Userbean>)session.getAttribute("userlist");
        Userbean bs1=(Userbean)userlist.get(0);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String db_url = "jdbc:mysql://localhost:3306/lost_found";
			String db_user = "root";
			String db_password = "123456";
			Connection conn = DriverManager.getConnection(db_url, db_user,
					db_password);
			String sql = "update user set name=?,tel=? where num= ?";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, name);
			statement.setString(2, tel);
			statement.setString(3, bs1.getNum());
			statement.executeUpdate();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		 Messagedao md = new Messagedao();
		 userlist=md.mess_Select(bs1.getNum());
		 session.setAttribute("userlist",userlist);
		response.sendRedirect(request.getContextPath()+"/my_Home.jsp?method=my_Message&name"+bs1.getName());
	}

	protected void loster_Delete(HttpServletRequest request, HttpServletResponse response)//我的挂失信息删除
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String lost_site=request.getParameter("lost_site");
		String lost_time=request.getParameter("lost_time");
		String lost_name=request.getParameter("lost_name");
		//String name=request.getParameter("name");
		Connection conn = DBUtil.getConn();
		try {
			String sql="delete from loster where lost_site =? and lost_time=? and lost_name=? ";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, lost_site);
			statement.setString(2, lost_time);
			statement.setString(3, lost_name);
			statement.executeUpdate();
			statement.close();
			conn.close();
			}catch(Exception e){
					e.printStackTrace();
					}
		response.sendRedirect(request.getContextPath()+"/messageservlet?method=loster_Search");
	}
	
	protected void loster_Status(HttpServletRequest request, HttpServletResponse response)//挂失状态更改
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String lost_tel=request.getParameter("lost_tel");
		String lost_status=request.getParameter("lost_status");
		HttpSession session=request.getSession();
        ArrayList<Userbean> userlist = (ArrayList<Userbean>)session.getAttribute("userlist");
        Userbean bs1=(Userbean)userlist.get(0);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String db_url = "jdbc:mysql://localhost:3306/lost_found";
			String db_user = "root";
			String db_password = "123456";
			Connection conn = DriverManager.getConnection(db_url, db_user,
					db_password);
			String lost_site=request.getParameter("lost_site");
			String sql = "update loster set lost_tel=?,lost_status=? where lost_site= ?";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, lost_tel);
			statement.setString(2, lost_status);
			statement.setString(3, lost_site);
			statement.executeUpdate();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		 Messagedao md = new Messagedao();
		 ArrayList<Losterbean>my_lostlist=new ArrayList<Losterbean>();
		 my_lostlist=md.loster_Output();
		 session.setAttribute("my_lostlist",my_lostlist);
		response.sendRedirect(request.getContextPath()+"/my_Home.jsp?method=my_Search&name="+bs1.getName());
	}

	protected void picker_Record(HttpServletRequest request, HttpServletResponse response)//获取拾物登记的信息并插入数据库
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String pick_site=request.getParameter("pick_site");
		String pick_time=request.getParameter("pick_time");
		String pick_name=request.getParameter("pick_name");
		String pick_color=request.getParameter("pick_color");
		String pick_tel=request.getParameter("pick_tel");
		String pick_status=request.getParameter("pick_status");
		HttpSession session=request.getSession();
		ArrayList<Userbean> userlist = (ArrayList<Userbean>)session.getAttribute("userlist");
		Connection conn = DBUtil.getConn();
		try{
			String sql= "insert into picker (pick_site,pick_time,pick_name,pick_color,pick_tel,name,pick_status) values (?,?,?,?,?,?,?)";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, pick_site);
			statement.setString(2, pick_time);
			statement.setString(3, pick_name);
			statement.setString(4, pick_color);
			statement.setString(5, pick_tel);
			statement.setString(6, userlist.get(0).getName());
			statement.setString(7,pick_status);
			statement.executeUpdate();
			statement.close();
			conn.close();
			}catch(Exception e){
					e.printStackTrace();
					}
		response.sendRedirect(request.getContextPath()+"/home_Page.jsp");
	}

	protected void picker_Search(HttpServletRequest request, HttpServletResponse response)//拾物清单输出
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
        Messagedao md = new Messagedao();
		ArrayList<Pickerbean> picklist = new ArrayList<Pickerbean>();
		picklist=md.picker_Output();
	    session.setAttribute("picklist", picklist);
		response.sendRedirect(request.getContextPath()+"/home_Page.jsp?method=picker_Search");
	}

	protected void my_Found(HttpServletRequest request, HttpServletResponse response)//属于拾主的发布内容
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		ArrayList<Userbean> userlist = (ArrayList<Userbean>)session.getAttribute("userlist");
		Messagedao md = new Messagedao();
		ArrayList<Pickerbean> my_picklist = new ArrayList<Pickerbean>();
		my_picklist=md.my_Found(userlist.get(0).name);
	    session.setAttribute("my_picklist", my_picklist);
		response.sendRedirect(request.getContextPath()+"/my_Home.jsp?method=my_Found");
	}

	protected void my_Search(HttpServletRequest request, HttpServletResponse response)//属于失主的发布内容
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		ArrayList<Userbean> userlist = (ArrayList<Userbean>)session.getAttribute("userlist");
		Messagedao md = new Messagedao();
		ArrayList<Losterbean> my_lostlist = new ArrayList<Losterbean>();
		my_lostlist=md.my_Search(userlist.get(0).name);
	    session.setAttribute("my_lostlist", my_lostlist);
		response.sendRedirect(request.getContextPath()+"/my_Home.jsp?method=my_Search");
	}

	protected void picker_Status(HttpServletRequest request, HttpServletResponse response)//拾物状态更改
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String pick_tel=request.getParameter("pick_tel");
		String pick_status=request.getParameter("pick_status");
		HttpSession session=request.getSession();
        ArrayList<Userbean> userlist = (ArrayList<Userbean>)session.getAttribute("userlist");
        Userbean bs1=(Userbean)userlist.get(0);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String db_url = "jdbc:mysql://localhost:3306/lost_found";
			String db_user = "root";
			String db_password = "123456";
			Connection conn = DriverManager.getConnection(db_url, db_user,
					db_password);
			String pick_site=request.getParameter("pick_site");
			String sql = "update picker set pick_tel=?,pick_status=? where pick_site= ?";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, pick_tel);
			statement.setString(2, pick_status);
			statement.setString(3, pick_site);
			statement.executeUpdate();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		 Messagedao md = new Messagedao();
		 ArrayList<Pickerbean>my_picklist=new ArrayList<Pickerbean>();
		 my_picklist=md.picker_Output();
		 session.setAttribute("my_picklist",my_picklist);
		response.sendRedirect(request.getContextPath()+"/my_Home.jsp?method=my_Found&name="+bs1.getName());
	}

	protected void picker_Delete(HttpServletRequest request, HttpServletResponse response)//我的拾物信息删除
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String pick_site=request.getParameter("pick_site");
		String pick_time=request.getParameter("pick_time");
		String pick_name=request.getParameter("pick_name");
		Connection conn = DBUtil.getConn();
		try {
			String sql="delete from picker where pick_site =? and pick_time=? and pick_name=? ";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, pick_site);
			statement.setString(2, pick_time);
			statement.setString(3, pick_name);
			statement.executeUpdate();
			statement.close();
			conn.close();
			}catch(Exception e){
					e.printStackTrace();
					}
		response.sendRedirect(request.getContextPath()+"/messageservlet?method=picker_Search");
	}

	protected void admin_Login(HttpServletRequest request, HttpServletResponse response)//管理员登录
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String num=request.getParameter("num");
	    HttpSession session=request.getSession();
		String pwd=request.getParameter("pwd");
		PrintWriter out = response.getWriter(); 
		Messagedao md=new Messagedao();
		int flag=md.admin_Login(num,pwd);
		if(flag==1) {
		    ArrayList<Adminbean> adminlist = new ArrayList<Adminbean>();
		    adminlist=md.admin_loginMessage(num, pwd);
		    session.setAttribute("adminlist", adminlist);
	        response.sendRedirect(request.getContextPath()+"/admin_homePage.jsp?method=admin_homePage");
		}else {
			response.setContentType("text/html; charset=UTF-8");
            out.println("<script language=\"javascript\" type=\"text/javascript\" charset = \"UTF-8\">"); 
            out.println("alert('输入账号或密码有误');"); 
            out.println("window.history.back();");
            out.println("</script>");
            out.close();//关闭流资源 
		}
	}

	protected void front_User(HttpServletRequest request, HttpServletResponse response)//管理员 获取前台用户
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
        Messagedao md = new Messagedao();
		ArrayList<Userbean> userlist = new ArrayList<Userbean>();
		userlist=md.front_User();
	    session.setAttribute("userlist", userlist);
		response.sendRedirect(request.getContextPath()+"/admin_homePage.jsp?method=front_User");
	}

	protected void after_User(HttpServletRequest request, HttpServletResponse response)//管理员 获取后台用户
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
        Messagedao md = new Messagedao();
		ArrayList<Adminbean> admin_list = new ArrayList<Adminbean>();
		admin_list=md.after_User();
	    session.setAttribute("admin_list", admin_list);
		response.sendRedirect(request.getContextPath()+"/admin_homePage.jsp?method=after_User");
		}

	protected void front_Delete(HttpServletRequest request, HttpServletResponse response)//管理员 删除前台用户
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String num=request.getParameter("num");
		Connection conn = DBUtil.getConn();
		try {
			String sql="delete from user where num =?";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, num);
			statement.executeUpdate();
			statement.close();
			conn.close();
			}catch(Exception e){
					e.printStackTrace();
					}
		response.sendRedirect(request.getContextPath()+"/messageservlet?method=front_User");
		}

	protected void after_Delete(HttpServletRequest request, HttpServletResponse response)//管理员 删除后台用户
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String num=request.getParameter("num");
		Connection conn = DBUtil.getConn();
		try {
			String sql="delete from admin where num =?";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, num);
			statement.executeUpdate();
			statement.close();
			conn.close();
			}catch(Exception e){
					e.printStackTrace();
					}
		response.sendRedirect(request.getContextPath()+"/messageservlet?method=after_User");
		}

	protected void admin_Record(HttpServletRequest request, HttpServletResponse response)//管理员 发布招领信息 插入数据库
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String pick_site=request.getParameter("pick_site");
		String pick_time=request.getParameter("pick_time");
		String pick_name=request.getParameter("pick_name");
		String pick_color=request.getParameter("pick_color");
		String pick_tel=request.getParameter("pick_tel");
		String pick_status=request.getParameter("pick_status");
		HttpSession session=request.getSession();
		ArrayList<Adminbean> adminlist = (ArrayList<Adminbean>)session.getAttribute("adminlist");
		Connection conn = DBUtil.getConn();
		try{
			String sql= "insert into picker (pick_site,pick_time,pick_name,pick_color,pick_tel,name,pick_status) values (?,?,?,?,?,?,?)";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, pick_site);
			statement.setString(2, pick_time);
			statement.setString(3, pick_name);
			statement.setString(4, pick_color);
			statement.setString(5, pick_tel);
			statement.setString(6, adminlist.get(0).getName());
			statement.setString(7,pick_status);
			statement.executeUpdate();
			statement.close();
			conn.close();
			}catch(Exception e){
					e.printStackTrace();
					}
		response.sendRedirect(request.getContextPath()+"/admin_homePage.jsp");
	}

	protected void admin_lostMessage(HttpServletRequest request, HttpServletResponse response)//管理员 输出前台挂失消息
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
        Messagedao md = new Messagedao();
		ArrayList<Losterbean> lostlist = new ArrayList<Losterbean>();
		lostlist=md.loster_Output();
	    session.setAttribute("lostlist", lostlist);
		response.sendRedirect(request.getContextPath()+"/admin_homePage.jsp?method=admin_lostMessage");
	}

	protected void admin_lostDelete(HttpServletRequest request, HttpServletResponse response)//管理员 删除前台挂失信息
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String lost_site=request.getParameter("lost_site");
		String lost_time=request.getParameter("lost_time");
		Connection conn = DBUtil.getConn();
		try {
			String sql="delete from loster where lost_site =? and lost_time=? ";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, lost_site);
			statement.setString(2, lost_time);
			statement.executeUpdate();
			statement.close();
			conn.close();
			}catch(Exception e){
					e.printStackTrace();
					}
		response.sendRedirect(request.getContextPath()+"/messageservlet?method=admin_lostMessage");
	}

	protected void admin_foundMessage(HttpServletRequest request, HttpServletResponse response)//管理员 输出前台拾物信息
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
        Messagedao md = new Messagedao();
		ArrayList<Pickerbean> picklist = new ArrayList<Pickerbean>();
		picklist=md.picker_Output();
	    session.setAttribute("picklist", picklist);
		response.sendRedirect(request.getContextPath()+"/admin_homePage.jsp?method=admin_foundMessage");
	}

	protected void admin_foundDelete(HttpServletRequest request, HttpServletResponse response)//管理员 删除前台拾物信息
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String pick_site=request.getParameter("pick_site");
		String pick_time=request.getParameter("pick_time");
		Connection conn = DBUtil.getConn();
		try {
			String sql="delete from picker where pick_site =? and pick_time=? ";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, pick_site);
			statement.setString(2, pick_time);
			statement.executeUpdate();
			statement.close();
			conn.close();
			}catch(Exception e){
					e.printStackTrace();
					}
		response.sendRedirect(request.getContextPath()+"/messageservlet?method=admin_foundMessage");
	}

	protected void admin_Found(HttpServletRequest request, HttpServletResponse response)//把管理员发布的信息输出
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		Messagedao md = new Messagedao();
		ArrayList<Pickerbean> admin_picklist = new ArrayList<Pickerbean>();
		admin_picklist=md.admin_Found();
	    session.setAttribute("admin_picklist", admin_picklist);
		response.sendRedirect(request.getContextPath()+"/admin_homePage.jsp?method=admin_Found");
	}

	protected void get_Record(HttpServletRequest request, HttpServletResponse response)//已领取 归还信息存入getter数据库并删除
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String get_name=request.getParameter("get_name");//物品名称
		String get_site=request.getParameter("get_site");//自取地点
		String get_time=request.getParameter("get_time");//自取时间
		String get_tel=request.getParameter("get_tel");//联系方式
		String get_status=request.getParameter("get_status");//归还状态
		Connection conn = DBUtil.getConn();
		try{
			String sql= "insert into getter (get_name,get_site,get_time,get_tel,get_status) values (?,?,?,?,?)";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, get_name);
			statement.setString(2, get_site);
			statement.setString(3, get_time);
			statement.setString(4, get_tel);
			statement.setString(5, get_status);
			statement.executeUpdate();
			statement.close();
			
			String sql1="delete from picker where pick_name =?";
			PreparedStatement statement1=(PreparedStatement) conn.prepareStatement(sql1);
			statement1.setString(1, get_name);
			statement1.executeUpdate();
			statement1.close();
			conn.close();
			}catch(Exception e){
					e.printStackTrace();
					}
		response.sendRedirect(request.getContextPath()+"/admin_homePage.jsp");
		}

	protected void get_Search(HttpServletRequest request, HttpServletResponse response)//已归还的信息 输出
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
        Messagedao md = new Messagedao();
		ArrayList<Getterbean> getterlist = new ArrayList<Getterbean>();
		getterlist=md.get_Output();
	    session.setAttribute("getterlist", getterlist);
		response.sendRedirect(request.getContextPath()+"/admin_homePage.jsp?method=get_Search");
	}

	protected void get_Delete(HttpServletRequest request, HttpServletResponse response)//归还信息删除
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String get_name=request.getParameter("get_name");
		String get_time=request.getParameter("get_time");
		Connection conn = DBUtil.getConn();
		try {
			String sql="delete from getter where get_name =? and get_time=? ";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, get_name);
			statement.setString(2, get_time);
			statement.executeUpdate();
			statement.close();
			conn.close();
			}catch(Exception e){
					e.printStackTrace();
					}
		response.sendRedirect(request.getContextPath()+"/messageservlet?method=get_Search");
		}

	protected void register(HttpServletRequest request, HttpServletResponse response)//注册
		throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String num=request.getParameter("num");
	String name=request.getParameter("name");
	String pwd=request.getParameter("pwd");
	String tel=request.getParameter("tel");
	HttpSession session=request.getSession();
	ArrayList<Userbean> userlist = (ArrayList<Userbean>)session.getAttribute("userlist");
	Connection conn = DBUtil.getConn();
	try{
		String sql= "insert into user (num,name,pwd,tel) values (?,?,?,?)";
		PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
		statement.setString(1, num);
		statement.setString(2, name);
		statement.setString(3, pwd);
		statement.setString(4, tel);
		statement.executeUpdate();
		statement.close();
		conn.close();
		}catch(Exception e){
				e.printStackTrace();
				}
	response.sendRedirect(request.getContextPath()+"/login.jsp");
	}

	protected void admin_Pwd(HttpServletRequest request, HttpServletResponse response)//管理员 修改密码
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");		
		String old_pwd=request.getParameter("old_pwd");
		Connection conn = DBUtil.getConn();
		HttpSession session=request.getSession();
		ArrayList<Adminbean> adminlist =(ArrayList<Adminbean>)session.getAttribute("adminlist");
		try{
			String sql = "select pwd from admin where name = ?";
		    PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
		    statement.setString(1, adminlist.get(0).getName());
		    ResultSet rs=statement.executeQuery();
		    PrintWriter out = response.getWriter(); 
		    if(rs.next())
		    {
		    	if(rs.getString("pwd").equals(old_pwd))
			   {
		    		String new_pwd=request.getParameter("new_pwd");
				    String re_pwd=request.getParameter("re_pwd");
				    if(new_pwd.equals(re_pwd)) {
				    	String sql1="update admin set pwd=? where name =?";
				    	PreparedStatement statement1=(PreparedStatement) conn.prepareStatement(sql1);
				    	statement1.setString(1, new_pwd);
				    	statement1.setString(2, adminlist.get(0).getName());
				    	statement1.executeUpdate();
						response.setContentType("text/html; charset=UTF-8");
			            out.println("<script language=\"javascript\" type=\"text/javascript\" charset = \"UTF-8\">"); 
			            out.println("alert('修改密码成功');"); 
			            out.println("window.location.href='admin_homePage.jsp?method=admin_Pwd'");
			            out.println("</script>");
			            out.close();//关闭流资源 
				    	//response.sendRedirect(request.getContextPath()+"/admin_homePage.jsp?method=admin_Pwd");

				    }
				    else {
						response.setContentType("text/html; charset=UTF-8");
			            out.println("<script language=\"javascript\" type=\"text/javascript\" charset = \"UTF-8\">"); 
			            out.println("alert('输入新密码不一致');"); 
			            out.println("window.history.back();");
			            out.println("</script>");
			            out.close();//关闭流资源 
				    }
			   }
				    else {
						response.setContentType("text/html; charset=UTF-8");
			            out.println("<script language=\"javascript\" type=\"text/javascript\" charset = \"UTF-8\">"); 
			            out.println("alert('密码错误');"); 
			            out.println("window.history.back();");
			            out.println("</script>");
			            out.close();//关闭流资源 
				    }
		    }
		}catch(Exception e){
			e.printStackTrace();
			}
	}
	
	protected void my_Pwd(HttpServletRequest request, HttpServletResponse response)//用户 修改密码
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");	
		String old_pwd=request.getParameter("old_pwd");
		Connection conn = DBUtil.getConn();
		HttpSession session=request.getSession();
		ArrayList<Userbean> userlist =(ArrayList<Userbean>)session.getAttribute("userlist");
		try{
			String sql = "select pwd from user where name = ?";
		    PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
		    statement.setString(1, userlist.get(0).getName());
		    ResultSet rs=statement.executeQuery();
		    PrintWriter out = response.getWriter(); 
		    if(rs.next())
		    {
		    	if(rs.getString("pwd").equals(old_pwd))
			   {
		    		String new_pwd=request.getParameter("new_pwd");
				    String re_pwd=request.getParameter("re_pwd");
				    if(new_pwd.equals(re_pwd)) {
				    	String sql1="update user set pwd=? where name =?";
				    	PreparedStatement statement1=(PreparedStatement) conn.prepareStatement(sql1);
				    	statement1.setString(1, new_pwd);
				    	statement1.setString(2, userlist.get(0).getName());
				    	statement1.executeUpdate();
						response.setContentType("text/html; charset=UTF-8");
			            out.println("<script language=\"javascript\" type=\"text/javascript\" charset = \"UTF-8\">"); 
			            out.println("alert('修改密码成功');"); 
			            out.println("window.location.href='my_Home.jsp?method=my_Pwd'");
			            out.println("</script>");
			            out.close();//关闭流资源 
				    	//response.sendRedirect(request.getContextPath()+"/my_Home.jsp?method=my_Pwd");

				    }
				    else {
						response.setContentType("text/html; charset=UTF-8");
			            out.println("<script language=\"javascript\" type=\"text/javascript\" charset = \"UTF-8\">"); 
			            out.println("alert('输入新密码不一致');"); 
			            out.println("window.history.back();");
			            out.println("</script>");
			            out.close();//关闭流资源 
				    }
			   }
				    else {
						response.setContentType("text/html; charset=UTF-8");
			            out.println("<script language=\"javascript\" type=\"text/javascript\" charset = \"UTF-8\">"); 
			            out.println("alert('密码错误');"); 
			            out.println("window.history.back();");
			            out.println("</script>");
			            out.close();//关闭流资源 
				    }
		    }
		}catch(Exception e){
			e.printStackTrace();
			}
	}

	protected void admin_Add(HttpServletRequest request, HttpServletResponse response)//管理员 添加
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");	
		String num=request.getParameter("num");
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		System.out.println(num);
		Connection conn = DBUtil.getConn();
		try{
			String sql= "insert into admin (num,name,pwd) values (?,?,?)";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, num);
			statement.setString(2, name);
			statement.setString(3, pwd);
			statement.executeUpdate();
			statement.close();
			conn.close();
			}catch(Exception e){
					e.printStackTrace();
					}
		response.sendRedirect(request.getContextPath()+"/messageservlet?method=after_User");
	}
	
}
