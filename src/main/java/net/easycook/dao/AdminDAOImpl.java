package net.easycook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.easycook.vo.MemberVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getListCount(MemberVO m) {
		return this.sqlSession.selectOne("admin_count", m);
	} //검색전후 회원수

	@Override
	public List<MemberVO> getMemberList(MemberVO m) {
		return this.sqlSession.selectList("admin_list", m);
	} //검색전후 회원목록

	@Override
	public void editM(MemberVO m) {
		this.sqlSession.update("admin_edit", m);
	} //관리자페이지에서 회원정보수정


}
