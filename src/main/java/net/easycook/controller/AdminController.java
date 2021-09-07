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

import net.easycook.service.AdminService;
import net.easycook.vo.MemberVO;
import pwdconv.PwdChange;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	//관리자 페이지
	@RequestMapping("/admin")
	public String admin(HttpServletResponse response, HttpServletRequest request, HttpSession session, @ModelAttribute MemberVO m, Model listM)
	throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		String id=(String)session.getAttribute("id"); //세션 아이디값을 구함
		Integer state=(Integer)session.getAttribute("state");
		if(id == null && state == 1 && state == 2) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='login';");
			out.println("</script>");
		}else {
			int page=1;//쪽번호
			int limit=10;//한페이지에 보여지는 목록개수
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));			
			}
			String find_name=request.getParameter("find_name");//검색어
			String find_field=request.getParameter("find_field");//검색
			//필드
			m.setFind_field(find_field);
			m.setFind_name("%"+find_name+"%");
			//%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와
			//매핑 대응

			int listcount=this.adminService.getListCount(m);
			//전체 레코드 개수 또는 검색전후 레코드 개수

			m.setStartrow((page-1)*10+1);//시작행번호
			m.setEndrow(m.getStartrow()+limit-1);//끝행번호

			List<MemberVO> blist=
					this.adminService.getMemberList(m);
			//검색 전후 회원목록

			//총페이지수
			int maxpage=(int)((double)listcount/limit+0.95);
			//현재 페이지에 보여질 시작페이지 수(1,11,21)
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
			int endpage=maxpage;
			if(endpage > startpage+10-1) endpage=startpage+10-1;

			listM.addAttribute("blist",blist);
			//blist 키이름에 값 저장
			listM.addAttribute("page",page);
			listM.addAttribute("startpage",startpage);
			listM.addAttribute("endpage",endpage);
			listM.addAttribute("maxpage",maxpage);
			listM.addAttribute("listcount",listcount);	
			listM.addAttribute("find_field",find_field);
			listM.addAttribute("find_name", find_name);

			return "admin"; //뷰페이지 경로=WEB-INF/views/admin.jsp
		}
		return null;
	} //admin_main()

	//관리자 회원관리 
	@RequestMapping("admin_member_edit")
	public String admin_member_edit(MemberVO m, HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		Integer state=(Integer)session.getAttribute("state");
		
		if(id == null && state == 1 && state == 2) {
			out.println("<script>");
			out.println("alert('관리자 계정으로 다시 로그인 하세요!');");
			out.println("location='login';");
			out.println("</script>");
		}else {
			m.setJoin_pw_box(PwdChange.getPassWordToXEMD5String(
					m.getJoin_pw_box()));//비번을 암호화
			this.adminService.editM(m);//회원정보수정

			out.println("<script>");
			out.println("alert('정보 수정했습니다!');");
			out.println("location='admin_member_info?state=edit" //info부분 수정해야함
					+"&join_id_box="+m.getJoin_id_box()+"';");
			out.println("</script>");
		}
		return null;
	}
	
	


	
	
}
