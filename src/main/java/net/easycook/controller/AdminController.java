package net.easycook.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	@GetMapping("/admin")
	public String admin(HttpServletRequest request, Model m) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		m.addAttribute("page", page);
		return "admin";
	}
	
	@RequestMapping("/admin_member_edit")
	public ModelAndView admin_member_edit() {
		ModelAndView m=new ModelAndView();
		m.setViewName("admin_member_edit");
		return m;
	}
}
