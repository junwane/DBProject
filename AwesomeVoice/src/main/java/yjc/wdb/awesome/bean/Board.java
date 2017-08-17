package yjc.wdb.awesome.bean;

import java.sql.Date;

public class Board {
	
	private int b_no;
	private Date b_register;
	private int b_count;
	private String b_title;
	private String b_content;
	private String b_voicefile;
	private int mi_no;
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public Date getB_register() {
		return b_register;
	}
	public void setB_register(Date b_register) {
		this.b_register = b_register;
	}
	public int getB_count() {
		return b_count;
	}
	public void setB_count(int b_count) {
		this.b_count = b_count;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_voicefile() {
		return b_voicefile;
	}
	public void setB_voicefile(String b_voicefile) {
		this.b_voicefile = b_voicefile;
	}
	public int getMi_no() {
		return mi_no;
	}
	public void setMi_no(int mi_no) {
		this.mi_no = mi_no;
	}

 }
