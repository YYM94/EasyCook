package net.easycook.service;

import java.util.List;

import net.easycook.vo.adminFaqVO;

public interface adminFaqService {

	int getListCount(adminFaqVO af);

	List<adminFaqVO> getFaqList(adminFaqVO af);

}
