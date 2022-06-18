package com.dddn.DDDnyang.admin;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.dddn.DDDnyang.member.MemberVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@RequestMapping("memberA")
@Controller("adminMemberController")
public class AdminMemberController {

	@Autowired
	AdminmemberService memberService;
	
	@RequestMapping(value="/memberList")
	public String memberList(HttpServletRequest request, HttpServletResponse response) {
		


		
		
		return "admin/memberList";
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
}
