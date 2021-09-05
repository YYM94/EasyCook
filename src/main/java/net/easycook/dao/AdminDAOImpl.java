package net.easycook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.easycook.vo.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public AdminVO adminLogin(String admin_id) {
		return this.sqlSession.selectOne("admin_login", admin_id);
	}

	@Override
	public int getListCount(AdminVO ab) {
		return this.sqlSession.selectOne("admin_co", ab);
	}

	@Override
	public List<AdminVO> getAdminList(AdminVO ab) {
		return this.sqlSession.selectList("admin_li", ab);
	}
}
