package net.easycook.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.easycook.vo.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public AdminVO adminloginCheck(String admin_id) {
		return this.sqlSession.selectOne("admin_login", admin_id);
	}


}
