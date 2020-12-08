package com.ssafy.web.dto;

public class News {
	private String title;
	private String desc;
	public String getDesc() {
		return desc;
	}



	public void setDesc(String desc) {
		this.desc = desc;
	}

	private String link;
	private String author;
	private String date;
	
	public News() {
		
	}
	
	
	
	@Override
	public String toString() {
		return "News [title=" + title + ", desc=" + desc + ", link=" + link + ", author=" + author + ", date=" + date
				+ "]";
	}



	public News(String title, String desc, String link, String author, String date) {
		super();
		this.title = title;
		this.desc = desc;
		this.link = link;
		this.author = author;
		this.date = date;
	}



	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
	
	
	
}
