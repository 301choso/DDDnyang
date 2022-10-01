package com.dddn.DDDnyang.admin.reported;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dddn.DDDnyang.board.BoardVO;

@Repository("reportedDao")
public class ReportedDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertReport(Map<String, Object> map) {
		return sqlSession.insert("report.insertReport", map);
	}
	
	public List<Map<String, Object>> reportList(Map<String, Object> parameterMap){
		return sqlSession.selectList("report.reportedList", parameterMap);
	}
	
	public BoardVO reportDetail(int board_id){
		return (BoardVO) sqlSession.selectOne("report.reportedDetail", board_id);
	}
	
	public List<Map<String, Object>> reportedCount(int board_id){
		return sqlSession.selectList("report.reportedCount", board_id);
	}
	
	public int blockContent(Map<String, Object> parameterMap) {
		return sqlSession.update("report.updateShowYn", parameterMap);
	}

}
