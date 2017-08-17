package entity;

import java.util.Date;

/**
 * 
 * @功能：主贴类
 * @作者：李瑞豪
 * @时间：2017年7月14日
 * @地点：31班教室
 */
public class Topic {

	
	private Integer	id;               
	private String  account; 
	private String  title;   
	private String  content;
	private Date  sendtime;   
	private Date  lasttime;

	
	
	@Override
	public String toString() {
		return "Topic [id=" + id + ", account=" + account + ", title=" + title + ", content=" + content + ", sendtime="
				+ sendtime + ", lasttime=" + lasttime + "]";
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
	public Date getSendtime() {
		return sendtime;
	}
	public void setSendtime(Date sendtime) {
		this.sendtime = sendtime;
	}
	public Date getLasttime() {
		return lasttime;
	}
	public void setLasttime(Date lasttime) {
		this.lasttime = lasttime;
	}   
	
	
}
