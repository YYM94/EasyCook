package net.easycook.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RecipeBoardController {

	@RequestMapping("/recipeBoard_view")
	public ModelAndView recipeBoard_view(HttpServletRequest req) {

		ModelAndView m = new ModelAndView();
		
		if(req.getParameter("page") != null) {
			int page = Integer.parseInt(req.getParameter("page"));
			m.addObject("page", page);
		}
		if(req.getParameter("post") != null) {
			int post = Integer.parseInt(req.getParameter("post"));
			m.addObject("post", post);
		}
		if(req.getParameter("cpage") != null) {
			int cpage = Integer.parseInt(req.getParameter("cpage"));
			m.addObject("cpage", cpage);
		}
		
		m.setViewName("recipeBoard/recipeBoard_view");
		
		return m;
	}
	
}
