package com.dddn.DDDnyang.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/member")
@Controller("memberController")
public class MemberController {

	@Autowired
	MemberService memberService;
	
	//ȸ������ ȭ������ �̵�
	@RequestMapping(value = "/joinPage")
	public String joinPage() {
		return "member/memberJoin";
	}
	
	@RequestMapping(value = "checkId")
	@ResponseBody
	public int checkId(@RequestParam("id") String member_id) {	//���̵� �ߺ� üũ
		int cnt = memberService.checkId(member_id);
		return cnt;
	}
	
	//�ű� ȸ�� ���� ����
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
		message += "alert('ȸ�� ������ �Ϸ��߽��ϴ�. ����ȭ������ �̵��մϴ�.');";
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
	
	@RequestMapping(value="/loginFrm")
	public String loginFrm() {
		return "member/loginFrm";
	}
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public ModelAndView loginProcess(@RequestParam Map<String, String> loginMap, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		Map<String, String> member = null;
		try {
			member = memberService.checkLogin(loginMap);
			if(member == null) {
				String message = "���̵� Ȥ�� ��й�ȣ�� Ȯ�����ּ���.";
				mv.addObject("message", message);
				mv.setViewName("member/loginFrm");
				session.setAttribute("logOn", false);
			} else {
				session.setAttribute("logOn", true);
				session.setAttribute("login_id", member.get("member_id"));
				session.setAttribute("member_num", member.get("member_num"));
				mv.setViewName("main/main");							
			}			
		} catch(Exception e) {
			String message = "������ �߻��߽��ϴ�. �ٽ� �õ����ּ���";
			mv.addObject("message", message);
			e.printStackTrace();
		}

		return mv;
	}
	
	@RequestMapping(value="/loginOutProcess")
	public String logoutProcess(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("logOn");
		session.removeAttribute("login_id");
		
		return "main/main";
	}
	
}
