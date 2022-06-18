package com.dddn.DDDnyang.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("boardDao")
public class BoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardVO> listBoard(BoardVO boardVO) throws DataAccessException {		
		return sqlSession.selectList("board.listBoard");
	}

	public BoardVO boardDetail(int board_id) throws DataAccessException {
		return (BoardVO) sqlSession.selectOne("board.boardDetail", board_id);
	}

	public int insertBoard(BoardVO boardVO) throws DataAccessException {
		return sqlSession.insert("board.insertBoard", boardVO);
	}

	public int updateBoard(BoardVO boardVO) throws DataAccessException {
		return sqlSession.update("board.insertBoard", boardVO);
	}

	public int deleteBoard(int board_id) throws DataAccessException {
		return sqlSession.update("board.deleteBoard", board_id);
	}
	
}
