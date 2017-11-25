package com.xg.model;

/**
 * 团队
 * @author Administrator
 *
 */
public class Team {
	private Integer tId;
	private String tTitle;  //标题
	private String tContent;  //内容
	private String tThumbnail;  //图片路径
	private String tExtra1;  //团队详细里的标题
	private String tExtra2; //团队详细里图片路径
	private String tExtra3;
	public Integer gettId() {
		return tId;
	}
	public void settId(Integer tId) {
		this.tId = tId;
	}
	public String gettTitle() {
		return tTitle;
	}
	public void settTitle(String tTitle) {
		this.tTitle = tTitle;
	}
	public String gettContent() {
		return tContent;
	}
	public void settContent(String tContent) {
		this.tContent = tContent;
	}
	public String gettThumbnail() {
		return tThumbnail;
	}
	public void settThumbnail(String tThumbnail) {
		this.tThumbnail = tThumbnail;
	}
	public String gettExtra1() {
		return tExtra1;
	}
	public void settExtra1(String tExtra1) {
		this.tExtra1 = tExtra1;
	}
	public String gettExtra2() {
		return tExtra2;
	}
	public void settExtra2(String tExtra2) {
		this.tExtra2 = tExtra2;
	}
	public String gettExtra3() {
		return tExtra3;
	}
	public void settExtra3(String tExtra3) {
		this.tExtra3 = tExtra3;
	}
}
