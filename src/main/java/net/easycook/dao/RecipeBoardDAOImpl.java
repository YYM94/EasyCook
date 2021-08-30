package net.easycook.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.easycook.vo.RecipeBoardVO;

@Repository
public class RecipeBoardDAOImpl implements RecipeBoardDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int writeRec(RecipeBoardVO rb) {
		return sqlSession.insert("ins_rb", rb);
	}
	
}
