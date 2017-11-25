package com.xg.model;

import java.util.Date;

public class Example {
	private int eId;
	private String eProjectName;
	private String eLabel;
	private String eLabel1;
	private String eLabel2;
	private String eThumbnail;
	private Integer eChildType; //1,宣传片 2,广告片 3,专题片 4,纪录片 5,微电影 6,平面设计 7,其他
	private String eURL;
	private Date eCreateTime;
	public int geteId() {
		return eId;
	}
	public void seteId(int eId) {
		this.eId = eId;
	}
	public String geteProjectName() {
		return eProjectName;
	}
	public void seteProjectName(String eProjectName) {
		this.eProjectName = eProjectName;
	}
	public String geteLabel() {
		return eLabel;
	}
	public void seteLabel(String eLabel) {
		this.eLabel = eLabel;
	}
	public String geteLabel1() {
		return eLabel1;
	}
	public void seteLabel1(String eLabel1) {
		this.eLabel1 = eLabel1;
	}
	public String geteLabel2() {
		return eLabel2;
	}
	public void seteLabel2(String eLabel2) {
		this.eLabel2 = eLabel2;
	}
	public String geteThumbnail() {
		return eThumbnail;
	}
	public void seteThumbnail(String eThumbnail) {
		this.eThumbnail = eThumbnail;
	}
	public Integer geteChildType() {
		return eChildType;
	}
	public void seteChildType(Integer eChildType) {
		this.eChildType = eChildType;
	}
	public String geteURL() {
		return eURL;
	}
	public void seteURL(String eURL) {
		this.eURL = eURL;
	}
	public Date geteCreateTime() {
		return eCreateTime;
	}
	public void seteCreateTime(Date eCreateTime) {
		this.eCreateTime = eCreateTime;
	}
}
