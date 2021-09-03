package net.easycook.service;

import java.util.List;

import net.easycook.vo.RecipeBoardVO;

public interface RecipeBoardService {

	void writeRec(RecipeBoardVO rb);

	int getTotalPostings();

	List<RecipeBoardVO> getPostingList(RecipeBoardVO rb, int post);

	RecipeBoardVO getPost(int post);

	void deletePost(int post);

}
