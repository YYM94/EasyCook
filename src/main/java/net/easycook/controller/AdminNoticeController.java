package net.easycook.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.easycook.service.adminNotService;
import net.easycook.vo.adminFaqVO;
import net.easycook.vo.adminNoticeVO;

@Controller
public class AdminNoticeController {

	@Autowired
	private adminNotService adminnotService;
	@RequestMapping("/adminnotice")
	public ModelAndView adminnotice(HttpServletRequest request, @ModelAttribute adminNoticeVO an) {
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
		
		ModelAndView awm=new ModelAndView();
		awm.addObject("anlist",anlist);//blist키이름에 목록저장
		awm.addObject("page",page);//page키이름에 쪽번호 저장
		awm.addObject("startpage",startpage);
		awm.addObject("endpage",endpage);
		awm.addObject("maxpage",maxpage);
		awm.addObject("totalCount",listcount);//totalCount키이름에 총 레코드 개수 저장
		awm.addObject("find_field",find_field);//find_field 속성 키이름에 검색필드를 저장
		awm.addObject("find_name", find_name);
		//검색필드
		awm.setViewName("NoticeFaq/adminnotice");
		//wm.addAttribute("page",page);		
		return awm;
	}
	
	@RequestMapping(value="/noticewrite",method=RequestMethod.GET)
	public ModelAndView noticewrite(Model m, HttpServletResponse response, HttpServletRequest request) 
		throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String easycook_admin =(String)session.getAttribute("easycook_admin");
		if(easycook_admin!=null) {
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
	
	@RequestMapping(value="/noticewrite_ok", method=RequestMethod.POST)
	public ModelAndView noticewrite_ok(@ModelAttribute adminNoticeVO an ,HttpServletRequest request)throws Exception{
		this.adminnotService.insertNot(an);
		
		return new ModelAndView("redirect:/adminnotice");
	}
	
	@RequestMapping(value="/noticeEdit_ok", method=RequestMethod.POST)
}
