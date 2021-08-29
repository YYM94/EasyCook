package net.easycook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.easycook.dao.FaqDAO;
import net.easycook.vo.FaqBoardVO;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private FaqDAO faqDAO;

	@Override
	public int getListCount(FaqBoardVO fb) {
		return this.faqDAO.getListCount(fb);
	}

	@Override
	public List<FaqBoardVO> getFaqList(FaqBoardVO fb) {
		return this.faqDAO.getFaqList(fb);
	}





}
