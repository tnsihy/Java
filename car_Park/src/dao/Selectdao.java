package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.swing.JOptionPane;

import org.json.JSONObject;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.baidu.aip.ocr.AipOcr;

import bean.OCR;
import bean.administrator_bean;
import bean.member_bean;
import bean.operator_bean;
import bean.record_bean;
import db.DBUtil;

public class Selectdao {
	// ·再一次更新
	public ArrayList<member_bean> memberAgain(String carnum) {
		Connection conn = DBUtil.getConn();
		Statement statement = null;
		ResultSet rs = null;
		member_bean mem = new member_bean();
		ArrayList<member_bean> memberlist = new ArrayList<member_bean>();
		try {
			String sql = "select * from member where carnum='" + carnum + "'";
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			if (rs.next()) {
				mem.setCarsize(rs.getString("carsize"));
				mem.setCarnum(rs.getString("carnum"));
				mem.setTel(rs.getString("tel"));
				mem.setMempwd(rs.getString("mempwd"));
				mem.setBalance(rs.getString("balance"));
				memberlist.add(mem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return memberlist;
	}

	// ·更新会员的余额
	public ArrayList<member_bean> memberRecharge(String carnum, int balance) {
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		ResultSet rs = null;
		member_bean mem = new member_bean();
		ArrayList<member_bean> memberlist = new ArrayList<member_bean>();
		try {
			String sql = "update member set balance = ? where carnum= ?";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			statement.setInt(1, balance);
			statement.setString(2, carnum);
			statement.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return null;
	}

	// ·车牌识别
	public ArrayList<OCR> OCR(String fil) {
		ArrayList<OCR> car_Message = new ArrayList<OCR>();
		try {
			// ·设置APPID/AK/SK
			final String APP_ID = "15887770";
			final String API_KEY = "PGgE56MWcGlu9KDlg1bd4ktR";
			final String SECRET_KEY = "f5MISofX2rI3gSWkOVSDIMAaV71o3THg";

			AipOcr client = new AipOcr(APP_ID, API_KEY, SECRET_KEY);

			// ·传入可选参数调用接口
			HashMap<String, String> options = new HashMap<String, String>();
			// options.put("multi_detect", "true");

			// ·参数为本地路径
			String image = fil;
			// System.out.print(image);
			JSONObject res = client.plateLicense(image, options);

			String numbe = (String) JSONObject.valueToString(res.get("words_result"));
			Map<String, String> map = JSON.parseObject(numbe, Map.class);
			String number = map.get("number");
			String color = map.get("color");

			OCR ocr = new OCR();
			ocr.setNumber(number);
			ocr.setColor(color);
			car_Message.add(ocr);

		} catch (IndexOutOfBoundsException | JSONException e) {
			e.printStackTrace();
		}
		return car_Message;
	}

	// 获取当前剩余车位
	public int Portnum() {
		int count = 0;
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			String sql = "select * from record where status=?";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, "未缴费");
			rs = statement.executeQuery();

			while (rs.next()) {
				count = count + 1;
			}
			count = 200 - count;
			// System.out.print(count);
		} catch (Exception e) {
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return count;

	}

	// ·判断会员注册时数据库是否已有该会员信息，是否允许注册
	public int findMember(String carnum) {
		Connection conn = DBUtil.getConn();
		int flag = 0;
		Statement statement = null;
		ResultSet rs = null;
		try {
			String sql = "select * from member where carnum='" + carnum + "'";
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			if (rs.next()) {
				if (rs.getString("carnum").equals(carnum)) {
					flag = 1;
					JOptionPane.showMessageDialog(null, "用户已存在", "", JOptionPane.ERROR_MESSAGE);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return flag;
	}

	// ·会员注册时插入数据库
	public void addMember(String carsize, String carnum, String tel, String mempwd) {
		PreparedStatement statement = null;
		Connection conn = DBUtil.getConn();
		try {
			String sql = "insert into member(carsize,carnum,tel,mempwd)values(?,?,?,?)";
			statement = conn.prepareStatement(sql);
			statement.setString(1, carsize);
			statement.setString(2, carnum);
			statement.setString(3, tel);
			statement.setString(4, mempwd);
			statement.executeUpdate();
			statement.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ·会员登录
	public int memberLogin(String tel, String mempwd) {
		Connection conn = DBUtil.getConn();
		Statement statement = null;
		ResultSet rs = null;
		int flag = 0;
		try {
			String sql = "select * from member where tel='" + tel + "'";
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			if (rs.next()) {
				if (rs.getString("mempwd").equals(mempwd)) {
					flag = 1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return flag;
	}

	// ·保存会员信息
	public ArrayList<member_bean> memberLogin_msg(String tel, String mempwd) {
		Connection conn = DBUtil.getConn();
		Statement statement = null;
		ResultSet rs = null;
		member_bean mem = new member_bean();
		ArrayList<member_bean> memberlist = new ArrayList<member_bean>();
		try {
			String sql = "select * from member where tel='" + tel + "'";
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			if (rs.next()) {
				mem.setCarsize(rs.getString("carsize"));
				mem.setCarnum(rs.getString("carnum"));
				mem.setTel(rs.getString("tel"));
				mem.setMempwd(rs.getString("mempwd"));
				mem.setBalance(rs.getString("balance"));
				memberlist.add(mem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return memberlist;
	}

	// ·操作员登录
	public int operLogin(String opernum, String operpwd) {
		Connection conn = DBUtil.getConn();
		Statement statement = null;
		ResultSet rs = null;
		int flag = 0;
		try {
			String sql = "select * from operator where opernum='" + opernum + "'";
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			if (rs.next()) {
				if (rs.getString("operpwd").equals(operpwd)) {
					flag = 1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return flag;
	}

	// ·保存操作员信息
	public ArrayList<operator_bean> operLogin_msg(String opernum, String operpwd) {
		Connection conn = DBUtil.getConn();
		Statement statement = null;
		ResultSet rs = null;
		operator_bean oper = new operator_bean();
		ArrayList<operator_bean> operatorlist = new ArrayList<operator_bean>();
		try {
			String sql = "select * from operator where opernum='" + opernum + "'";
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			if (rs.next()) {
				oper.setOpernum(rs.getString("opernum"));
				oper.setOperpwd(rs.getString("operpwd"));
				operatorlist.add(oper);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return operatorlist;
	}

	// ·管理员登录
	public int adminLogin(String adminnum, String adminpwd) {
		Connection conn = DBUtil.getConn();
		Statement statement = null;
		ResultSet rs = null;
		int flag = 0;
		try {
			String sql = "select * from administrator where adminnum='" + adminnum + "'";
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			if (rs.next()) {
				if (rs.getString("adminpwd").equals(adminpwd)) {
					flag = 1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return flag;
	}

	// ·保存管理员信息
	public ArrayList<administrator_bean> adminLogin_msg(String adminnum, String adminpwd) {
		Connection conn = DBUtil.getConn();
		Statement statement = null;
		ResultSet rs = null;
		administrator_bean admin = new administrator_bean();
		ArrayList<administrator_bean> administratorlist = new ArrayList<administrator_bean>();
		try {
			String sql = "select * from administrator where adminnum='" + adminnum + "'";
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			if (rs.next()) {
				admin.setAdminnum(rs.getString("adminnum"));
				admin.setAdminpwd(rs.getString("adminpwd"));
				administratorlist.add(admin);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return administratorlist;
	}

	// ·入场登记插入数据库
	public void addEnterRecord(String carsize, String carnum, String entrance, String entertime, String operator) {
		PreparedStatement statement = null;
		Connection conn = DBUtil.getConn();
		try {
			String sql = "insert into record(carsize,carnum,entrance,entertime,enteropernum)values(?,?,?,?,?)";
			statement = conn.prepareStatement(sql);
			statement.setString(1, carsize);
			statement.setString(2, carnum);
			statement.setString(3, entrance);
			statement.setString(4, entertime);
			statement.setString(5, operator);
			statement.executeUpdate();
			statement.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ·搜索车牌找到信息
	public ArrayList<record_bean> carnumSearch(String carnum, String status) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Connection conn = DBUtil.getConn();
		Statement statement = null;
		ResultSet rs = null;
		record_bean record = new record_bean();
		ArrayList<record_bean> recordlist = new ArrayList<record_bean>();
		try {
			String sql = "select * from record where carnum = '" + carnum + "' and status = '" + status + "'";
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			if (rs.next()) {
				record.setCarsize(rs.getString("carsize"));
				record.setCarnum(rs.getString("carnum"));
				record.setEntertime(sdf.format(sdf.parse(rs.getString("entertime"))));
				record.setEntrance(rs.getString("entrance"));
				record.setFee(rs.getString("fee"));
				recordlist.add(record);
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return recordlist;
	}

	// ·通过车牌找到余额
	public ArrayList<member_bean> obtainBalance(String carnum) {
		Connection conn = DBUtil.getConn();
		Statement statement = null;
		ResultSet rs = null;
		member_bean mem = new member_bean();
		ArrayList<member_bean> memberlist1 = new ArrayList<member_bean>();
		try {
			String sql = "select * from member where carnum='" + carnum + "'";
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			if (rs.next()) {
				mem.setCarsize(rs.getString("carsize"));
				mem.setCarnum(rs.getString("carnum"));
				mem.setTel(rs.getString("tel"));
				mem.setMempwd(rs.getString("mempwd"));
				mem.setBalance(rs.getString("balance"));
				memberlist1.add(mem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return memberlist1;
	}

	// ·缴费后存进数据库record
	public ArrayList<record_bean> insertRecord(String carnum, String exit1, String exittime, String staytime, int fee,
			String exitopernum) {
		PreparedStatement statement = null;
		Connection conn = DBUtil.getConn();
		String status1 = "已缴费";
		try {
			String sql = "update record set exit1=?,exittime=?,staytime=?,fee=?,exitopernum=?,status=? where carnum=? and status = '未缴费'";
			statement = conn.prepareStatement(sql);
			statement.setString(1, exit1);
			statement.setString(2, exittime);
			statement.setString(3, staytime);
			statement.setInt(4, fee);
			statement.setString(5, exitopernum);
			statement.setString(6, status1);
			statement.setString(7, carnum);

			statement.executeUpdate();
			statement.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 更新balance
	public ArrayList<member_bean> insertMember(String carnum, int balance) {
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		ResultSet rs = null;
		member_bean mem = new member_bean();
		ArrayList<member_bean> memberlist = new ArrayList<member_bean>();
		try {
			String sql = "update member set balance = ? where carnum= ?";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			statement.setInt(1, balance);
			statement.setString(2, carnum);
			statement.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return null;
	}

	// 全部历史查询
	public ArrayList<record_bean> AllhistorySearch() {
		Connection conn = DBUtil.getConn();
		Statement statement = null;
		ResultSet rs = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ArrayList<record_bean> historylist = new ArrayList<record_bean>();
		try {
			String sql = "select * from record";
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				record_bean history = new record_bean();
				history.setCarsize(rs.getString("carsize"));
				history.setCarnum(rs.getString("carnum"));
				history.setEntertime(sdf.format(sdf.parse(rs.getString("entertime"))));
				history.setEntrance(rs.getString("entrance"));
				history.setFee(rs.getString("fee"));
				history.setExittime(rs.getString("exittime"));
				history.setExit1(rs.getString("exit1"));
				history.setStaytime(rs.getString("staytime"));
				history.setStatus(rs.getString("status"));
				historylist.add(history);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return historylist;
	}

	// ·历史搜索 对数据库中datetime类型数据进行处理
	public ArrayList<record_bean> historySearch(String carnum) {
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		ResultSet rs = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ArrayList<record_bean> historylist = new ArrayList<record_bean>();
		try {
			String sql = "select * from record where carnum = ?";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, carnum);
			rs = statement.executeQuery();
			while (rs.next()) {
				record_bean history = new record_bean();
				history.setCarsize(rs.getString("carsize"));
				history.setCarnum(rs.getString("carnum"));
				history.setEntertime(sdf.format(sdf.parse(rs.getString("entertime"))));
				history.setEntrance(rs.getString("entrance"));
				history.setFee(rs.getString("fee"));
				history.setExittime(sdf.format(sdf.parse(rs.getString("exittime"))));
				history.setExit1(rs.getString("exit1"));
				history.setStaytime(rs.getString("staytime"));
				history.setStatus(rs.getString("status"));
				historylist.add(history);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return historylist;
	}

	// ·操作员修改密码
	public void operchangePassword(String opernum, String newPassword) {
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		try {
			String sql = "update operator set operpwd = ? where opernum = ?";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, newPassword);
			statement.setString(2, opernum);
			statement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(statement, conn);
		}
	}

	// ·会员修改密码
	public void memchangePassword(String memnum, String newPassword) {
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		try {
			String sql = "update member set mempwd = ? where carnum = ?";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, newPassword);
			statement.setString(2, memnum);
			statement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(statement, conn);
		}
	}

	// ·管理员修改密码
	public void adminchangePassword(String adminnum, String newPassword) {
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		try {
			String sql = "update administrator set adminpwd = ? where adminnum = ?";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, newPassword);
			statement.setString(2, adminnum);
			statement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(statement, conn);
		}
	}

	// .临时用户信息查询 personOneList
	public ArrayList<record_bean> personOne_Search() {
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		ResultSet rs = null;
		ArrayList<record_bean> personOneList = new ArrayList<record_bean>();
		try {
			String sql = "select distinct carnum,carsize from record where carnum not in(select carnum from member)";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			rs = statement.executeQuery();
			while (rs.next()) {
				record_bean person2 = new record_bean();
				person2.setCarsize(rs.getString("carsize"));
				person2.setCarnum(rs.getString("carnum"));
				personOneList.add(person2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return personOneList;
	}

	// .临时用户信息搜索 personOnelist
	public ArrayList<record_bean> personOne(String carnum) {
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		ResultSet rs = null;
		record_bean personOne = new record_bean();
		ArrayList<record_bean> personOnelist = new ArrayList<record_bean>();
		try {
			String sql = "select * from record where carnum =? and carnum not in(select carnum from member)";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, carnum);
			rs = statement.executeQuery();
			if (rs.next()) {
				personOne.setCarsize(rs.getString("carsize"));
				personOne.setCarnum(rs.getString("carnum"));
				personOnelist.add(personOne);
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return personOnelist;
	}

	// .临时用户信息删除
	public ArrayList<record_bean> DelpersonOne(String carnum) {
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			String sql = "delete from record where carnum=?";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, carnum);
			statement.executeUpdate();
			statement.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return null;
	}

	// .会员信息查询 personTwoList
	public ArrayList<member_bean> personTwo_Search() {
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		ResultSet rs = null;
		ArrayList<member_bean> personTwoList = new ArrayList<member_bean>();
		try {
			String sql = "select carsize,carnum,tel,balance from member";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			rs = statement.executeQuery();
			while (rs.next()) {
				member_bean person3 = new member_bean();
				person3.setCarsize(rs.getString("carsize"));
				person3.setCarnum(rs.getString("carnum"));
				person3.setTel(rs.getString("tel"));
				person3.setBalance(rs.getString("balance"));
				personTwoList.add(person3);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return personTwoList;
	}

	// .管理员删除会员信息
	public ArrayList<record_bean> DelpersonTwo(String carnum) {
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			String sql = "delete from member where carnum=?";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, carnum);
			statement.executeUpdate();
			statement.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return null;
	}

	// .会员信息搜索 personTwolist
	public ArrayList<member_bean> personTwo(String carnum) {
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		ResultSet rs = null;
		member_bean personTwo = new member_bean();
		ArrayList<member_bean> personTwolist = new ArrayList<member_bean>();
		try {
			String sql = "select carsize,carnum,tel,balance from member where carnum =? ";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, carnum);
			rs = statement.executeQuery();
			if (rs.next()) {
				personTwo.setCarsize(rs.getString("carsize"));
				personTwo.setCarnum(rs.getString("carnum"));
				personTwo.setTel(rs.getString("tel"));
				personTwo.setBalance(rs.getString("balance"));
				personTwolist.add(personTwo);
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return personTwolist;
	}

	// .操作员信息查询 personThreeList
	public ArrayList<operator_bean> personThree_Search() {
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		ResultSet rs = null;
		ArrayList<operator_bean> personThreeList = new ArrayList<operator_bean>();
		try {
			String sql = "select opernum from operator";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			rs = statement.executeQuery();
			while (rs.next()) {
				operator_bean person = new operator_bean();
				person.setOpernum(rs.getString("opernum"));
				personThreeList.add(person);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return personThreeList;
	}

	// .管理员删除操作员信息
	public ArrayList<record_bean> DelpersonThree(String opernum) {
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			String sql = "delete from operator where opernum=?";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, opernum);
			statement.executeUpdate();
			statement.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return null;
	}

	// .管理员查询停车历史信息 adminhistoryList
	public ArrayList<record_bean> adminHistory_Search() {
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		ResultSet rs = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ArrayList<record_bean> adminhistoryList = new ArrayList<record_bean>();
		try {
			String sql = "select * from record where status='已缴费'";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			rs = statement.executeQuery();
			while (rs.next()) {
				record_bean car = new record_bean();
				car.setCarnum(rs.getString("carnum"));
				car.setEntertime(sdf.format(sdf.parse(rs.getString("entertime"))));
				car.setEntrance(rs.getString("entrance"));
				car.setExit1(rs.getString("exit1"));
				car.setStaytime(rs.getString("staytime"));
				car.setFee(rs.getString("fee"));
				car.setStatus(rs.getString("status"));
				adminhistoryList.add(car);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return adminhistoryList;
	}

	// .管理员历史信息搜索 adminhistorylist
	public ArrayList<record_bean> adminHistory(String carnum) {
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		ResultSet rs = null;
		ArrayList<record_bean> adminhistorylist = new ArrayList<record_bean>();
		try {
			String sql = "select carnum,entertime,entrance,exit1,staytime,fee,status from record where carnum=?";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, carnum);
			rs = statement.executeQuery();
			while (rs.next()) {
				record_bean car = new record_bean();
				car.setCarnum(rs.getString("carnum"));
				car.setEntertime(rs.getString("entertime"));
				car.setEntrance(rs.getString("entrance"));
				car.setExit1(rs.getString("exit1"));
				car.setStaytime(rs.getString("staytime"));
				car.setFee(rs.getString("fee"));
				car.setStatus(rs.getString("status"));
				adminhistorylist.add(car);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return adminhistorylist;
	}

	public ArrayList<record_bean> adminHistory2(String carnum) {
		Connection conn = DBUtil.getConn();
		PreparedStatement statement = null;
		ResultSet rs = null;
		ArrayList<record_bean> adminhistorylist = new ArrayList<record_bean>();
		try {
			String sql = "select carnum,entertime,entrance,exit1,staytime,fee,status from record where carnum=? and status='已缴费'";
			statement = (PreparedStatement) conn.prepareStatement(sql);
			statement.setString(1, carnum);
			rs = statement.executeQuery();
			while (rs.next()) {
				record_bean car = new record_bean();
				car.setCarnum(rs.getString("carnum"));
				car.setEntertime(rs.getString("entertime"));
				car.setEntrance(rs.getString("entrance"));
				car.setExit1(rs.getString("exit1"));
				car.setStaytime(rs.getString("staytime"));
				car.setFee(rs.getString("fee"));
				car.setStatus(rs.getString("status"));
				adminhistorylist.add(car);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, statement, conn);
		}
		return adminhistorylist;
	}

}
