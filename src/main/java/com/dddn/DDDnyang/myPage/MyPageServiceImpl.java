package com.dddn.DDDnyang.myPage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dddn.DDDnyang.board.BoardVO;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDao myPageDao;

	@Override
	public List<BoardVO> getMyPost(int member_num) throws Exception {
		return myPageDao.getMyPost(member_num);
	}

	@Override
	public int doLikeBoard(LikeBoardVO likeBoardVO) throws Exception {
		return myPageDao.doLikeBoard(likeBoardVO);
	}

	@Override
	public int isLikeBoard(LikeBoardVO likeBoardVO) throws Exception {
		return myPageDao.isLikeBoard(likeBoardVO);
	}

	
	@Override
	public List<LikeBoardVO> getLikeBoardList(LikeBoardVO likeBoardVO) throws Exception {
		return myPageDao.getLikeBoardList(likeBoardVO);
	}

	@Override
	public void delLikeBoard(LikeBoardVO likeBoardVO) throws Exception {
		myPageDao.delLikeBoard(likeBoardVO);
	}

}
