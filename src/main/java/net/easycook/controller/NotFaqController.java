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

import net.easycook.service.NotService;
import net.easycook.vo.NoticeBoardVO;

@Controller
public class NotFaqController {
	
	@Autowired
	private NotService notService;
	//공지사항 목록
	@RequestMapping("/Notice")
	public ModelAndView Notice(HttpServletRequest request, @ModelAttribute NoticeBoardVO nb) {
		int page=1;
		int limit=10;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		String find_field=request.getParameter("find_field");
		String find_name=request.getParameter("find_name");
		
		nb.setFind_field(find_field);
		nb.setFind_name("%"+find_name+"%");
		
		int listcount=this.notService.getListCount(nb);
		
		nb.setStartrow((page-1)*10+1);
		nb.setEndrow(nb.getStartrow()+limit-1);
		
		List<NoticeBoardVO> nlist = this.notService.getNotList(nb);
		
		//총페이지
		int maxpage=(int)((double)listcount/limit+0.95);
		
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;
		
		ModelAndView wm=new ModelAndView();
		wm.addObject("nlist",nlist);//blist키이름에 목록저장
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
	
	@RequestMapping("/noticewrite")
	public ModelAndView noticewrite(Model m, HttpServletResponse response, HttpServletRequest request) 
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
			ModelAndView mv = new ModelAndView("NoticeFaq/noticewrite");
			return mv;
		}
		return null;
	}
	@RequestMapping("/faqwrite")
	public ModelAndView faqwrite() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("NoticeFaq/faqwrite");
		return mv;
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
