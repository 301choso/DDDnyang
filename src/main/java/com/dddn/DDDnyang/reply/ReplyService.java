package com.dddn.DDDnyang.reply;

import java.util.List;
import java.util.Map;

public interface ReplyService {
	public List<ReplyVO> listReply(Map<String, Object> paramMap) throws Exception;

	public int insertReply(ReplyVO replyVO) throws Exception;

	public int updateReply(ReplyVO replyVO) throws Exception;

	public int deleteReply(ReplyVO replyVO)  throws Exception;

}
