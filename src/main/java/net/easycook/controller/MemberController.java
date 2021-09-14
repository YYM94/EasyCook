package net.easycook.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.easycook.service.MemberService;
import net.easycook.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	//사용자 회원관리 로그인 뷰페이지
	@RequestMapping("/login")
	public ModelAndView login(Model m){
		String[] pwdQ = {"질문을 선택하세요.","어머니의 성함은?", "아버지의 성함은?", "나의 출신 초등학교는?"};
		m.addAttribute("pwdQ", pwdQ);
		
		return new ModelAndView("login"); //뷰페이지
	}
	
	//아이디찾기
	@RequestMapping("/id_find")
	public String id_find(@ModelAttribute MemberVO m) throws Exception{
		ModelAndView mav = new ModelAndView();
		List<MemberVO> userList = memberService.id_find(m);
		System.out.println(userList);
		mav.setViewName("login");
		mav.addObject("id_find", userList);
		return "login";
	}
	
	
	//로그인 인증
	@PostMapping("/member_login_ok")
	public String member_login_ok(String login_id_box, String login_pwd_box, HttpServletResponse response, HttpServletRequest request) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		
		MemberVO dm=this.memberService.loginCheck(login_id_box);
		
		if(dm == null) {
			out.println("<script>");
			out.println("alert('확인되지 않은 회원입니다!');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			if(!dm.getJoin_pw_box().equals(login_pwd_box)) {
				out.println("<script>");
				out.println("alert('비번이 다릅니다!');");
				out.println("history.go(-1);");
				out.println("</script>");
			}else {
				session.setAttribute("id", login_id_box);
				session.setAttribute("state", dm.getJoin_state()); //일반사용자 1 / 관리자 3만 로그인 가능
				return "redirect:/"; //로그인 인증 후 메인화면으로 이동
			}
		}
		return null;
	}

	
	//로그인 인증후 메인화면
	@GetMapping("/index")
	public String index(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		
		String id=(String)session.getAttribute("id");
		if(id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='login';");
			out.println("</script>");			
		}else {
			return "login";
		}
		return null;
	} //index()
	
	//로그아웃
	@RequestMapping("/member_logout")
	public String member_logout(HttpServletResponse response, HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		session.invalidate(); //세션만료 => 로그아웃
		
		out.println("<script>");
		out.println("alert('로그아웃 되었습니다!');");
		out.println("location='login';");
		out.println("</script>");
		
		return null;
	}
	
	//사용자 회원가입
	@RequestMapping("/join")
	public String join(Model m) {
		String[] email= {"주소를 선택하세요.","naver.com", "hanmail.net", "nate.com", "hotmail.com", "gmail.com", "직접입력"};
		String[] pwdQ= {"질문을 선택하세요.", "어머니의 성함은?", "아버지의 성함은?", "나의 출신 초등학교는?"};
		
		m.addAttribute("email", email);
		m.addAttribute("pwdQ", pwdQ);
		return "join";
	}//join
	
	
	
	//아이디 중복검색
	@PostMapping("/member_idcheck")
	public String member_idcheck(@RequestParam("id") String id, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		MemberVO db_id=this.memberService.idcheck(id); //아이디 중복 검색
		
		int re=-1; //중복아이디 없을때 반환값
		if(db_id != null) { //중복아이디 있을때
			re=1;
		}
		out.println(re); //값이 반환
		return null;
	}
	
	//회원가입 저장
	@PostMapping("/join_ok")
	public String join_ok(MemberVO m) {
		m.setJoin_pw_box(m.getJoin_pw_box());
		this.memberService.insertMember(m); //회원저장
		return "redirect:/login";
	}

}
