package com.User;

import java.sql.Date;

public class UserNotes {
	private int id;
	private String title;
	private String content;
	private Date dt;
	private UserDetails user;
	private byte[] pic = null;
	
	
	private String base64Image=null;
    
    public String getBase64Image() {
        return base64Image;
    }
 
    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }
    
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
	
	public byte[] getPic() {
		return pic;
	}
	public void setPic(byte[] pic) {
		this.pic = pic;
	}
	@Override
	public String toString() {
		return "UserNotes [getId()=" + getId() + ", getTitle()=" + getTitle()
				+ ", getContent()=" + getContent() + ", getDt()=" + getDt()
				+ ", getUser()=" + getUser() + ", toString()="
				+ super.toString() + "]";
	}

}
