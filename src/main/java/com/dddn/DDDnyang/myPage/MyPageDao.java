package com.dddn.DDDnyang.myPage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dddn.DDDnyang.board.BoardVO;

@Repository("myPageDao")
public class MyPageDao {

	@Autowired
	private SqlSession sqlSession;

	public List<BoardVO> getMyPost(int member_num) {
		return sqlSession.selectList("myPage.getMyPost", member_num);
	}
	
	
}
