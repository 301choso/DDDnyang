package com.dddn.DDDnyang.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	public List<BoardVO> listBoard(Map<String, Object> paramMap) throws Exception;

	public BoardVO boardDetail(int board_id) throws Exception;

	public int insertBoard(BoardVO boardVO) throws Exception;

	public int updateBoard(BoardVO boardVO) throws Exception;

	public int deleteBoard(BoardVO boardVO)  throws Exception;

}
