package com.dddn.DDDnyang.myPage;

import java.util.List;

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

import com.dddn.DDDnyang.board.BoardVO;

@Controller("myPageController")
@RequestMapping(value = "/myPage")
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping(value = "/goMyPage.do", method=RequestMethod.GET)
	public ModelAndView goMyPage(@RequestParam("member_num") int member_num) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<BoardVO> boardList = myPageService.getMyPost(member_num);
		mav.addObject("boardList",boardList);
		mav.setViewName("myPage/main");
		
		return mav;
	}
	
	@RequestMapping(value = "/doMarkBoard.do", method=RequestMethod.GET)
	@ResponseBody
	public String doMarkBoard(@ModelAttribute MyPageBookMarkVO myPageBookMarkVO, HttpServletRequest request) throws Exception {
		String message = "";
		HttpSession session = request.getSession();
		int memberNum = (session.getAttribute("member_num") == null) ? 0 : (int) session.getAttribute("member_num");
		myPageBookMarkVO.setMember_num(memberNum);
		
		try {
			int result = myPageService.doMarkBoard(myPageBookMarkVO);
			if(result == 1) message = "성공";
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return message;
	}
	
}
