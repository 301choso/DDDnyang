package com.dddn.DDDnyang.reply;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("replyDao")
public class ReplyDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<ReplyVO> listReply(Map<String, Object> paramMap) throws DataAccessException {		
		return sqlSession.selectList("reply.listReply",paramMap);
	}

	public int insertReply(ReplyVO replyVO) throws DataAccessException {
		return sqlSession.insert("reply.insertReply", replyVO);
	}

	public int updateReply(ReplyVO replyVO) throws DataAccessException {
		return sqlSession.update("reply.updateReply", replyVO);
	}

	public int deleteReply(ReplyVO replyVO) throws DataAccessException {
		return sqlSession.update("reply.deleteReply", replyVO);
	}

	
}
