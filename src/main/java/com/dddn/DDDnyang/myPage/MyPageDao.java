package com.dddn.DDDnyang.myPage;

import java.util.List;
import java.util.Map;

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

	public int doLikeBoard(LikeBoardVO likeBoardVO) {
		return sqlSession.insert("myPage.doLikeBoard", likeBoardVO);
	}

	public int isLikeBoard(LikeBoardVO likeBoardVO) {
		return sqlSession.selectOne("myPage.isLikeBoard", likeBoardVO);
	}
	
	public List<LikeBoardVO> getLikeBoardList(LikeBoardVO likeBoardVO) {
		return sqlSession.selectList("myPage.getLikeBoardList", likeBoardVO);
	}

	public void delLikeBoard(LikeBoardVO likeBoardVO) {
		sqlSession.selectOne("myPage.delLikeBoard", likeBoardVO);
	}
	
}
