package net.easycook.service;

import java.util.List;

import net.easycook.vo.FaqBoardVO;

public interface FaqService {

	int getListCount(FaqBoardVO fb);

	List<FaqBoardVO> getFaqList(FaqBoardVO fb);


}
