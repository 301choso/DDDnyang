package com.dddn.DDDnyang.member;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class MemberDao {
	@Autowired
	private SqlSession sqlSession;

	public void joinMember(Map<String, String> map) {
		sqlSession.insert("member.joinMember", map);		
	}
	
	public int checkId(String member_id) {
		int cnt = sqlSession.selectOne("member.checkId", member_id);
		return cnt;
	}
}
