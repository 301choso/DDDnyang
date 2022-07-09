package com.dddn.DDDnyang.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("adminMemberDao")
public class AdminMemberDao {

	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> selectMember(Map<String, Object> parameterMap){
		return sqlSession.selectList("adminMember.selectMember", parameterMap);
	}
	
	public Map<String, Object> selectInfo(String member_id){
		return sqlSession.selectOne("adminMember.selectInfo", member_id);
	}
	
	public void updateInfo(Map<String, String> memberInfo) {
		sqlSession.update("adminMember.updateInfo", memberInfo);
	}
}
