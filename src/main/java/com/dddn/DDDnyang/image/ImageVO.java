package com.dddn.DDDnyang.image;

import java.sql.Date;

public class ImageVO {
	private int image_id;
	private String image_sort;
	private String image_file_original_name;
	private String image_file_name;
	private Date image_date;
	private int board_id;
	private int member_num;
	
	public int getImage_id() {
		return image_id;
	}
	public void setImage_id(int image_id) {
		this.image_id = image_id;
	}
	public String getImage_sort() {
		return image_sort;
	}
	public void setImage_sort(String image_sort) {
		this.image_sort = image_sort;
	}
	public String getImage_file_original_name() {
		return image_file_original_name;
	}
	public void setImage_file_original_name(String image_file_original_name) {
		this.image_file_original_name = image_file_original_name;
	}
	public String getImage_file_name() {
		return image_file_name;
	}
	public void setImage_file_name(String image_file_name) {
		this.image_file_name = image_file_name;
	}
	public Date getImage_date() {
		return image_date;
	}
	public void setImage_date(Date image_date) {
		this.image_date = image_date;
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
