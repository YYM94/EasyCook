package net.easycook.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public ModelAndView noticewrite(Model m, HttpServletResponse response, HttpServletRequest request) 
		throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String /=(String)session.getAttribute("/");
		if(/==null) {
			out.println("<script>");
			out.println("alert('다시 로그인하세요');");
			out.println("location='/'");
			out.println("</script>");
		}else {
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			m.addAttribute("page", page);
			ModelAndView mv = new ModelAndView("NoticeFaq/noticewrite");
			return mv;
		}
		return null;
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
