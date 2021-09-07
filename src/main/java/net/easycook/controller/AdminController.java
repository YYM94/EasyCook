package net.easycook.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.easycook.service.AdminService;
import net.easycook.vo.AdminVO;
import pwdconv.PwdChange;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	//관리자 페이지
	@RequestMapping("/admin")
	public String admin(HttpServletResponse response, HttpServletRequest request, HttpSession session)
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
			return "admin"; //뷰페이지 경로=WEB-INF/views/admin.jsp
		}
		return null;
	} //admin_main()


	


	
	
}
