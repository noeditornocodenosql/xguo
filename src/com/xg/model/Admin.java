package com.xg.model;

public class Admin {
	private int aId;
	private String aUserName;
	private String aPassword;
	private String aNickName;
	private String aEmail;
	private String aRegisterTime;
	private 	String aLastLogonTime;
	private Integer aStatus; //激活状态
	private String aCode; //激活码
	public int getaId() {
		return aId;
	}
	public void setaId(int aId) {
		this.aId = aId;
	}
	public String getaUserName() {
		return aUserName;
	}
	public void setaUserName(String aUserName) {
		this.aUserName = aUserName;
	}
	public String getaPassword() {
		return aPassword;
	}
	public void setaPassword(String aPassword) {
		this.aPassword = aPassword;
	}
	public String getaNickName() {
		return aNickName;
	}
	public void setaNickName(String aNickName) {
		this.aNickName = aNickName;
	}
	public String getaEmail() {
		return aEmail;
	}
	public void setaEmail(String aEmail) {
		this.aEmail = aEmail;
	}
	public String getaRegisterTime() {
		return aRegisterTime;
	}
	public void setaRegisterTime(String aRegisterTime) {
		this.aRegisterTime = aRegisterTime;
	}
	public String getaLastLogonTime() {
		return aLastLogonTime;
	}
	public void setaLastLogonTime(String aLastLogonTime) {
		this.aLastLogonTime = aLastLogonTime;
	}
	public Integer getaStatus() {
		return aStatus;
	}
	public void setaStatus(Integer aStatus) {
		this.aStatus = aStatus;
	}
	public String getaCode() {
		return aCode;
	}
	public void setaCode(String aCode) {
		this.aCode = aCode;
	}
}
