package com.User;

import java.sql.Date;

public class UserNotes {
	private int id;
	private String title;
	private String content;
	private Date dt;
	private UserDetails user;
	public UserNotes() {
		super();
	}
	public UserNotes(int id, String title, String content, Date dt,
			UserDetails user) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.dt = dt;
		this.user = user;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public Date getDt() {
		return dt;
	}
	public void setDt(Date dt) {
		this.dt = dt;
	}
	public UserDetails getUser() {
		return user;
	}
	public void setUser(UserDetails user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "UserNotes [getId()=" + getId() + ", getTitle()=" + getTitle()
				+ ", getContent()=" + getContent() + ", getDt()=" + getDt()
				+ ", getUser()=" + getUser() + ", toString()="
				+ super.toString() + "]";
	}

}
