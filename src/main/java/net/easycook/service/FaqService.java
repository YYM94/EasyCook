package net.easycook.service;

import java.util.List;

import net.easycook.vo.FaqBoardVO;
import net.easycook.vo.adminFaqVO;

public interface FaqService {

	int getListCount(adminFaqVO af);

	List<adminFaqVO> getFaqList(adminFaqVO af);


}
