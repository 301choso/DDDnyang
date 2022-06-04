package com.dddn.DDDnyang.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("boardDao")
public class BoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardVO> listBoard(BoardVO boardVO) {		
		return sqlSession.selectList("board.listBoard");
	}

	public BoardVO boardDetail(int board_id) {
		return (BoardVO) sqlSession.selectOne("board.boardDetail", board_id);
	}
	
}
