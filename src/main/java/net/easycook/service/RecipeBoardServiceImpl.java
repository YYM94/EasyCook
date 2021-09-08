package net.easycook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	@Transactional
	public List<RecipeBoardVO> getPostingList(RecipeBoardVO rb, int post) {
		if(post != 0) {
			recipeBoardDao.upVisiter(post);
		}
		return recipeBoardDao.getPostingList(rb);
	}

	@Override
	public RecipeBoardVO getPost(int post) {
		return recipeBoardDao.getPost(post);
	}

	@Override
	public void deletePost(int post) {
		recipeBoardDao.deletePost(post);
	}

	@Override
	public void editPost(RecipeBoardVO rbv) {
		recipeBoardDao.editPost(rbv);
	}
	
}
