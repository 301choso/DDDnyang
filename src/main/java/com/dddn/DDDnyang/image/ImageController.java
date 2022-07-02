package com.dddn.DDDnyang.image;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller("imageController")
@RequestMapping(value = "/image")
public class ImageController {

	@Autowired
	private ImageService imageService;

	  //첨부파일 업로드
	  @RequestMapping(value = "/editor/upload.do", method = RequestMethod.POST)	 
	  @ResponseBody public ResponseEntity<String> uploadEditorAttach(@RequestParam("file") MultipartFile file,
		  														HttpServletRequest request, HttpServletResponse response) {
		  System.out.println("@@@@@@@");
		  
		 
		  ResponseEntity resEntity = null;
		  String message = null;
		  HttpHeaders responseHeaders = new HttpHeaders();
		  try{
			  ImageVO imageVO = new ImageVO();
			  imageVO.setBoard_id(1);// Integer.parseInt(request.getParameter("board_id"))
			  imageVO.setImage_file_name(file.getOriginalFilename());
			  imageVO.setMember_num(1);
			  imageService.insertImage(imageVO);
			  
			  response.setContentType("text/html; charset-UTF-8");
			  request.setCharacterEncoding("utf-8");
			  responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
			message = "<script>";
			message += "alert('파일을 업로드 하였습니다.')";
			message += "location.href='"+request.getContextPath()+"/'";
			message += "</script>";
		  } catch(Exception e) {
			message = "<script>";
			message += "location.href='"+request.getContextPath()+"/member/joinPage'";
			message += "</script>";
			e.printStackTrace();
		  }
		  resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		  return resEntity; 
	  }
	 
}
