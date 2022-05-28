package com.dddn.DDDnyang.member;

import java.util.Map;

public interface MemberService {
	public void joinMember(Map<String, String> map);
	public int checkId(String member_id);
}
