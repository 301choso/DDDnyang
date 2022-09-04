package com.dddn.DDDnyang.admin.reported;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("reportedService")
public class ReportedServiceImpl implements ReportedService {
	
	@Autowired
	ReportedDao reportedDao;

	@Override
	public int insertReport(Map<String, Object> map) {
		return reportedDao.insertReport(map);
	}

	@Override
	public List<Map<String, Object>> reportList(Map<String, Object> parameterMap) {
		return reportedDao.reportList(parameterMap);
	}

}
