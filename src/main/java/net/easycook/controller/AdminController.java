package net.easycook.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import net.easycook.service.AdminService;
import net.easycook.vo.AdminVO;
import pwdconv.PwdChange;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	//관리자 페이지
	@GetMapping("/admin")
	public ModelAndView admin() {
		ModelAndView am=new ModelAndView();
		am.setViewName("admin");
		return am;
	}
	
	//관리자 정보 저장
	@PostMapping("/admin_login_ok")
	public String admin_login_ok(HttpServletResponse response, HttpServletRequest request, HttpSession session, AdminVO ab) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		return null;
	}
	
}
