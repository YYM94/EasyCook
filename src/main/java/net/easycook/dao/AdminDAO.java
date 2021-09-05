package net.easycook.dao;

import java.util.List;

import net.easycook.vo.AdminVO;

public interface AdminDAO {

	AdminVO adminLogin(String admin_id);

	int getListCount(AdminVO ab);

	List<AdminVO> getAdminList(AdminVO ab);

}
