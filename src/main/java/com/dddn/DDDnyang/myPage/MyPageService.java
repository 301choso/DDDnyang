package com.dddn.DDDnyang.myPage;

import java.util.List;
import java.util.Map;

import com.dddn.DDDnyang.board.BoardVO;

public interface MyPageService {

	List<BoardVO> getMyPost(int member_num) throws Exception;

	int doLikeBoard(LikeBoardVO likeBoardVO) throws Exception;

	int isLikeBoard(LikeBoardVO likeBoardVO) throws Exception;
	
	List<LikeBoardVO> getLikeBoardList(LikeBoardVO likeBoardVO) throws Exception;

	void delLikeBoard(LikeBoardVO likeBoardVO) throws Exception;

}
