package com.dddn.DDDnyang.board;

import java.util.List;

public interface BoardService {
	public List<BoardVO> listBoard(BoardVO boardVO) throws Exception;

	public BoardVO boardDetail(int board_id) throws Exception;

	public int insertBoard(BoardVO boardVO) throws Exception;

	public int updateBoard(BoardVO boardVO) throws Exception;

	public int deleteBoard(int board_id)  throws Exception;

}
