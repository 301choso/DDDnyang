package com.dddn.DDDnyang.admin.notice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminNoticeDao")
public class AdminNoticeDao {

	@Autowired
	SqlSession sqlSession;
	
	public int insertNotice(Map<String, Object> paraMap) {
		int count;
		count = sqlSession.insert("adminnotice.insertNotice", paraMap);
		return count;
	}
	
	public List<Map<String, Object>> noticeList(){
		return sqlSession.selectList("adminnotice.noticeList");
	}
	
	public List<Map<String, Object>> noticeTop5(){
		return sqlSession.selectList("adminnotice.noticeTop5");
	}
	
	public Map<String, Object> noticeDetail(int notice_id){
		return sqlSession.selectOne("adminnotice.noticeDetail", notice_id);
	}
}
