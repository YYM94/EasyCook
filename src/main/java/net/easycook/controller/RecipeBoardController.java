package net.easycook.controller;

import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.easycook.service.RecipeBoardService;
import net.easycook.vo.RecipeBoardVO;

@Controller
public class RecipeBoardController {
	
	@Autowired
	private RecipeBoardService recipeBoardService;

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
	
	@RequestMapping(value = "/recipe_write_ok", method = RequestMethod.POST)
	public String recipe_write(
			@RequestParam("imgFiles") List<MultipartFile> list, @RequestParam("imgIndex") String imgIndex,
			HttpServletResponse res, HttpServletRequest req) throws Exception{
		
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		if(list.isEmpty()) {
			System.out.println("[성공:/recipe_write] 전송된 이미지 파일 없음");
		}else {
			System.out.println("[성공:/recipe_write] 전송된 이미지 INDEX : ["+imgIndex+"]");
			
			RecipeBoardVO rb = new RecipeBoardVO();
			rb.setWriterid("imsi");
			rb.setTitle(req.getParameter("title"));
			rb.setVideoLink(req.getParameter("link"));
			rb.setTextPack(req.getParameter("textPack"));

			//이미지 저장 폴더 지정
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH)+1;
			int date = c.get(Calendar.DATE);
			int hour = c.get(Calendar.HOUR_OF_DAY);
			int minute = c.get(Calendar.MINUTE);
			int second = c.get(Calendar.SECOND);
			
			String folderName = ""+year+month+date+hour+minute+second;
			rb.setImgFolder(folderName);
			
			//이미지 폴더명을 지정하기 위해 insert후 no값을 return
			int recordNo = recipeBoardService.writeRec(rb);
			folderName = folderName+recordNo;
			
			
			for(MultipartFile f:list) {
				System.out.println(folderName + "/" + f.getOriginalFilename());
			}
		}
		
		return "recipeBoard/recipeBoard_view";
	}
	
}
