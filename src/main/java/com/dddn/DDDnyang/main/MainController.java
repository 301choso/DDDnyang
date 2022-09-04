package com.dddn.DDDnyang.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
		List<BoardVO> boardList = boardService.listBoard(new BoardVO());		
		mav.addObject("boardList", boardList);
		
		return mav;
	}
	
}
