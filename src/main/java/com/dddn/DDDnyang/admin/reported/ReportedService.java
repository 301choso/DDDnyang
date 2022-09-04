package com.dddn.DDDnyang.admin.reported;

import java.util.List;
import java.util.Map;

public interface ReportedService {

	public int insertReport(Map<String, Object> map);
	public List<Map<String, Object>> reportList(Map<String, Object> parameterMap);
}
