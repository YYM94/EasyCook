package net.easycook.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.easycook.service.FaqService;
import net.easycook.vo.FaqBoardVO;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	@RequestMapping("/FAQ")
	public ModelAndView FAQ(HttpServletRequest request,@ModelAttribute FaqBoardVO fb) {
		int page=1;
		int limit=10;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		String find_field=request.getParameter("find_field");
		String find_name=request.getParameter("find_name");
		
		fb.setFind_field(find_field);
		fb.setFind_name("%"+find_name+"%");
		
		int listcount2=this.faqService.getListCount(fb);
		
		fb.setStartrow((page-1)*10+1);
		fb.setEndrow(fb.getStartrow()+limit-1);
		
		List<FaqBoardVO> flist = this.faqService.getFaqList(fb);
		
		//총페이지
		int maxpage=(int)((double)listcount2/limit+0.95);
		
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;
		
		ModelAndView ma=new ModelAndView();
		ma.addObject("flist",flist);//blist키이름에 목록저장
		ma.addObject("page",page);//page키이름에 쪽번호 저장
		ma.addObject("startpage",startpage);
		ma.addObject("endpage",endpage);
		ma.addObject("maxpage",maxpage);
		ma.addObject("totalCount",listcount2);//totalCount키이름에 총 레코드 개수 저장
		ma.addObject("find_field",find_field);//find_field 속성 키이름에 검색필드를 저장
		ma.addObject("find_name", find_name);
		//검색필드
		ma.setViewName("NoticeFaq/FAQ");
		//wm.addAttribute("page",page);		
		return ma;
		
	}
}
