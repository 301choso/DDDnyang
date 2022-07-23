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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	@RequestMapping("insertNotice")
	public @ResponseBody void insertNotice(@RequestParam Map<String, Object> parameterMap) {
	System.out.println(parameterMap.toString());
		try {
	//		uploadImage(file);
			int count = adminNoticeService.insertNotice(parameterMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="uploadImage", produces = "application/json")
	public @ResponseBody void uploadImage(@RequestParam("file") MultipartFile multipartFile, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		
		String fileRoot = "C:\\summernote_image\\";	//저장경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지널 파일이름
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//확장자
		
		String savedFileName = UUID.randomUUID()+extension;	//저장될 파일이름 랜덤으로
		File targetFile = new File(fileRoot + savedFileName);
		
		try {

			if(!targetFile.exists()) {
				targetFile.mkdir();
			}
			multipartFile.transferTo(targetFile);
//			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
	//		jsonObject.addProperty("responseCode", "success");
		} catch(IOException e){
			FileUtils.deleteQuietly(targetFile);	//실패 시 저장된 파일 삭제
//			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
//			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		out.print("/summernoteImage/"+savedFileName);
		out.close();
	}
	
	
}
