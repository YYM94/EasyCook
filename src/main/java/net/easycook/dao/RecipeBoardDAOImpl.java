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
	public int getTotalPostings(String searchText) {
		return sqlSession.selectOne("get_total", searchText);
	}

	@Override
	public List<RecipeBoardVO> getPostingList(RecipeBoardVO rb) {
		return sqlSession.selectList("get_rb_list", rb);
	}

	@Override
	public void upVisiter(int post) {
		sqlSession.update("upVis", post);
	}

	@Override
	public RecipeBoardVO getPost(int post) {
		return sqlSession.selectOne("get_Post", post);
	}

	@Override
	public void deletePost(int post) {
		sqlSession.delete("del_post", post);
	}

	@Override
	public void editPost(RecipeBoardVO rbv) {
		sqlSession.update("edit_post", rbv);
	}
	
}
