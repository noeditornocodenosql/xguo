package com.xg.model;

import java.util.Date;

/**
 * 首页动态图
 * @author Administrator
 *
 */
public class DynamicCirculate {
	private Integer dId;
	private String bigPictureTitle; //大图标题
	private String bigPictureContent;//大图内容
	private String bigPictureThumbnail;//大图路径
	private String smallPictureTitle; //小图标题
	private Date  smallPictureCreateTime;//创建时间
	private String smaliPictureThumbnail;//小图路径
	
	public Integer getdId() {
		return dId;
	}
	public void setdId(Integer dId) {
		this.dId = dId;
	}
	public String getBigPictureTitle() {
		return bigPictureTitle;
	}
	public void setBigPictureTitle(String bigPictureTitle) {
		this.bigPictureTitle = bigPictureTitle;
	}
	public String getBigPictureContent() {
		return bigPictureContent;
	}
	public void setBigPictureContent(String bigPictureContent) {
		this.bigPictureContent = bigPictureContent;
	}
	public String getBigPictureThumbnail() {
		return bigPictureThumbnail;
	}
	public void setBigPictureThumbnail(String bigPictureThumbnail) {
		this.bigPictureThumbnail = bigPictureThumbnail;
	}
	public String getSmallPictureTitle() {
		return smallPictureTitle;
	}
	public void setSmallPictureTitle(String smallPictureTitle) {
		this.smallPictureTitle = smallPictureTitle;
	}
	public Date getSmallPictureCreateTime() {
		return smallPictureCreateTime;
	}
	public void setSmallPictureCreateTime(Date smallPictureCreateTime) {
		this.smallPictureCreateTime = smallPictureCreateTime;
	}
	public String getSmaliPictureThumbnail() {
		return smaliPictureThumbnail;
	}
	public void setSmaliPictureThumbnail(String smaliPictureThumbnail) {
		this.smaliPictureThumbnail = smaliPictureThumbnail;
	}

	
}
