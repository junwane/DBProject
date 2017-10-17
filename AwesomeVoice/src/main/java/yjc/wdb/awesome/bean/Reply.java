package yjc.wdb.awesome.bean;

import java.sql.Date;

public class Reply {

	private int r_no;
	private String m_id;
	private String r_content;
	private String r_file;
	private Date r_register;
	
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_file() {
		return r_file;
	}
	public void setR_file(String r_file) {
		this.r_file = r_file;
	}
	public Date getR_register() {
		return r_register;
	}
	public void setR_register(Date r_register) {
		this.r_register = r_register;
	}
}
