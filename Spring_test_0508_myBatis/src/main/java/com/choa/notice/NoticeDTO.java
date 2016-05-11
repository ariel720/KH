package com.choa.notice;

import java.sql.Date;

import javax.xml.bind.annotation.XmlRootElement;

//@XmlRootElement //NoticeDTO 객체를 주고 받을 때 XML 형태로 주고받겠다.
public class NoticeDTO {

	private int num;
	private String id;
	private String title;
	private String content;
	private Date reg_date;
	private int counts;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	
	
}
