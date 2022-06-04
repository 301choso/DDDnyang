package com.dddn.DDDnyang.board;

import java.util.List;

public interface BoardService {
	public List<BoardVO> listBoard(BoardVO boardVO);

	public BoardVO boardDetail(int board_id);
}
