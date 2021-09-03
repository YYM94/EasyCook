package net.easycook.dao;

import java.util.List;

import net.easycook.vo.RecipeBoardVO;

public interface RecipeBoardDAO {

	void writeRec(RecipeBoardVO rb);

	int getTotalPostings();

	List<RecipeBoardVO> getPostingList(RecipeBoardVO rb);

	void upVisiter(int post);

	RecipeBoardVO getPost(int post);

	void deletePost(int post);

}
