package net.easycook.dao;

import java.util.List;

import net.easycook.vo.MemberVO;

public interface MemberDAO {

	void insertMember(MemberVO m);

	MemberVO loginCheck(String login_id_box);

	MemberVO idcheck(String id);
	
	void editMember(MemberVO m);
	
	MemberVO getMember(String id);
	
	void delMem(MemberVO dm);

	List<MemberVO> id_find(MemberVO m);



}
