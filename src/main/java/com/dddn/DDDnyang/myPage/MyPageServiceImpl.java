package com.dddn.DDDnyang.myPage;

import java.util.List;

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
	
	
}
