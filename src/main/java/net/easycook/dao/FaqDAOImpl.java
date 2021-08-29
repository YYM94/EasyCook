package net.easycook.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.easycook.vo.FaqBoardVO;

@Repository
public class FaqDAOImpl implements FaqDAO {
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public int getListCount(FaqBoardVO fb) {
		return this.sqlSession.selectOne("Faq_co",fb);
	}

	@Override
	public List<FaqBoardVO> getFaqList(FaqBoardVO fb) {
		return this.sqlSession.selectList("Faq_li",fb);
	}



}
