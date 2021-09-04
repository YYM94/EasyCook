package net.easycook.dao;

import java.util.List;

import net.easycook.vo.HotNewsBoardVO;

public interface HotNewsDAO {

	void insertBoard(HotNewsBoardVO hvo);

	int getTotalCount();

	List<HotNewsBoardVO> getBoardList(HotNewsBoardVO hvo);


	HotNewsBoardVO getBoardCont(int hno);

	void updateHit(int hno);

}
