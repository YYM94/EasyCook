package net.easycook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.easycook.vo.RecipeBoardVO;

@Repository
public class RecipeBoardDAOImpl implements RecipeBoardDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void writeRec(RecipeBoardVO rb) {
		sqlSession.insert("ins_rb", rb);
	}

	@Override
	public int getTotalPostings() {
		return sqlSession.selectOne("get_total");
	}

	@Override
	public List<RecipeBoardVO> getPostingList(RecipeBoardVO rb) {
		return sqlSession.selectList("get_rb_list", rb);
	}
	
}
