package com.dddn.DDDnyang.admin.reported;

import java.util.List;
import java.util.Map;

import com.dddn.DDDnyang.board.BoardVO;

public interface ReportedService {

	public int insertReport(Map<String, Object> map);
	public List<Map<String, Object>> reportList(Map<String, Object> parameterMap);
	public BoardVO reportedDetail(int board_id);
	public List<Map<String, Object>> reportedCount(int board_id);
}
