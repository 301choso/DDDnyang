package com.dddn.DDDnyang.board;

import java.sql.Date;

public class BoardVO {
	private int board_id;
	private String board_title;
	private String board_content;
	private Date board_date;
	private int board_views;
	private int board_like_it;
	private String board_category;
	private int member_num;
	private String fileInfo;
	private String show_yn;
	
	public String getFileInfo() {
		return fileInfo;
	}

	public String getShow_yn() {
		return show_yn;
	}

	public void setShow_yn(String show_yn) {
		this.show_yn = show_yn;
	}

	public void setFileInfo(String fileInfo) {
		this.fileInfo = fileInfo;
	}

	public int getBoard_id() {
		return board_id;
	}
	
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public int getBoard_views() {
		return board_views;
	}
	public void setBoard_views(int board_views) {
		this.board_views = board_views;
	}
	public int getBoard_like_it() {
		return board_like_it;
	}
	public void setBoard_like_it(int board_like_it) {
		this.board_like_it = board_like_it;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
}
