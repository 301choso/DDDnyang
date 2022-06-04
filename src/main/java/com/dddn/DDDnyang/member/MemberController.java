package com.dddn.DDDnyang.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public int checkId(@RequestParam("id") String member_id) {	//아이디 중복 체크
		int cnt = memberService.checkId(member_id);
		return cnt;
	}
	
	//신규 회원 정보 저장
	@RequestMapping(value = "/joinProcess")
	public ResponseEntity joinProcess(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("member_id");
		String user_pw = request.getParameter("member_pw");
		String user_name = request.getParameter("member_name");
		String user_phone01 = request.getParameter("member_phone01");
		String user_phone02 = request.getParameter("member_phone02");
		String user_phone03 = request.getParameter("member_phone03");
		String user_mail01 = request.getParameter("member_mail01");
		String user_mail02 = request.getParameter("member_mail02");
		String user_phone = user_phone01+user_phone02+user_phone03;
		String user_mail = user_mail01+"@"+user_mail02;
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", user_id);
		map.put("member_pw", user_pw);
		map.put("member_email", user_name);
		map.put("member_call", user_phone);
		map.put("member_name", user_mail);
		
		String message = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		ResponseEntity resEntity = null;
		try {
		response.setContentType("text/html; charset-UTF-8");
		request.setCharacterEncoding("utf-8");
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		memberService.joinMember(map);
		message = "<script>";
		message += "alert('회원 가입을 완료했습니다. 메인화면으로 이동합니다.');";
		message += "location.href='"+request.getContextPath()+"/'";
		message += "</script>";
		} catch(Exception e){
			message = "<script>";
			message += "location.href='"+request.getContextPath()+"/member/joinPage'";
			message += "</script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		
		return resEntity;
	}
	
}
