package net.easycook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.easycook.dao.RecipeBoardDAO;
import net.easycook.vo.RecipeBoardVO;

@Service
public class RecipeBoardServiceImpl implements RecipeBoardService {

	@Autowired
	private RecipeBoardDAO recipeBoardDao;

	@Override
	public void writeRec(RecipeBoardVO rb) {
		recipeBoardDao.writeRec(rb);
	}

	@Override
	public int getTotalPostings() {
		return recipeBoardDao.getTotalPostings();
	}

	@Override
	public List<RecipeBoardVO> getPostingList(RecipeBoardVO rb) {
		return recipeBoardDao.getPostingList(rb);
	}
	
}
