package net.easycook.controller;

import java.io.File;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.easycook.service.HotNewsService;
import net.easycook.vo.HotNewsBoardVO;
@Controller
public class HotNewsBoardController { //일반게시판 관리자게시판 합쳐있음

	@Autowired 
	private HotNewsService hotNewsService;
	
	@RequestMapping("/hotNewsBoard_view")
	public String hotNewsBoard_view(Model listM, HttpServletRequest req, @ModelAttribute HotNewsBoardVO hvo) throws Exception{
		int page=1;
		int limit=10;
		if(req.getParameter("page") != null) {
			page=Integer.parseInt(req.getParameter("page"));
		}
		
		//검색필드와 검색어
		String find_field=req.getParameter("find_field");
		String find_name=req.getParameter("find_name");
		hvo.setFind_field(find_field);
		hvo.setFind_name("%"+find_name+"%"); //%는 검색에서 하나이상의 임의의 모르는 문자와 매핑 대응한다.
		
		int totalCount=this.hotNewsService.getTotalCount(hvo); //검색전은 총레코드 개수, 검색이후에는 검색된 레코드 개수

		hvo.setStartrow((page-1)*10+1); //시작 행번호
		hvo.setEndrow(hvo.getStartrow()+limit-1); //끝행번호
		
		List<HotNewsBoardVO> hlistv=this.hotNewsService.getBoardListView(hvo);
		List<HotNewsBoardVO> hlist=this.hotNewsService.getBoardList(hvo);
		

		int maxpage=(int)((double)totalCount/limit+0.95); //총페이지수
		int startpage=(((int)((double)page/10+0.9))-1)*10+1; //현재 페이지에 보여질 시작 페이지
		int endpage=maxpage; //현재 페이지에 보여질 마지막 페이지
		
		if(endpage>startpage+10-1) endpage=startpage+10-1;
		
		
		listM.addAttribute("hlistv", hlistv);
		listM.addAttribute("hlist", hlist);
		listM.addAttribute("page", page);
		listM.addAttribute("startpage", startpage);
		listM.addAttribute("endpage", endpage);
		listM.addAttribute("maxpage", maxpage);
		listM.addAttribute("totalCount", totalCount);
		listM.addAttribute("find_field", find_field);
		listM.addAttribute("find_name", find_name);

//		ModelAndView mav=new ModelAndView(); mav.setViewName("hotNewsBoard/admin_hotnews_list");
//		mav.addObject("totalCount",totalCount);
//		mav.addObject("hlist", hlist);
//		mav.addObject("startpage", startpage);
//		mav.addObject("endpage",endpage);
//		mav.addObject("maxpage", maxpage);
//		mav.addObject("page", page);
		
		return "hotNewsBoard/hotNewsBoard_view";
	}//admin_hotNewsBoard_list()
	
	
	@RequestMapping("/admin_hotnews_write")
	public String admin_hotnews_write(HttpServletRequest req, Model m) {
		int page=1;
		if(req.getParameter("page") != null) {
			page=Integer.parseInt(req.getParameter("page"));
		}
		
		m.addAttribute("page",page);
		return "hotNewsBoard/admin_hotnews_write";
	}//admin_hotNewsBoard_write()
	
	
	@RequestMapping("/admin_hotnews_write_ok")
	public String admin_hotnews_write_ok(@RequestParam MultipartFile hfile, @ModelAttribute HotNewsBoardVO hvo, HttpServletRequest req) throws Exception {
		
//		HttpSession session=req.getSession();
//		
//		String admin_id=(String)session.getAttribute("admin_id"); //세션 관리자 아이디를 구함
		String saveFolder=req.getRealPath("upload"); //이진파일 업로드 서버 경로 => 톰캣 WAS 서버에 의해서 변경된 실제 톰캣 프로젝트 경로
//		int fileSize=5*1024*1024; //이진파일 업로드 최대크기(5MB)
		
		if(hfile != null) { //첨부한 이진파일이 있는경우
			String fileName=hfile.getOriginalFilename(); //첨부한 이진파일명
			Calendar c=Calendar.getInstance(); //Calendar는 추상클래스여서 new로 객체생성 못함. 년월일 시분초 값을 구할 수 있다.
			int year=c.get(Calendar.YEAR); //년도값
			int month=c.get(Calendar.MONTH)+1; //월값. +1한이유 알지?
			int date=c.get(Calendar.DATE); //일값
			
			String homedir=saveFolder+"/"+year+"-"+month+"-"+date; //오늘날짜 폴더경로를 저장
			File path01=new File(homedir);
			if(!(path01.exists())) {//해당 경로가 없으면
				path01.mkdirs(); //폴더 경로를 생성
			}
			Random r=new Random();
			int random=r.nextInt(100000000); //0~1억 미만 사이의 정수형 숫자 난수를 발생
			
			/* 첨부한 파일 확장자를 구함 */
			int index=fileName.lastIndexOf("."); //첨부한 파일에서 .를 맨 오른쪽부터 찾아서 가장 먼저 나오는 .의 왼쪽부터의 인덱스번호를 반환 
			String fileExtendsion=fileName.substring(index+1); //.이후부터 마지막문자까지 반환. 즉 첨부한 파일의 확장자명.
			String refileName="bbs"+year+month+date+random+"."+fileExtendsion; //새로운 이진파일명 저장
			String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName; //데이터베이스에 저장될 레코드값
			
			FileCopyUtils.copy(hfile.getBytes(), new File(homedir+"/"+refileName)); //변경된 이진파일로 새롭게 생성된 폴더에 실제 업로드
			hvo.setHfile(fileDBName); //오라클에 저장될 레코드 값
		}else {//파일을 첨부하지 않았을때
			String fileDBName="";
			hvo.setHfile(fileDBName);
		}
		
//		hvo.setHwriter(hwriter); 
		String htitle=req.getParameter("htitle");
		String hcont=req.getParameter("hcont");
		String hlink=req.getParameter("hlink");
		hvo.setHtitle(htitle); hvo.setHcont(hcont); hvo.setHlink(hlink);
		
		this.hotNewsService.insertBoard(hvo);
		
		return "redirect:/admin_hotnews_list";
	}		
	
	
	@RequestMapping("/admin_hotnews_list")
	public String admin_hotnews_list(Model listM, HttpServletRequest req, @ModelAttribute HotNewsBoardVO hvo) throws Exception{
		int page=1;
		int limit=10;
		if(req.getParameter("page") != null) {
			page=Integer.parseInt(req.getParameter("page"));
		}
		
		//검색필드와 검색어
		String find_field=req.getParameter("find_field");
		String find_name=req.getParameter("find_name");
		hvo.setFind_field(find_field);
		hvo.setFind_name("%"+find_name+"%"); //%는 검색에서 하나이상의 임의의 모르는 문자와 매핑 대응한다.
		
		int totalCount=this.hotNewsService.getTotalCount(hvo); //총 게시물 수

		hvo.setStartrow((page-1)*10+1); //시작 행번호
		hvo.setEndrow(hvo.getStartrow()+limit-1); //끝행번호
		
		List<HotNewsBoardVO> hlist=this.hotNewsService.getBoardList(hvo);
		System.out.println("목록 개수 : " + hlist.size() + " 개");

		int maxpage=(int)((double)totalCount/limit+0.95); //총페이지수
		int startpage=(((int)((double)page/10+0.9))-1)*10+1; //현재 페이지에 보여질 시작 페이지
		int endpage=maxpage; //현재 페이지에 보여질 마지막 페이지
		
		if(endpage>startpage+10-1) endpage=startpage+10-1;
		
		listM.addAttribute("hvo",hvo);
		listM.addAttribute("hlist", hlist);
		listM.addAttribute("page", page);
		listM.addAttribute("startpage", startpage);
		listM.addAttribute("endpage", endpage);
		listM.addAttribute("maxpage", maxpage);
		listM.addAttribute("totalCount", totalCount);
		listM.addAttribute("find_field", find_field);
		listM.addAttribute("find_name", find_name);

//		ModelAndView mav=new ModelAndView(); mav.setViewName("hotNewsBoard/admin_hotnews_list");
//		mav.addObject("totalCount",totalCount);
//		mav.addObject("hlist", hlist);
//		mav.addObject("startpage", startpage);
//		mav.addObject("endpage",endpage);
//		mav.addObject("maxpage", maxpage);
//		mav.addObject("page", page);
		
		return "hotNewsBoard/admin_hotnews_list";
	}//admin_hotNewsBoard_list()
	
		
	//핫뉴스페이지에서 게시물클릭 (조회수 증가O)
	@RequestMapping("/hotNewsBoard_cont")
	public String hotNewsBoard_cont(Model m, HttpServletRequest req, @RequestParam("hno") int hno, int page) {
		this.hotNewsService.getBoardCont(hno);
		
		//검색필드와 검색어
		String find_field=req.getParameter("find_field");
		String find_name=req.getParameter("find_name");
		
		m.addAttribute("page", page);
		m.addAttribute("find_field", find_field);
		m.addAttribute("find_name", find_name);
		return "redirect:/hotNewsBoard_view";
	}//hotNewsBoard_cont
	
	
	//관리자페이지에서 게시물클릭 (조회수 증가X)
	@RequestMapping("/admin_hotnews_cont")
	public String admin_hotnews_cont(Model m, HttpServletRequest req, @RequestParam("hno") int hno, int page) {
		
		//검색필드와 검색어
		String find_field=req.getParameter("find_field");
		String find_name=req.getParameter("find_name");
		
		m.addAttribute("page", page);
		m.addAttribute("find_field", find_field);
		m.addAttribute("find_name", find_name);		
		return "redirect:/admin_hotnews_list";
	}//admin_hotnews_cont
//	
//	
//	@GetMapping("/admin_hotnews_edit")
//	public ModelAndView admin_hotnews_edit(int hno, int page) {
//		HotNewsBoardVO hvo=this.hotNewsService.getBoardCont2(hno);
//		
//		ModelAndView mav=new ModelAndView();
//		mav.setViewName("hotNewsBoard/admin_hotnews_edit");
//		mav.addObject("ehvo", hvo);
//		mav.addObject("page", page);
//		return mav;
//	}//admin_hotNewsBoard_edit()

}
