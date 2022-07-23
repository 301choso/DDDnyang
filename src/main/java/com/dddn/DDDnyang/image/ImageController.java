package com.dddn.DDDnyang.image;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller("imageController")
@RequestMapping(value = "/image")
public class ImageController {

	@Autowired
	private ImageService imageService;

	private static final String CURR_IMAGE_REPO_PATH = "C:\\upload"; // 상대경로로 바꿀것
	// 첨부파일 업로드

	@RequestMapping(value = "/editor/upload.do", method = RequestMethod.POST)
	@ResponseBody
	public String summernoteUpload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String originalFileName = "";
		try {
			List<ImageVO> fileList = new ArrayList<ImageVO>();
			Iterator<String> fileNames = multipartRequest.getFileNames();

			while (fileNames.hasNext()) {
				ImageVO imageFileVO = new ImageVO();
				String fileName = fileNames.next();
				// ImageVO.setImage_file_sort(fileName);
				MultipartFile mFile = multipartRequest.getFile(fileName);
				originalFileName = mFile.getOriginalFilename();
				imageFileVO.setImage_file_name(originalFileName);
				fileList.add(imageFileVO);

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

	/*
	 * private void insertFiles() {
	 * 
	 * if(imageVO.getFileInfo() != null) {
	 * 
	 * ImageVO imageVO = new ImageVO(); for(String files :
	 * boardVO.getFileInfo().split(",")) {
	 * 
	 * String[] param = files.split("&&fileName="); imageVO.setBoard_id(1);//
	 * Integer.parseInt(request.getParameter("board_id"))
	 * imageVO.setImage_file_name(param[1]); imageVO.setMember_num(1);
	 * imageService.insertImage(imageVO);
	 * System.out.println("@@@@@@@@@@@@path : "+param[0]); }
	 * 
	 * }
	 * 
	 * 
	 * }
	 */
	private void deleteFile(String fileName) {
		File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
		try {
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
