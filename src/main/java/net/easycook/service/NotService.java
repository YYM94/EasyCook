package net.easycook.service;

import java.util.List;

import net.easycook.vo.NoticeBoardVO;
import net.easycook.vo.adminNoticeVO;

public interface NotService {

	List<adminNoticeVO> getNotList(adminNoticeVO an);

	int getListCount(adminNoticeVO an);

}
