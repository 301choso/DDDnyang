package com.dddn.DDDnyang.myPage;

import java.sql.Date;

public class MyPageBookMarkVO {
	private int mybookmark_num;
	private int member_num;
	private int board_id;
	private Date reg_date;
	
	public int getMybookmark_num() {
		return mybookmark_num;
	}
	public void setMybookmark_num(int mybookmark_num) {
		this.mybookmark_num = mybookmark_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
