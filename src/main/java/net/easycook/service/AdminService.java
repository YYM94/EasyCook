package net.easycook.service;

import java.util.List;

import net.easycook.vo.AdminVO;

public interface AdminService {

	AdminVO adminLogin(String admin_id);

	int getListCount(AdminVO ab);

	List<AdminVO> getAdminList(AdminVO ab);

}
