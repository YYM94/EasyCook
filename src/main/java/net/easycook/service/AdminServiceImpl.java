package net.easycook.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.easycook.dao.AdminDAO;
import net.easycook.vo.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;

	@Override
	public AdminVO adminloginCheck(String admin_id) {
		return this.adminDAO.adminloginCheck(admin_id);
	}


}
