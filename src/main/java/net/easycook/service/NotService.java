package net.easycook.service;

import java.util.List;

import net.easycook.vo.NoticeBoardVO;

public interface NotService {

	List<NoticeBoardVO> getNotList(NoticeBoardVO nb);

	int getListCount(NoticeBoardVO nb);

}
