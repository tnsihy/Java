package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Adminbean;
import bean.Getterbean;
import bean.Losterbean;
import bean.Pickerbean;
import bean.Userbean;
import db.DBUtil;

public class Messagedao {
	
	public int login(String num,String pwd)//查找检查数据库是否存在该登录账号与密码，信息正确则成功
	{
		Connection conn = DBUtil.getConn();
		int flag=0;
		try{
			String sql = "select * from user where num = ?";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, num);
			ResultSet rs=statement.executeQuery();
			if(rs.next())
			{   
				if(rs.getString("pwd").equals(pwd))
				{
					flag=1;
					}
				}
			}catch(Exception e){
				e.printStackTrace();
				}
		return flag;
		}

	public ArrayList<Userbean> login_Message (String num,String pwd)//获取登录人的信息
	{
		Connection conn = DBUtil.getConn();
		Userbean bs = new Userbean();
		ArrayList<Userbean> userlist = new ArrayList<Userbean>();
		try{
			String sql = "select * from user where num = ?";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, num);
			ResultSet rs=statement.executeQuery();
			if(rs.next())
			{   
				bs.setNum(rs.getString("num"));//邮箱
			    bs.setName(rs.getString("name"));//昵称
			    bs.setPwd(rs.getString("pwd"));
			    bs.setTel(rs.getString("tel"));
			    userlist.add(bs);
			    }
			}catch(Exception e){
					e.printStackTrace();
					}
		return userlist;
	}

	public ArrayList<Losterbean> loster_Output()//寻物清单输出
	{
		Connection conn = DBUtil.getConn();
		ArrayList<Losterbean> lostlist = new ArrayList<Losterbean>();
		try{
			String sql = "select lost_site,lost_time,lost_name,lost_color,lost_tel,name,lost_status from loster Order By lost_time Desc";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs=statement.executeQuery();
			while(rs.next())//使用while不会只输出一个数据
			{   
				Losterbean lb = new Losterbean();//放在括号内不会输出相同数据
				lb.setLost_site(rs.getString("lost_site"));
				lb.setLost_time(rs.getString("lost_time"));
				lb.setLost_name(rs.getString("lost_name"));
				lb.setLost_color(rs.getString("lost_color"));
				lb.setLost_tel(rs.getString("lost_tel"));
				lb.setName(rs.getString("name"));
				lb.setLost_status(rs.getString("lost_status"));
			    lostlist.add(lb);
			    }
			}catch(Exception e){
					e.printStackTrace();
					}
		return lostlist;
	}

	public ArrayList<Userbean> mess_Select(String num)//资料修改，重新存入数据库后select
	{
		Connection conn = DBUtil.getConn();
		Userbean bs = new Userbean();
		ArrayList<Userbean> userlist = new ArrayList<Userbean>();
		try{
			String sql = "select * from user where num = ?";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, num);
			ResultSet rs=statement.executeQuery();
			if(rs.next())
			{   
				bs.setNum(rs.getString("num"));//邮箱
			    bs.setName(rs.getString("name"));//昵称
			    bs.setPwd(rs.getString("pwd"));
			    bs.setTel(rs.getString("tel"));
			    userlist.add(bs);
			    }
			}catch(Exception e){
					e.printStackTrace();
					}
		return userlist;
	}
	
	public ArrayList<Pickerbean> picker_Output()//拾物清单输出
	{
		Connection conn = DBUtil.getConn();
		ArrayList<Pickerbean> picklist = new ArrayList<Pickerbean>();
		try{
			String sql = "select pick_site,pick_time,pick_name,pick_color,pick_tel,name,pick_status from picker Order By pick_time Desc";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs=statement.executeQuery();
			while(rs.next())//使用while不会只输出一个数据
			{   
				Pickerbean pb = new Pickerbean();//放在括号内不会输出相同数据
				pb.setPick_site(rs.getString("pick_site"));
				pb.setPick_time(rs.getString("pick_time"));
				pb.setPick_name(rs.getString("pick_name"));
				pb.setPick_color(rs.getString("pick_color"));
				pb.setPick_tel(rs.getString("pick_tel"));
				pb.setName(rs.getString("name"));
				pb.setPick_status(rs.getString("pick_status"));
				picklist.add(pb);
			    }
			}catch(Exception e){
					e.printStackTrace();
					}
		return picklist;
	}

	public ArrayList<Pickerbean>my_Found(String name)//属于登录者 作为拾主发布的内容
	{
		Connection conn = DBUtil.getConn();
		ArrayList<Pickerbean> my_picklist = new ArrayList<Pickerbean>();
		try{
			String sql = "select pick_site,pick_time,pick_name,pick_color,pick_tel,pick_status from picker where name = ?";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, name);
			ResultSet rs=statement.executeQuery();
			while(rs.next())//使用while不会只输出一个数据
			{   
				Pickerbean pb = new Pickerbean();//放在括号内不会输出相同数据
				pb.setPick_site(rs.getString("pick_site"));
				pb.setPick_time(rs.getString("pick_time"));
				pb.setPick_name(rs.getString("pick_name"));
				pb.setPick_color(rs.getString("pick_color"));
				pb.setPick_tel(rs.getString("pick_tel"));
				pb.setPick_status(rs.getString("pick_status"));
				my_picklist.add(pb);
			    }
			}catch(Exception e){
					e.printStackTrace();
					}
		return my_picklist;
	}

	public ArrayList<Losterbean>my_Search(String name)//属于登录者 作为发布的内容
	{
		Connection conn = DBUtil.getConn();
		ArrayList<Losterbean> my_lostlist = new ArrayList<Losterbean>();
		try{
			String sql = "select lost_site,lost_time,lost_name,lost_color,lost_tel,lost_status from loster where name = ?";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, name);
			ResultSet rs=statement.executeQuery();
			while(rs.next())//使用while不会只输出一个数据
			{   
				Losterbean lb = new Losterbean();//放在括号内不会输出相同数据
				lb.setLost_site(rs.getString("lost_site"));
				lb.setLost_time(rs.getString("lost_time"));
				lb.setLost_name(rs.getString("lost_name"));
				lb.setLost_color(rs.getString("lost_color"));
				lb.setLost_tel(rs.getString("lost_tel"));
				lb.setLost_status(rs.getString("lost_status"));
				my_lostlist.add(lb);
			    }
			}catch(Exception e){
					e.printStackTrace();
					}
		return my_lostlist;
	}

	public int admin_Login(String num,String pwd)//查找检查数据库是否存在该管理员的账号密码，信息正确则成功
	{
		Connection conn = DBUtil.getConn();
		int flag=0;
		try{
			String sql = "select pwd from admin where num = ?";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, num);
			ResultSet rs=statement.executeQuery();
			if(rs.next())
			{   
				if(rs.getString("pwd").equals(pwd))
				{
					flag=1;
					}
				}
			}catch(Exception e){
				e.printStackTrace();
				}
		return flag;
	}

	public ArrayList<Adminbean>admin_loginMessage(String num,String pwd)//获取管理员的信息，实质我只要密码
	{
		Connection conn = DBUtil.getConn();
		Adminbean ab = new Adminbean();
		ArrayList<Adminbean> adminlist = new ArrayList<Adminbean>();
		try{
			String sql = "select num,name,pwd from admin where num = ?";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, num);
			ResultSet rs=statement.executeQuery();
			if(rs.next())
			{   
				ab.setNum(rs.getString("num"));
				ab.setName(rs.getString("name"));
				ab.setPwd(rs.getString("pwd"));
				adminlist.add(ab);
			    }
			}catch(Exception e){
					e.printStackTrace();
					}
		return adminlist;
	}

	public ArrayList<Userbean>front_User()//获取前台用户的数据
	{
		Connection conn = DBUtil.getConn();
		ArrayList<Userbean> userlist = new ArrayList<Userbean>();
		try{
			String sql = "select num,name,tel from user";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs=statement.executeQuery();
			while(rs.next())
			{   
				Userbean bs = new Userbean();
				bs.setNum(rs.getString("num"));//邮箱
			    bs.setName(rs.getString("name"));//昵称
			    bs.setTel(rs.getString("tel"));
			    userlist.add(bs);
			    }
			}catch(Exception e){
					e.printStackTrace();
					}
		return userlist;
	}

	public ArrayList<Adminbean>after_User()//获取后台用户的数据
	{
		Connection conn = DBUtil.getConn();
		ArrayList<Adminbean> admin_list = new ArrayList<Adminbean>();
		try{
			String sql = "select num,name,pwd from admin";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs=statement.executeQuery();
			while(rs.next())
			{   
				Adminbean ab = new Adminbean();
				ab.setNum(rs.getString("num"));//邮箱
				ab.setName(rs.getString("name"));//昵称
				ab.setPwd(rs.getString("pwd"));
			    admin_list.add(ab);
			    }
			}catch(Exception e){
					e.printStackTrace();
					}
		return admin_list;
	}

	public ArrayList<Pickerbean>admin_Found()//获取 管理员发布的信息
	{
		Connection conn = DBUtil.getConn();
		ArrayList<Pickerbean> admin_picklist = new ArrayList<Pickerbean>();
		try{
			String sql = "select pick_site,pick_time,pick_name,pick_color,pick_tel,name,pick_status from picker where name like ?";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, "%管理员%");
			ResultSet rs=statement.executeQuery();
			while(rs.next())//使用while不会只输出一个数据
			{   
				Pickerbean pb = new Pickerbean();//放在括号内不会输出相同数据
				pb.setPick_site(rs.getString("pick_site"));
				pb.setPick_time(rs.getString("pick_time"));
				pb.setPick_name(rs.getString("pick_name"));
				pb.setPick_color(rs.getString("pick_color"));
				pb.setPick_tel(rs.getString("pick_tel"));
				pb.setName(rs.getString("name"));
				pb.setPick_status(rs.getString("pick_status"));
				admin_picklist.add(pb);
			    }
			}catch(Exception e){
					e.printStackTrace();
					}
		return admin_picklist;
	}

	public ArrayList<Getterbean>get_Output()//归还信息输出
	{
		Connection conn = DBUtil.getConn();
		ArrayList<Getterbean> getterlist = new ArrayList<Getterbean>();
		try{
			String sql = "select get_name,get_site,get_time,get_tel,get_status from getter";
			PreparedStatement statement=(PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs=statement.executeQuery();
			while(rs.next())//使用while不会只输出一个数据
			{   
				Getterbean gb = new Getterbean();//放在括号内不会输出相同数据
				gb.setGet_name(rs.getString("get_name"));
				gb.setGet_site(rs.getString("get_site"));
				gb.setGet_time(rs.getString("get_time"));
				gb.setGet_tel(rs.getString("get_tel"));
				gb.setGet_status(rs.getString("get_status"));
				getterlist.add(gb);
			    }
			}catch(Exception e){
					e.printStackTrace();
					}
		return getterlist;
	}

}
