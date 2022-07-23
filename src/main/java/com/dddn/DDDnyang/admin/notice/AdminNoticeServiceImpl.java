package com.dddn.DDDnyang.admin.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminNoticeService")
public class AdminNoticeServiceImpl implements AdminNoticeService {

	@Autowired
	AdminNoticeDao adminNoticeDao;
	
	@Override
	public int insertNotice(Map<String, Object> paraMap) {
		return adminNoticeDao.insertNotice(paraMap);
	}

	@Override
	public List<Map<String, Object>> noticeList() {
		return adminNoticeDao.noticeList();
	}

}
