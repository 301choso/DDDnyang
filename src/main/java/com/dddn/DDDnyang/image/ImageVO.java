package com.dddn.DDDnyang.image;

import java.sql.Date;

public class ImageVO {
	private int image_id;
	private Date image_date;
	private String image_file_name;
	private int board_id;
	private int member_num;
	public int getImage_id() {
		return image_id;
	}
	public void setImage_id(int image_id) {
		this.image_id = image_id;
	}
	public Date getImage_date() {
		return image_date;
	}
	public void setImage_date(Date image_date) {
		this.image_date = image_date;
	}
	public String getImage_file_name() {
		return image_file_name;
	}
	public void setImage_file_name(String image_file_name) {
		this.image_file_name = image_file_name;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
}
