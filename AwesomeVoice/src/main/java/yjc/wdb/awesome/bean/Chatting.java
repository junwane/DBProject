package yjc.wdb.awesome.bean;

import java.sql.Date;

public class Chatting {
	
	private int c_no;
	private String c_send;
	private String c_accept;
	private Date c_sendDate;
	private String c_content;
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_send() {
		return c_send;
	}
	public void setC_send(String c_send) {
		this.c_send = c_send;
	}
	public String getC_accept() {
		return c_accept;
	}
	public void setC_accept(String c_accept) {
		this.c_accept = c_accept;
	}
	public Date getC_sendDate() {
		return c_sendDate;
	}
	public void setC_sendDate(Date c_sendDate) {
		this.c_sendDate = c_sendDate;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

}
