package net.easycook.dao;

import java.util.List;

import net.easycook.vo.adminFaqVO;

public interface adminFaqDAO {

	int getListCount(adminFaqVO af);

	List<adminFaqVO> getFaqList(adminFaqVO af);

}
