package com.dddn.DDDnyang.admin.notice;

import java.util.List;
import java.util.Map;

public interface AdminNoticeService {

	public int insertNotice(Map<String, Object> paraMap);
	public List<Map<String, Object>> noticeList();
	public List<Map<String, Object>> noticeTop5();
	public Map<String, Object> noticeDetail(int notice_id);
}
