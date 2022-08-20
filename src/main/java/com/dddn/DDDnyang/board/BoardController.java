package com.dddn.DDDnyang.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dddn.DDDnyang.image.ImageService;
import com.dddn.DDDnyang.image.ImageVO;

@Controller("boardController")
@RequestMapping(value = "/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ImageService imageService;
	
	//리스트
	@RequestMapping(value = "/goBoard.do", method=RequestMethod.GET)	
	public ModelAndView goBoard() throws Exception {
		ModelAndView mav = new ModelAndView();

		List<BoardVO> boardList = boardService.listBoard(new BoardVO());
		mav.addObject("boardList", boardList);
		mav.setViewName("board/list");
		return mav;
	} 
	//단일 게시물
	@RequestMapping(value = "/goView.do", method=RequestMethod.GET)	
	public ModelAndView goView(@RequestParam("board_id") int board_id, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();

		BoardVO boardInfo = boardService.boardDetail(board_id);
		mav.addObject("boardInfo", boardInfo);
		mav.addObject("member_num",getMemberNum(request));
		mav.setViewName("board/view");
		
		return mav;
	} 
	
	//입력화면 이동
	@RequestMapping(value = "/goInsertDetail.do", method=RequestMethod.GET)	
	public ModelAndView goInsertDetail() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("isInsUpd", "I");
		mav.setViewName("board/write");
		return mav;
	} 
	
	//수정화면 이동
	@RequestMapping(value = "/goUpdateDetail.do", method = RequestMethod.GET)
	public ModelAndView goUpdateDetail(@RequestParam("board_id") int board_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		BoardVO boardInfo = boardService.boardDetail(board_id);
		
		mav.addObject("isInsUpd", "U");
		mav.addObject("boardInfo", boardInfo);
		mav.setViewName("board/write");
		return mav;
	}
	
	//입력하기
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
	public ModelAndView insertBoard(HttpServletRequest request, @ModelAttribute BoardVO boardVO) throws Exception {
		ModelAndView mav = new ModelAndView();
			
		boardVO.setMember_num(getMemberNum(request));
		int result = boardService.insertBoard(boardVO);
		
		mav.addObject("result", result);
		mav.setViewName("board/list");
		
		return mav;
	}
	
	//수정하기
	@RequestMapping(value = "/updateBoard.do", method = RequestMethod.POST)
	public ModelAndView updateBoard(HttpServletRequest request, @ModelAttribute BoardVO boardVO) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		boardVO.setMember_num(getMemberNum(request));
		int result = boardService.updateBoard(boardVO);
		
		mav.addObject("result", result);
		mav.setViewName("board/list");
		return mav;
	}
	
	//삭제하기
	@RequestMapping(value = "/deleteBoard.do", method = RequestMethod.POST)
	public ModelAndView deleteBoard(@ModelAttribute BoardVO boardVO) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int result = boardService.deleteBoard(boardVO);
		mav.addObject("result", result);
		mav.setViewName("board/list");
		return mav;
	}
	
	private int getMemberNum(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return (int) session.getAttribute("member_num");
	}
}
