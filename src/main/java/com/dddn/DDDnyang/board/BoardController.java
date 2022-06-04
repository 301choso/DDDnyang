package com.dddn.DDDnyang.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller("boardController")
@RequestMapping(value = "/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/goBoard.do", method=RequestMethod.GET)	
	public ModelAndView goBoard() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/boardMain");
		return mav;
	} 
	
	
	@RequestMapping(value = "/boardDetail.do", method = RequestMethod.GET)
	public ModelAndView goBoardDetail(@RequestParam("board_id") int board_id) {
		ModelAndView mav = new ModelAndView();
		
		BoardVO boardInfo = boardService.boardDetail(board_id);		
		mav.addObject("boardInfo", boardInfo);
		
		return mav;
	}
	
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.GET)
	public ModelAndView insertBoard(@ModelAttribute BoardVO boardVO) {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
}
