package net.easycook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.easycook.vo.HotNewsBoardVO;

@Repository
public class HotNewsDAOImpl implements HotNewsDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertBoard(HotNewsBoardVO hvo) {
		this.sqlSession.insert("insert_hn",hvo);
	}

	@Override
	public int getTotalCount(HotNewsBoardVO hvo) {
		return this.sqlSession.selectOne("count",hvo);
	}

	@Override
	public List<HotNewsBoardVO> getBoardList(HotNewsBoardVO hvo) {
		return this.sqlSession.selectList("list_hn", hvo);
	}


	@Override
	public HotNewsBoardVO getBoardCont(int hno) {
		return this.sqlSession.selectOne("cont_hn", hno);
	}

	@Override
	public void updateHit(int hno) {
		this.sqlSession.update("hit_hn", hno);
	}

	@Override
	public List<HotNewsBoardVO> getBoardListView(HotNewsBoardVO hvo) {
		return this.sqlSession.selectList("list_hnv", hvo);
	}

	@Override
	public void editBoard(HotNewsBoardVO hvo) {
		this.sqlSession.update("edit_hn", hvo);
	}

	@Override
	public void delBoard(int hno) {
		this.sqlSession.delete("del_hn", hno);
	}
}
