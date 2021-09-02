package net.easycook.dao;

import java.util.List;

import net.easycook.vo.RecipeBoardVO;

public interface RecipeBoardDAO {

	void writeRec(RecipeBoardVO rb);

	int getTotalPostings();

	List<RecipeBoardVO> getPostingList(RecipeBoardVO rb);

}
