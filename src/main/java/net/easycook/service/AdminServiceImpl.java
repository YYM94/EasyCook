package net.easycook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.easycook.dao.AdminDAO;
import net.easycook.vo.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;

	@Override
	public AdminVO adminLogin(String admin_id) {
		return this.adminDAO.adminLogin(admin_id);
	}

	@Override
	public int getListCount(AdminVO ab) {
		return this.adminDAO.getListCount(ab);
	}

	@Override
	public List<AdminVO> getAdminList(AdminVO ab) {
		return this.adminDAO.getAdminList(ab);
	}
}
