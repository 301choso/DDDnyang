package com.dddn.DDDnyang.admin.notice;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@RequestMapping("admin/notice")
@Controller("adminNoticeController")
public class AdminNoticeController {
	
	@Autowired
	AdminNoticeService adminNoticeService;
	
	//공지사항 페이지 가기
	@RequestMapping(value="noticeList")
	public String noticeList(){
		return "admin/notice/noticeList";
	}
	
	//공지사항 목록에 데이터테이블 생성
	@RequestMapping(value="createList", produces = "application/text; charset=UTF-8")
	public @ResponseBody void createList(HttpServletResponse response) {

		PrintWriter out;
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			out = response.getWriter();
			response.setContentType("application/json;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			ArrayList<Map<String, Object>> data = (ArrayList<Map<String, Object>>) adminNoticeService.noticeList();
			jsonMap.put("data", data);
			Gson gson = new Gson();
			out.print(gson.toJson(jsonMap));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	//공지사항 입력 페이지로
	@RequestMapping("noticeForm")
	public String insertPage() {
		return "admin/notice/noticeWrite";
	}
	
	//공지사항 입력
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
	public @ResponseBody void insertNotice(@RequestParam Map<String, Object> parameterMap) {
		ModelAndView mav = new ModelAndView();
		try {
			int count = adminNoticeService.insertNotice(parameterMap);
			mav.addObject("count", count);
			mav.setViewName("redirect:/admin/notice/noticeList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//공지사항 내용 보기
	@RequestMapping(value="/viewPage")
	public ModelAndView noticeDetail(@RequestParam("notice_id") int notice_id) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> notice= (HashMap<String, Object>) adminNoticeService.noticeDetail(notice_id);
		mav.addObject("notice", notice);
		mav.setViewName("admin/notice/view");
		return mav;
	}
	
	
}
