package net.easycook.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.easycook.vo.adminFaqVO;

@Repository
public class adminFaqDAOImpl implements adminFaqDAO {

	@Inject
	private SqlSession sqlSession;
	@Override
	public int getListCount(adminFaqVO af) {
		return this.sqlSession.selectOne("adfaq_count",af);
	}
	@Override
	public List<adminFaqVO> getFaqList(adminFaqVO af) {
		return this.sqlSession.selectList("adfaq_list",af);
	}
	@Override
	public void insertFaq(adminFaqVO af) {
		this.sqlSession.insert("adfaq_in",af);
		
	}

}
