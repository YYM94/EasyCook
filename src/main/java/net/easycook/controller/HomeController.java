package net.easycook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.easycook.service.RecipeBoardService;
import net.easycook.vo.RecipeBoardVO;

@Controller
public class HomeController {

	@Autowired
	private RecipeBoardService recipeBoardService;
	
	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView m = new ModelAndView();
		List<RecipeBoardVO> rbList = recipeBoardService.getTopRecipe();
		
		m.addObject("rbList", rbList);
		m.setViewName("index");
		return m;
	}
	
}
