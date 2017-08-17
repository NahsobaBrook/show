package entity;

import java.util.Date;

public class Reply {

	private Integer id;     
	private String  account;  
	private String  content;   
	private Date  replytime;  
	private Integer   tid;

	
	
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	@Override
	public String toString() {
		return "Reply [id=" + id + ", account=" + account + ", content=" + content + ", replytime=" + replytime
				+ ", tid=" + tid + "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReplytime() {
		return replytime;
	}
	public void setReplytime(Date replytime) {
		this.replytime = replytime;
	}

	
}
