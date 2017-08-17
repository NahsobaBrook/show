package entity;

import java.util.Date;

public class Customer {

	private String account;
	private String password;
	private String head;
	private int grade;
	private int score;
	private Date logintime;

	@Override
	public String toString() {
		return "Customer [account=" + account + ", password=" + password + ", head=" + head + ", grade=" + grade
				+ ", score=" + score + ", logintime=" + logintime + "]";
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Date getLogintime() {
		return logintime;
	}

	public void setLogintime(Date logintime) {
		this.logintime = logintime;
	}

}
