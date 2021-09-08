package net.easycook.service;

import java.util.List;

import net.easycook.vo.adminNoticeVO;

public interface adminNotService {

	int getListCount(adminNoticeVO an);

	List<adminNoticeVO> getNotList(adminNoticeVO an);

	void insertNot(adminNoticeVO an);

	void updateNot(adminNoticeVO an);

}
