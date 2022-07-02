package com.dddn.DDDnyang.myPage;

import java.util.List;

import com.dddn.DDDnyang.board.BoardVO;

public interface MyPageService {

	List<BoardVO> getMyPost(int member_num) throws Exception;

}
