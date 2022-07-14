package com.dddn.DDDnyang.admin.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dddn.DDDnyang.member.MemberVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@RequestMapping("/admin")
@Controller("adminMemberController")
public class AdminMemberController {

	@Autowired
	AdminmemberService memberService;
	
	@RequestMapping(value="member/memberList")
	public String memberList(HttpServletRequest request, HttpServletResponse response) {
		return "admin/member/memberList";
	}
	
	@RequestMapping(value="createTable")
	public @ResponseBody void createTable(HttpServletRequest request, HttpServletResponse response){
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();

		PrintWriter out;
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			out = response.getWriter();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			ArrayList<Map<String, Object>> data = (ArrayList<Map<String, Object>>) memberService.selectMember(parameterMap);
			jsonMap.put("data", data);
			
			Gson gson = new Gson();
			out.print(gson.toJson(jsonMap));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="member/modifyPage")
	public ModelAndView modifyPage(@RequestParam("member_id") String member_id){
		ModelAndView mv = new ModelAndView();
		try {
			Map<String, Object> infoMap = new HashMap<String, Object>();
			infoMap = memberService.selectInfo(member_id);
			mv.addObject("memberInfo", infoMap);
			mv.setViewName("admin/member/memberModify");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value="member/infoModify")
	public ModelAndView memberInfoModify(@RequestParam Map<String, String> modifyMap) {
		System.out.println("확인 = "+modifyMap.toString());
		ModelAndView mv = new ModelAndView();
		memberService.updateInfo(modifyMap);
		mv.setViewName("admin/member/memberList");
		
		return mv;
	}
}
