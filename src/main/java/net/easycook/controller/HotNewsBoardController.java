package net.easycook.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HotNewsBoardController { //일반게시판 관리자게시판 합쳐있음

	@RequestMapping("/hotNewsBoard_view")
	public String hotNewsBoard_view(HttpServletRequest request,Model m) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		m.addAttribute("page",page);		
		return "hotNewsBoard/hotNewsBoard_view";
	}//hotNewsBoard_view
	
	@RequestMapping("/admin_hotnews_list")
	public ModelAndView admin_hotnews_list() {
		ModelAndView am=new ModelAndView();
		am.setViewName("hotNewsBoard/admin_hotnews_list");
		return am;
	}//admin_hotNewsBoard_list()
	
	@RequestMapping("/admin_hotnews_input")
	public ModelAndView admin_hotnews_input() {
		ModelAndView am=new ModelAndView();
		am.setViewName("hotNewsBoard/admin_hotnews_input");
		return am;
	}//admin_hotNewsBoard_input()
	
	@RequestMapping("/admin_hotnews_edit")
	public ModelAndView admin_hotnews_edit() {
		ModelAndView am=new ModelAndView();
		am.setViewName("hotNewsBoard/admin_hotnews_edit");
		return am;
	}//admin_hotNewsBoard_edit()

}
