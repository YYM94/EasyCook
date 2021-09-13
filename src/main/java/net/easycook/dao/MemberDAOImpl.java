package net.easycook.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.easycook.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertMember(MemberVO m) {
		this.sqlSession.insert("m_in", m);
	} //회원저장

	@Override
	public MemberVO loginCheck(String login_id_box) {
		return this.sqlSession.selectOne("login_ck", login_id_box);
	} //로그인 인증

	@Override
	public MemberVO idcheck(String id) {
		return this.sqlSession.selectOne("m_check", id);
	} //아이디 중복검색
	
}
