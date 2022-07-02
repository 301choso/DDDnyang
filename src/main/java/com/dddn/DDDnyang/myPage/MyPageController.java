package com.dddn.DDDnyang.myPage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dddn.DDDnyang.board.BoardVO;

@Controller("myPageController")
@RequestMapping(value = "/myPage")
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping(value = "/goMyPage.do", method=RequestMethod.GET)
	public ModelAndView goMyPage() throws Exception {
		ModelAndView mav = new ModelAndView();
		List<BoardVO> boardList = myPageService.getMyPost(1);
		mav.addObject("boardList",boardList);
		mav.setViewName("myPage/main");
		return mav;
	}
	
}
