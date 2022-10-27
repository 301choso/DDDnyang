package com.dddn.DDDnyang.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dddn.DDDnyang.admin.notice.AdminNoticeService;
import com.dddn.DDDnyang.board.BoardService;
import com.dddn.DDDnyang.board.BoardVO;
import com.dddn.DDDnyang.image.ImageService;
import com.dddn.DDDnyang.image.ImageVO;

@Controller
public class MainController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private ImageService imageService;
	@Autowired
	private AdminNoticeService noticeService;
	 
	@RequestMapping(value="/")
	public String mainPage() {
		return "redirect:main/main";
	}
	
	@RequestMapping(value = "main/main", method = RequestMethod.GET)
	public ModelAndView goMain() throws Exception {
		ModelAndView mav = new ModelAndView();
		// 이미지 정보
		ImageVO imageVO = new ImageVO();
		imageVO.setImage_sort("board");
		List<ImageVO> imageList = imageService.getImageInfo(imageVO);
		mav.addObject("imageList", imageList);
		
		// 게시판 목록
		List<BoardVO> boardList = boardService.listBoard(new HashMap<String, Object>());		
		mav.addObject("boardList", boardList);
		
		// 공지사항 목록
		List<Map<String, Object>> noticeList = noticeService.noticeTop5();		
		mav.addObject("noticeList", noticeList);
		
		return mav;
	}
	
}
