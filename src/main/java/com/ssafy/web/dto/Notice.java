package com.ssafy.web.dto;

public class Notice {
	private int articleno;
	private String userid;
	private String subject;
	private String content;
	private String regtime;
	
	public Notice() {
		
	}
	
	public Notice(int articleno, String userid, String subject, String content, String regtime) {
		super();
		this.articleno = articleno;
		this.userid = userid;
		this.subject = subject;
		this.content = content;
		this.regtime = regtime;
	}
	
	@Override
	public String toString() {
		return "Notice [articleno=" + articleno + ", userid=" + userid + ", subject=" + subject + ", content=" + content
				+ ", regtime=" + regtime + "]";
	}
	public int getArticleno() {
		return articleno;
	}
	public void setArticleno(int articleno) {
		this.articleno = articleno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegtime() {
		return regtime;
	}
	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}
	
	
	
}
