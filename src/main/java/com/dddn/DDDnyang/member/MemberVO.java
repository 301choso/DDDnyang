package com.dddn.DDDnyang.member;

import java.util.Date;

public class MemberVO {
	private String member_id;
	private String member_pw;
	private int member_num;
	private String member_email;
	private String member_call;
	private String member_name;
	private String member_yn;
	private Date member_join_date;
	
	public MemberVO(String member_id, String member_pw, int member_num, String member_email, String member_call,
			String member_name, String member_yn, Date member_join_date) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_num = member_num;
		this.member_email = member_email;
		this.member_call = member_call;
		this.member_name = member_name;
		this.member_yn = member_yn;
		this.member_join_date = member_join_date;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_call() {
		return member_call;
	}

	public void setMember_call(String member_call) {
		this.member_call = member_call;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_yn() {
		return member_yn;
	}

	public void setMember_yn(String member_yn) {
		this.member_yn = member_yn;
	}

	public Date getMember_join_date() {
		return member_join_date;
	}

	public void setMember_join_date(Date member_join_date) {
		this.member_join_date = member_join_date;
	}
}
