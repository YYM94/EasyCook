package net.easycook.dao;

import net.easycook.vo.MemberVO;

public interface MemberDAO {

	void insertMember(MemberVO m);

	MemberVO loginCheck(String login_id_box);

	MemberVO idcheck(String id);

}
