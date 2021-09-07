package net.easycook.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.easycook.service.adminNotService;
import net.easycook.vo.adminNoticeVO;

@Controller
public class NotFaqController {
	
	@Autowired
	private adminNotService adminnotService;
	//공지사항 목록
	@RequestMapping("/Notice")
	public ModelAndView Notice(HttpServletRequest request, @ModelAttribute adminNoticeVO an) {
		int page=1;
		int limit=10;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		String find_field=request.getParameter("find_field");
		String find_name=request.getParameter("find_name");
		
		an.setFind_field(find_field);
		an.setFind_name("%"+find_name+"%");
		
		int listcount=this.adminnotService.getListCount(an);
		
		an.setStartrow((page-1)*10+1);
		an.setEndrow(an.getStartrow()+limit-1);
		
		List<adminNoticeVO> anlist = this.adminnotService.getNotList(an);
		
		//총페이지
		int maxpage=(int)((double)listcount/limit+0.95);
		
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;
		
		ModelAndView wm=new ModelAndView();
		wm.addObject("anlist",anlist);//blist키이름에 목록저장
		wm.addObject("page",page);//page키이름에 쪽번호 저장
		wm.addObject("startpage",startpage);
		wm.addObject("endpage",endpage);
		wm.addObject("maxpage",maxpage);
		wm.addObject("totalCount",listcount);//totalCount키이름에 총 레코드 개수 저장
		wm.addObject("find_field",find_field);//find_field 속성 키이름에 검색필드를 저장
		wm.addObject("find_name", find_name);
		//검색필드
		wm.setViewName("NoticeFaq/Notice");
		//wm.addAttribute("page",page);		
		return wm;
	
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
