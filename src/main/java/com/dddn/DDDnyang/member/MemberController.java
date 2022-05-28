package com.dddn.DDDnyang.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/member")
@Controller("memberController")
public class MemberController {

	@Autowired
	MemberService memberService;
	
	//회원가입 화면으로 이동
	@RequestMapping(value = "/joinPage")
	public String joinPage() {
		return "/member/memberJoin";
	}
	
	@RequestMapping(value = "checkId")
	@ResponseBody
	public int checkId(@RequestParam("id") String member_id) {
		int cnt = memberService.checkId(member_id);
		return cnt;
	}
	
	//신규 회원 정보 저장
	@RequestMapping(value = "/joinProcess")
	public String joinProcess(HttpServletRequest request) {
		String user_id = request.getParameter("member_id");
		String user_pw = request.getParameter("member_pw");
		String user_name = request.getParameter("member_name");
		String user_phone = request.getParameter("member_phone");
		String user_mail = request.getParameter("member_mail");
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", user_id);
		map.put("member_pw", user_pw);
		map.put("member_email", user_name);
		map.put("member_call", user_phone);
		map.put("member_name", user_mail);
		
		memberService.joinMember(map);
		
		//가입 실패 시 처리 추가
		return "main/main";
	}
	
}
