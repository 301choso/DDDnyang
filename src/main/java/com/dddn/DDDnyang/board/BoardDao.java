package com.dddn.DDDnyang.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("boardDao")
public class BoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardVO> listBoard(Map<String, Object> paramMap) throws DataAccessException {		
		return sqlSession.selectList("board.listBoard",paramMap);
	}

	public BoardVO boardDetail(int board_id) throws DataAccessException {
		return (BoardVO) sqlSession.selectOne("board.boardDetail", board_id);
	}

	public int insertBoard(BoardVO boardVO) throws DataAccessException {
		return sqlSession.insert("board.insertBoard", boardVO);
	}

	public int updateBoard(BoardVO boardVO) throws DataAccessException {
		return sqlSession.update("board.updateBoard", boardVO);
	}

	public int deleteBoard(BoardVO boardVO) throws DataAccessException {
		return sqlSession.update("board.deleteBoard", boardVO);
	}

	public void doBoardViewCntUpdate(int board_id) {
		sqlSession.update("board.doBoardViewCntUpdate", board_id);
	}
	
}
