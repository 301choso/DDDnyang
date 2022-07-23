package com.dddn.DDDnyang.admin.member;

import java.util.List;
import java.util.Map;

public interface AdminmemberService {
	public List<Map<String, Object>> selectMember(Map<String, Object> parameterMap);
	public Map<String, Object> selectInfo(String member_id);
	public void updateInfo(Map<String, String> parameterMap);}
