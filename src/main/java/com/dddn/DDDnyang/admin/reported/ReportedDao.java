package com.dddn.DDDnyang.admin.reported;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
