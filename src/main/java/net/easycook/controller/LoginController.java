package net.easycook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView m=new ModelAndView();
		m.setViewName("login");
		return m;
	}
	
	@RequestMapping("/join")
	public String join() throws Exception{
		return "join";
	}
}
