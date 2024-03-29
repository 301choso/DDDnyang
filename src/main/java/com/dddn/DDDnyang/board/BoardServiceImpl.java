package com.dddn.DDDnyang.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<BoardVO> listBoard(Map<String, Object> paramMap) {
		return boardDao.listBoard(paramMap);
	}

	@Override
	public BoardVO boardDetail(int board_id) {
		boardDao.doBoardViewCntUpdate(board_id);
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
	public int deleteBoard(BoardVO boardVO) throws Exception {
		return boardDao.deleteBoard(boardVO);
	}

}
