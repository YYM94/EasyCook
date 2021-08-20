package net.easycook.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.easycook.vo.RecipeBoardVO;

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
	
	@RequestMapping("/recipeBoard_write")
	public ModelAndView recipeBoard_write(HttpServletRequest req) {
		ModelAndView m = new ModelAndView();
		
		int pages = 1;
		if(req.getParameter("page") != null) {
			pages = Integer.parseInt(req.getParameter("page"));
		}
		m.addObject("page", pages);
		
		m.setViewName("recipeBoard/recipeBoard_write");
		return m;
	}
	
	@RequestMapping(value = "/recipe_write", method = RequestMethod.POST)
	public String recipe_write(
			@RequestParam("imgFiles") List<MultipartFile> list, @RequestParam("imgFileIndex") String imgIndex,
			HttpServletResponse res, HttpServletRequest req) throws Exception{
		
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();

		System.out.println(list.isEmpty());
		
		for(MultipartFile f:list) {
			System.out.println("ok");
		}
		
		System.out.println(imgIndex);
		
		return "recipeBoard/recipeBoard_view";
	}
	
}
