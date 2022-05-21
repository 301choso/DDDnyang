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

}
