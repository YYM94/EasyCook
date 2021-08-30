package net.easycook.dao;

import java.util.List;

import net.easycook.vo.FaqBoardVO;

public interface FaqDAO {

	int getListCount(FaqBoardVO fb);

	List<FaqBoardVO> getFaqList(FaqBoardVO fb);


}
