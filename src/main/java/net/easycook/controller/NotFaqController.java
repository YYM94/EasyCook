package net.easycook.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NotFaqController {

	/*@RequestMapping(value="/NoticeFaq/Notice")
	public String Notice() throws Exception {
		return "/NoticeFaq/Notice";*/
	@RequestMapping("/Notice")
	public String Notice(HttpServletRequest request,Model wm) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		wm.addAttribute("page",page);		
		return "NoticeFaq/Notice";
	
	}
	
	@RequestMapping("/FAQ")
	public String FAQ(HttpServletRequest request,Model wm) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		wm.addAttribute("page",page);		
		return "NoticeFaq/FAQ";
	
	}
	@RequestMapping("/adminnotice")
	public String adminnotice(HttpServletRequest request,Model wm) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		wm.addAttribute("page",page);		
		return "NoticeFaq/adminnotice";
	
	}
	@RequestMapping("/adminfaq")
	public String adminfaq(HttpServletRequest request,Model wm) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		wm.addAttribute("page",page);		
		return "NoticeFaq/adminfaq";
		
	}
	@RequestMapping("/noticewrite")
	public String noticewrite() throws Exception{
		return "NoticeFaq/noticewrite";
	}
	
	@RequestMapping("/faqwrite")
	public String faqwrite() throws Exception{
		return "NoticeFaq/faqwrite";
	}
	
	@RequestMapping("/faqEdit")
	public String faqEdit() throws Exception{
		return "NoticeFaq/faqEdit";
	}
	
	@RequestMapping("/noticeEdit")
	public String noticeEdit() throws Exception{
		return "NoticeFaq/noticeEdit";
	}
	
}
