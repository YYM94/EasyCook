package net.easycook.dao;

import java.util.List;

import net.easycook.vo.adminNoticeVO;

public interface adminNotDAO {

	int getListCount(adminNoticeVO an);

	List<adminNoticeVO> getNotList(adminNoticeVO an);

	void insertNot(adminNoticeVO an);

	void updateNot(adminNoticeVO an);

}
