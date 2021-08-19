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
	public ModelAndView noticewrite() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("NoticeFaq/noticewrite");
		return mv;
	}
	
	@RequestMapping("/faqwrite")
	public ModelAndView faqwrite() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("NoticeFaq/faqwrite");
		return mv;
	}
	
	@RequestMapping("/faqEdit")
	public ModelAndView faqEdit() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("NoticeFaq/faqEdit");
		return mv;
	}
	
	@RequestMapping("/noticeEdit")
	public ModelAndView noticeEdit() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("NoticeFaq/noticeEdit");
		return mv;
	}
	
}
