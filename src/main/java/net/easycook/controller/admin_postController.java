package net.easycook.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class admin_postController {
	
	@RequestMapping("/admin_post_list")
	public String admin_post_list(HttpServletRequest request,Model m) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		m.addAttribute("page",page);		
		return "admin_post/admin_post_list";
	}
	
	@RequestMapping("/admin_post_management")
	public ModelAndView admin_post_management() {
		ModelAndView ap=new ModelAndView();
		ap.setViewName("admin_post/admin_post_management");
		return ap;
	}
}
