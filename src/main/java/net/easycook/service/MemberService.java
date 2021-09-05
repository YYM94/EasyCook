package net.easycook.service;

import net.easycook.vo.MemberVO;

public interface MemberService {

	void insertMember(MemberVO m);

	MemberVO loginCheck(String login_id_box);

}
