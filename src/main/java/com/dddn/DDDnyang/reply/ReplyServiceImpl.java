package com.dddn.DDDnyang.reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDao replyDao;
	
	@Override
	public List<ReplyVO> listReply(Map<String, Object> paramMap) {
		return replyDao.listReply(paramMap);
	}

	@Override
	public int insertReply(ReplyVO replyVO) {
		return replyDao.insertReply(replyVO);
	}

	@Override
	public int updateReply(ReplyVO replyVO) throws Exception {
		return replyDao.updateReply(replyVO);
	}

	@Override
	public int deleteReply(ReplyVO boardVO) throws Exception {
		return replyDao.deleteReply(boardVO);
	}

}
