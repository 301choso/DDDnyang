package com.dddn.DDDnyang.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;
	
	@Override
	public void joinMember(Map<String, String> map) {
		memberDao.joinMember(map);
	}

	@Override
	public int checkId(String member_id) {
		return memberDao.checkId(member_id);
	}

	@Override
	public Map<String, String> checkLogin(Map<String, String> map) {
		return memberDao.loginCheck(map);
	}

}
