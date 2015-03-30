package com.msit.books;

public class users {
	private int id;
	private String loginId;
	private String loginPwd;
	private String uName;
	private String address;
	private String phone;
	private String mail;
	private userroles userRoleId;
	private int userStateId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getLoginPwd() {
		return loginPwd;
	}
	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}

	public userroles getUserRoleId() {
		return userRoleId;
	}
	public void setUserRoleId(userroles userRoleId) {
		this.userRoleId = userRoleId;
	}
	public int getUserStateId() {
		return userStateId;
	}
	public void setUserStateId(int userStateId) {
		this.userStateId = userStateId;
	}

}
