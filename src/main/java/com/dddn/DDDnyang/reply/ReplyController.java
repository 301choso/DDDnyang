package com.dddn.DDDnyang.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller("replyController")
@RequestMapping(value = "/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	//리스트
	@RequestMapping(value = "/getListReply.do", method=RequestMethod.GET)	
	@ResponseBody
	public List<ReplyVO> getListReply(@RequestParam("board_id") int board_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("board_id", board_id);
		
		List<ReplyVO> replyList = replyService.listReply(paramMap);
		mav.addObject("replyList", replyList);
		return replyList;
	} 
	
	/*
	//수정화면 이동
	@RequestMapping(value = "/goUpdateDetail.do", method = RequestMethod.GET)
	public ModelAndView goUpdateDetail(@RequestParam("board_id") int board_id, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		ReplyVO boardInfo = replyService.boardDetail(board_id);
		
		mav.addObject("isInsUpd", "U");
		mav.addObject("boardInfo", boardInfo);
		mav.addObject("member_num",getMemberNum(request));
		mav.setViewName("board/write");
		return mav;
	}*/
	
	//입력하기
	@RequestMapping(value = "/insertReply.do", method = RequestMethod.POST)
	public ModelAndView insertReply(HttpServletRequest request, @ModelAttribute ReplyVO replyVO) throws Exception {
		ModelAndView mav = new ModelAndView();
			
		replyVO.setMember_num(getMemberNum(request));
		int result = replyService.insertReply(replyVO);
		
		mav.addObject("result", result);
		mav.setViewName("board/replyList");
		
		return mav;
	}
	
	//수정하기
	@RequestMapping(value = "/updateReply.do", method = RequestMethod.POST)
	public ModelAndView updatupdateReplyeBoard(HttpServletRequest request, @ModelAttribute ReplyVO replyVO) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		replyVO.setMember_num(getMemberNum(request));
		int result = replyService.updateReply(replyVO);
		
		mav.addObject("result", result);
		mav.setViewName("board/list");
		return mav;
	}
	
	//삭제하기
	@RequestMapping(value = "/deleteReply.do", method = RequestMethod.POST)
	public ModelAndView deleteReply(@ModelAttribute ReplyVO replyVO) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int result = replyService.deleteReply(replyVO);
		mav.addObject("result", result);
		mav.setViewName("board/list");
		return mav;
	}
	
	private int getMemberNum(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int memberNum = (session.getAttribute("member_num") == null) ? 0 : (int) session.getAttribute("member_num");
		return  memberNum;
	}
}
