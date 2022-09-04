package com.dddn.DDDnyang.admin.reported;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller("reportedController")
@RequestMapping("/report")
public class ReportedController {

	@Autowired
	private ReportedService reportedService;
	
	//사용자 신고내용을 저장
	@RequestMapping(value = "/insert", method=RequestMethod.POST)
	public @ResponseBody int insertReport(@RequestParam Map<String, Object> map, HttpServletRequest request ) {
		HttpSession session = request.getSession();
		String reported_id = (String) session.getAttribute("login_id");
		map.put("reported_id", reported_id);
		
		int result = reportedService.insertReport(map);
		return result;
	}
	
	//admin - 신고목록 보기
	@RequestMapping(value="/reportList", method=RequestMethod.GET)
	public String reportList() {
		return "admin/reported/reportList";
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
			ArrayList<Map<String, Object>> data = (ArrayList<Map<String, Object>>) reportedService.reportList(parameterMap);
			jsonMap.put("data", data);
			
			Gson gson = new Gson();
			out.print(gson.toJson(jsonMap));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
