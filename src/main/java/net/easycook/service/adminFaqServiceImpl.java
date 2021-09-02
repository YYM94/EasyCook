package net.easycook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.easycook.dao.adminFaqDAO;
import net.easycook.vo.adminFaqVO;

@Service
public class adminFaqServiceImpl implements adminFaqService {

	@Autowired 
	private adminFaqDAO adminfaqDAO;
	@Override
	public int getListCount(adminFaqVO af) {
		return this.adminfaqDAO.getListCount(af);
	}
	@Override
	public List<adminFaqVO> getFaqList(adminFaqVO af) {
		return this.adminfaqDAO.getFaqList(af);
	}

}
