package yjc.wdb.awesome.bean;

import org.springframework.web.multipart.MultipartFile;

public class ChattingRoom {
	private int cr_no ;
	private String cr_id ;
	private String cr_abbot ;
	private String cr_date;
	private String cr_title;
	private String fileName;
	private MultipartFile cr_image;
	private int cr_count = 1 ;
	public int getCr_no() {
		return cr_no;
	}
	public void setCr_no(int cr_no) {
		this.cr_no = cr_no;
	}
	public String getCr_id() {
		return cr_id;
	}
	public void setCr_id(String cr_id) {
		this.cr_id = cr_id;
	}
	public String getCr_abbot() {
		return cr_abbot;
	}
	public void setCr_abbot(String cr_abbot) {
		this.cr_abbot = cr_abbot;
	}
	public String getCr_date() {
		return cr_date;
	}
	public void setCr_date(String cr_date) {
		this.cr_date = cr_date;
	}
	public String getCr_title() {
		return cr_title;
	}
	public void setCr_title(String cr_title) {
		this.cr_title = cr_title;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public MultipartFile getCr_image() {
		return cr_image;
	}
	public void setCr_image(MultipartFile cr_image) {
		this.cr_image = cr_image;
	}
	public int getCr_count() {
		return cr_count;
	}
	public void setCr_count(int cr_count) {
		this.cr_count = cr_count;
	}
	
	

	
}
