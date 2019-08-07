package bean;

//·会员
public class member_bean {
	private String carsize;// 车型
	private String carnum;// 车牌
	private String tel;// 联系方式
	private String mempwd;// 密码
	private String balance;// 余额

	public String getCarsize() {
		return carsize;
	}

	public void setCarsize(String carsize) {
		this.carsize = carsize;
	}

	public String getCarnum() {
		return carnum;
	}

	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMempwd() {
		return mempwd;
	}

	public void setMempwd(String mempwd) {
		this.mempwd = mempwd;
	}

	public String getBalance() {
		return balance;
	}

	public void setBalance(String balance) {
		this.balance = balance;
	}
}
