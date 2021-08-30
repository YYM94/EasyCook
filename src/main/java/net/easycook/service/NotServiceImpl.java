package net.easycook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.easycook.dao.NotDAO;
import net.easycook.vo.NoticeBoardVO;

@Service
public class NotServiceImpl implements NotService {

	@Autowired
	private NotDAO notDAO;
	

	@Override
	public List<NoticeBoardVO> getNotList(NoticeBoardVO nb) {
		return this.notDAO.getNotList(nb);
	}


	@Override
	public int getListCount(NoticeBoardVO nb) {
		return this.notDAO.getListCount(nb);
	}




}
