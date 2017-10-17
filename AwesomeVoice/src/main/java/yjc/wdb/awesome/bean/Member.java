package yjc.wdb.awesome.bean;

import java.sql.Date;

public class Member {
	
	private String m_id;
	private String m_pw;
	private String m_img;
	private String m_voice;
	private Date m_register;
	private int m_open;
	private String m_info;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_img() {
		return m_img;
	}
	public void setM_img(String m_img) {
		this.m_img = m_img;
	}
	public String getM_voice() {
		return m_voice;
	}
	public void setM_voice(String m_voice) {
		this.m_voice = m_voice;
	}
	public Date getM_register() {
		return m_register;
	}
	public void setM_register(Date m_register) {
		this.m_register = m_register;
	}
	public int getM_open() {
		return m_open;
	}
	public void setM_open(int m_open) {
		this.m_open = m_open;
	}
	public String getM_info() {
		return m_info;
	}
	public void setM_info(String m_info) {
		this.m_info = m_info;
	}
}
