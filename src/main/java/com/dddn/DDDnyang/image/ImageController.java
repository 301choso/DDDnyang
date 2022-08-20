package com.dddn.DDDnyang.image;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller("imageController")
@RequestMapping(value = "/image")
public class ImageController {

	@Autowired
	private ImageService imageService;

	private static final String CURR_IMAGE_REPO_PATH = "C:\\upload"; // 상대경로로 바꿀것
	
	// 이미지 업로드
	@RequestMapping(value = "/editor/upload.do", method = RequestMethod.POST)
	@ResponseBody
	public String summernoteUpload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String originalFileName = "";
		try {
			List<ImageVO> fileList = new ArrayList<ImageVO>();
			Iterator<String> fileNames = multipartRequest.getFileNames();

			while (fileNames.hasNext()) {
				ImageVO imageVO = new ImageVO();
				String fileName = fileNames.next();
				MultipartFile mFile = multipartRequest.getFile(fileName);
				originalFileName = mFile.getOriginalFilename();
				imageVO.setImage_file_name(originalFileName);
				
				fileList.add(imageVO);

				File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
				if (mFile.getSize() != 0) { // File Null Check
					if (!file.exists()) {
						if (file.getParentFile().mkdirs()) {
							file.createNewFile();
						}
					}
					mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + originalFileName));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "http://localhost:8282/img/" + "temp" + "\\" + originalFileName;
	}
	
	// 이미지 DB 저장
	@RequestMapping(value = "/insertFileInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public void insertFileInfo(String fileInfo, HttpServletRequest request) throws Exception {
		try {
			if(fileInfo != null) {
				HttpSession session = request.getSession();
				int member_num = (int) session.getAttribute("member_num");
				
				String[] filesInfo = fileInfo.split(",");
				 
				for(String info : filesInfo) {
				    String[] data = info.split("&&");
					ImageVO imageVO = new ImageVO();

					imageVO.setImage_sort("board");
					imageVO.setImage_file_original_name(data[1]);
					UUID uuid = UUID.randomUUID();
					imageVO.setImage_file_name(uuid.toString());
					imageVO.setMember_num(member_num);
					imageService.insertImage(imageVO);
				}
		  
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		  
	 }
	
		/*
		 * private void deleteFile(String fileName) { File file = new
		 * File(CURR_IMAGE_REPO_PATH + "\\" + fileName); try { file.delete(); } catch
		 * (Exception e) { e.printStackTrace(); } }
		 */

}
