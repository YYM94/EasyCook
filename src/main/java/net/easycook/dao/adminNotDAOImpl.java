package net.easycook.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.easycook.vo.adminNoticeVO;

@Repository
public class adminNotDAOImpl implements adminNotDAO {

	@Inject
	private SqlSession sqlSession;
	@Override
	public int getListCount(adminNoticeVO an) {
		return this.sqlSession.selectOne("adnot_count",an);
	}
	@Override
	public List<adminNoticeVO> getNotList(adminNoticeVO an) {
		return this.sqlSession.selectList("adnot_list",an);
	}

}
