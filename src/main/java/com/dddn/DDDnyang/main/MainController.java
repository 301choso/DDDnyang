package com.dddn.DDDnyang.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dddn.DDDnyang.board.BoardService;
import com.dddn.DDDnyang.board.BoardVO;

@Controller
public class MainController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/")
	public String mainPage() {
		return "main/main";
	}
	
	@RequestMapping(value = "main/main", method = RequestMethod.GET)
	public ModelAndView goMain() {
		ModelAndView mav = new ModelAndView();
		//최신글
		List<BoardVO> boardList = boardService.listBoard(new BoardVO());
		//공지사항
		
		mav.addObject("boardList", boardList);
		
		return mav;
	}
	
}
