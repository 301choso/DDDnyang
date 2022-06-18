package com.dddn.DDDnyang.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dddn.DDDnyang.member.MemberVO;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminmemberService {

	@Autowired
	AdminMemberDao memberDao;

	@Override
	public List<Map<String, Object>> selectMember(Map<String, Object> parameterMap) {
		return memberDao.selectMember(parameterMap);
	}
	

}