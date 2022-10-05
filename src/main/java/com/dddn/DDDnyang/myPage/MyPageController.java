package com.dddn.DDDnyang.myPage;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dddn.DDDnyang.board.BoardService;
import com.dddn.DDDnyang.board.BoardVO;
import com.dddn.DDDnyang.image.ImageService;
import com.dddn.DDDnyang.image.ImageVO;

@Controller("myPageController")
@RequestMapping(value = "/myPage")
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ImageService imageService;
	
	@RequestMapping(value = "/goMyPage.do", method=RequestMethod.GET)
	public ModelAndView goMyPage(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		int member_num = (session.getAttribute("member_num") == null) ? 0 : (int) session.getAttribute("member_num");
		
		//작성글 조회
		List<BoardVO> boardList = myPageService.getMyPost(member_num);
		mav.addObject("boardList", boardList);
		
		//작성글 속 이미지 조회
		List<ImageVO> imageList = new ArrayList<>();
		if(boardList != null && !boardList.isEmpty()) {
			for(int i=0; i<boardList.size(); i++) {
				ImageVO imageVO = new ImageVO();
				imageVO.setBoard_id(boardList.get(i).getBoard_id());
				List<ImageVO> list = imageService.getImageInfo(imageVO);
				imageList.addAll(list);
			}
		}
		mav.addObject("imageList", imageList);
		
		//좋아요 한 글 조회
		List<LikeBoardVO> likeList = getLikeBoardList(request);
		List<BoardVO> likeBoardList = new ArrayList<BoardVO>();
		if(likeList.size() > 0) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			List<Integer> boardIdList = new ArrayList<Integer>();
			for(int j=0; j<likeList.size(); j++) {
				boardIdList.add(likeList.get(j).getBoard_id());
			}
			paramMap.put("boardIdList", boardIdList);
			likeBoardList = boardService.listBoard(paramMap);

		}
		
		mav.addObject("likeboardList", likeBoardList);
		
		mav.setViewName("myPage/main");
		
		return mav;
	}
	
	@RequestMapping(value = "/doLikeBoard.do", method=RequestMethod.GET)
	@ResponseBody
	public void doLikeBoard(@ModelAttribute LikeBoardVO likeBoardVO, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		int member_num = (session.getAttribute("member_num") == null) ? 0 : (int) session.getAttribute("member_num");
		likeBoardVO.setMember_num(member_num);
		
		try {
			myPageService.doLikeBoard(likeBoardVO);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/isLikeBoard.do", method=RequestMethod.GET)
	@ResponseBody
	public int isLikeBoard(@ModelAttribute LikeBoardVO likeBoardVO, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		int member_num = (session.getAttribute("member_num") == null) ? 0 : (int) session.getAttribute("member_num");
		likeBoardVO.setMember_num(member_num);
		
		return myPageService.isLikeBoard(likeBoardVO);	
	}
	
	
	public List<LikeBoardVO> getLikeBoardList(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		int member_num = (session.getAttribute("member_num") == null) ? 0 : (int) session.getAttribute("member_num");
		
		LikeBoardVO likeBoardVO = new LikeBoardVO();
		likeBoardVO.setMember_num(member_num);
		
		return myPageService.getLikeBoardList(likeBoardVO);
	}
	
	@RequestMapping(value = "/delLikeBoard.do", method=RequestMethod.GET)
	@ResponseBody
	public void deleteLikeBoard(@ModelAttribute LikeBoardVO likeBoardVO, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		int member_num = (session.getAttribute("member_num") == null) ? 0 : (int) session.getAttribute("member_num");
		likeBoardVO.setMember_num(member_num);
		
		myPageService.delLikeBoard(likeBoardVO);	
	}
	
}
