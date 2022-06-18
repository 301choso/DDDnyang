package com.dddn.DDDnyang.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<BoardVO> listBoard(BoardVO boardVO) {		
		return boardDao.listBoard(boardVO);
	}

	@Override
	public BoardVO boardDetail(int board_id) {
		return boardDao.boardDetail(board_id);
	}

	@Override
	public int insertBoard(BoardVO boardVO) {
		return boardDao.insertBoard(boardVO);
	}

	@Override
	public int updateBoard(BoardVO boardVO) throws Exception {
		return boardDao.updateBoard(boardVO);
	}

	@Override
	public int deleteBoard(int board_id) throws Exception {
		return boardDao.deleteBoard(board_id);
	}

}
