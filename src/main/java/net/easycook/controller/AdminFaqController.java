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
import org.springframework.web.servlet.ModelAndView;

import net.easycook.service.adminFaqService;
import net.easycook.vo.adminFaqVO;



@Controller
public class AdminFaqController {

	@Autowired
	private adminFaqService adminfaqService;
	@RequestMapping("/adminfaq")
	public ModelAndView adminfaq(HttpServletRequest request, @ModelAttribute adminFaqVO af) {
		int page=1;
		int limit=10;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		String find_field=request.getParameter("find_field");
		String find_name=request.getParameter("find_name");
		
		af.setFind_field(find_field);
		af.setFind_name("%"+find_name+"%");
		
		int listcount=this.adminfaqService.getListCount(af);
		
		af.setStartrow((page-1)*10+1);
		af.setEndrow(af.getStartrow()+limit-1);
		
		List<adminFaqVO> aflist = this.adminfaqService.getFaqList(af);
		
		//총페이지
		int maxpage=(int)((double)listcount/limit+0.95);
		
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;
		
		ModelAndView amw=new ModelAndView();
		amw.addObject("aflist",aflist);//blist키이름에 목록저장
		amw.addObject("page",page);//page키이름에 쪽번호 저장
		amw.addObject("startpage",startpage);
		amw.addObject("endpage",endpage);
		amw.addObject("maxpage",maxpage);
		amw.addObject("totalCount",listcount);//totalCount키이름에 총 레코드 개수 저장
		amw.addObject("find_field",find_field);//find_field 속성 키이름에 검색필드를 저장
		amw.addObject("find_name", find_name);
		//검색필드
		amw.setViewName("NoticeFaq/adminfaq");
		//wm.addAttribute("page",page);		
		return amw;
	}
	
	@RequestMapping("/faqwrite")
	public ModelAndView faqwrite(Model m, HttpServletResponse response, HttpServletRequest request) 
		throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String admin_id2 =(String)session.getAttribute("admin_id2");
		if(admin_id2==null) {
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
			ModelAndView mvf = new ModelAndView("NoticeFaq/faqwrite");
			return mvf;
		}
		return null;
	}
}
