package com.xg.model;

import java.util.Date;

/**
 * 公司新闻&动态
 * @author Administrator
 *
 */
public class News {
	private Integer nId;
	private String nTitle; //标题
	private String nOutline; //概述
	private String nContent;//内容
	private String nType; //分类
	private String nLabel1;// 标签1
	private String nLabel2;//标签2
	private Date nCreateTime;//创建时间
	private String nThumbnail;//缩略图
	private Integer nChildType; //1,新果新闻 2,新果动态 3,新果生活
	private Integer nOnlookerNum;//围观热度
	public Integer getnId() {
		return nId;
	}
	public void setnId(Integer nId) {
		this.nId = nId;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnOutline() {
		return nOutline;
	}
	public void setnOutline(String nOutline) {
		this.nOutline = nOutline;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public String getnType() {
		return nType;
	}
	public void setnType(String nType) {
		this.nType = nType;
	}
	public String getnLabel1() {
		return nLabel1;
	}
	public void setnLabel1(String nLabel1) {
		this.nLabel1 = nLabel1;
	}
	public String getnLabel2() {
		return nLabel2;
	}
	public void setnLabel2(String nLabel2) {
		this.nLabel2 = nLabel2;
	}

	public Date getnCreateTime() {
		return nCreateTime;
	}
	public void setnCreateTime(Date nCreateTime) {
		this.nCreateTime = nCreateTime;
	}
	public String getnThumbnail() {
		return nThumbnail;
	}
	public void setnThumbnail(String nThumbnail) {
		this.nThumbnail = nThumbnail;
	}
	public Integer getnChildType() {
		return nChildType;
	}
	public void setnChildType(Integer nChildType) {
		this.nChildType = nChildType;
	}
	public Integer getnOnlookerNum() {
		return nOnlookerNum;
	}
	public void setnOnlookerNum(Integer nOnlookerNum) {
		this.nOnlookerNum = nOnlookerNum;
	}

	
}
