package net.easycook.service;

import java.util.List;

import net.easycook.vo.HotNewsBoardVO;

public interface HotNewsService {

	void insertBoard(HotNewsBoardVO hvo);

	int getTotalCount();

	List<HotNewsBoardVO> getBoardList(HotNewsBoardVO hvo);

	HotNewsBoardVO getBoardCont(int hno);

	HotNewsBoardVO getBoardCont2(int hno);

	List<HotNewsBoardVO> getBoardListView(HotNewsBoardVO hvo);

}
