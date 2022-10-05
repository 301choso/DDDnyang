package com.dddn.DDDnyang.admin.reported;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dddn.DDDnyang.board.BoardVO;

@Service("reportedService")
public class ReportedServiceImpl implements ReportedService {
	
	@Autowired
	ReportedDao reportedDao;

	@Override
	public int insertReport(Map<String, Object> map) {
		return reportedDao.insertReport(map);
	}

	@Override
	public List<Map<String, Object>> reportList(Map<String, Object> parameterMap) {
		return reportedDao.reportList(parameterMap);
	}

	@Override
	public BoardVO reportedDetail(int board_id) {
		return reportedDao.reportDetail(board_id);
	}

	@Override
	public List<Map<String, Object>> reportedCount(int board_id) {
		return reportedDao.reportedCount(board_id);
	}

	@Override
	public int blockContent(Map<String, Object> map) {
		return  reportedDao.blockContent(map);
	}

}
