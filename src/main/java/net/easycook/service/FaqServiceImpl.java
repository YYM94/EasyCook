package net.easycook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.easycook.dao.FaqDAO;
import net.easycook.dao.adminFaqDAO;
import net.easycook.vo.FaqBoardVO;
import net.easycook.vo.adminFaqVO;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private adminFaqDAO adminfaqDAO;

	@Override
	public int getListCount(adminFaqVO fb) {
		return this.adminfaqDAO.getListCount(fb);
	}

	@Override
	public List<adminFaqVO> getFaqList(adminFaqVO fb) {
		return this.adminfaqDAO.getFaqList(fb);
	}





}
