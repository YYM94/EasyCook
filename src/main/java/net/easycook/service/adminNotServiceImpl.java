package net.easycook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.easycook.dao.adminNotDAO;
import net.easycook.vo.adminNoticeVO;

@Service
public class adminNotServiceImpl implements adminNotService {

	@Autowired
	private adminNotDAO adminnotDAO;
	@Override
	public int getListCount(adminNoticeVO an) {
		return this.adminnotDAO.getListCount(an);
	}
	@Override
	public List<adminNoticeVO> getNotList(adminNoticeVO an) {
		return this.adminnotDAO.getNotList(an);
	}

}
