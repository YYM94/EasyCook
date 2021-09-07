package net.easycook.dao;

import java.util.List;

import net.easycook.vo.FaqBoardVO;
import net.easycook.vo.adminFaqVO;

public interface FaqDAO {

	int getListCount(adminFaqVO af);

	List<adminFaqVO> getFaqList(adminFaqVO af);


}
