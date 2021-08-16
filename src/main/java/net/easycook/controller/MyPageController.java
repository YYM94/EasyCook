package net.easycook.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {

	@RequestMapping("/mypage_view")
	public String mypage_view(HttpServletRequest request,Model m) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		m.addAttribute("page",page);		
		return "MyPage/mypage_view";
	}
	
	@RequestMapping("/mypage")
	public ModelAndView mypage() {
		ModelAndView mp=new ModelAndView();
		mp.setViewName("MyPage/mypage");
		return mp;
	}
	
	@RequestMapping("/info_update")
	public ModelAndView info_update() {
		ModelAndView mp=new ModelAndView();
		mp.setViewName("MyPage/info_update");
		return mp;
	}

}