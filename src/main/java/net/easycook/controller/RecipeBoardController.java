package net.easycook.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		//전체 게시글 수 검색
		int totalPostings = recipeBoardService.getTotalPostings();
		m.addObject("totalPostingsObj", totalPostings);
		
		int page = 1;
		if(req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
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
		
		RecipeBoardVO rb = new RecipeBoardVO();
		//현재 페이지를 기준으로 8개의 게시글 조회
		rb.setStartNum(page*8-7);
		rb.setEndNum(page*8);
		List<RecipeBoardVO> rbList = recipeBoardService.getPostingList(rb);
		
		m.addObject("rbList", rbList);
		
		m.setViewName("recipeBoard/recipeBoard_view");
		
		return m;
	}//recipeBoard_view()
	
	@RequestMapping("/recipeBoard_write")
	public ModelAndView recipeBoard_write(HttpServletRequest req) {
		ModelAndView m = new ModelAndView();
		m.setViewName("recipeBoard/recipeBoard_write");
		return m;
	}//recipeBoard_write()
	
	@ResponseBody
	@RequestMapping(value = "/recipe_write_ok", method = RequestMethod.POST)
	public String recipe_write_ok(
			@RequestParam("imgFiles") List<MultipartFile> list, @RequestParam("imgIndex") String imgIndex, 
			HttpServletRequest req) throws Exception{
		
		if(list.isEmpty()) {
			//System.out.println("[성공:/recipe_write] 전송된 이미지 파일 없음");
		}else {
			//System.out.println("[성공:/recipe_write] 전송된 이미지 INDEX : ["+imgIndex+"]");
		}
		RecipeBoardVO rb = new RecipeBoardVO();
		rb.setWriterid("imsi");
		rb.setTitle(req.getParameter("title"));
		rb.setVideoLink(req.getParameter("link"));
		rb.setTextPack(req.getParameter("textPack")); if(rb.getTextPack().equals("")) rb.setTextPack("[NoData]");
		rb.setImgIndex(imgIndex);

		//for(int i=0; i<=212; i++) { //테스트 데이터 입력을 위한 반복문 *꼭 주석처리 할 것
		//이미지 저장 폴더 지정
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH)+1; if(month < 10) year *= 10; // 자릿수를 맞춰주기 위해 0추가
		int date = c.get(Calendar.DATE); if(date < 10) month *= 10;
		int hour = c.get(Calendar.HOUR_OF_DAY); if(hour < 10) date *= 10;
		int minute = c.get(Calendar.MINUTE); if(minute < 10) hour *= 10;
		int second = c.get(Calendar.SECOND); if(second < 10) minute *= 10;
		
		String folderName = ""+year+month+date+hour+minute+second;
		rb.setImgFolder(folderName);
		
		//이미지 폴더명을 지정하기 위해 insert후 no값을 return
		recipeBoardService.writeRec(rb);
		//System.out.println("[성공:/recipe_write] 저장된 레코드 NO : "+ rb.getNo());
		folderName = folderName+rb.getNo();
		
		//이미지 폴더 경로 지정
		String saveFolder=req.getRealPath("upload");
		String homeDir = saveFolder + "\\" + folderName;
		File path = new File(homeDir);
		if(!path.exists()) {
			path.mkdirs();
		}
		//파일 이름을 1.jpg, 2.jpg...등으로 저장
		int fileNameIndex = 1;
		for(MultipartFile f:list) {
			int exIndex = f.getOriginalFilename().lastIndexOf(".");
			//String fileEx = f.getOriginalFilename().substring(exIndex+1); //일단 jpg로만 저장함
			File target = new File(path, fileNameIndex + ".jpg");
			FileCopyUtils.copy(f.getBytes(), target);
			//System.out.println("[성공:/recipe_write] 저장된 파일명 : "+ path + "\\" + f.getOriginalFilename());
			fileNameIndex++;
		}
		//} //테스트 데이터 입력용 반복문 종료
		
		return "OK";

	}//recipe_write_ok()
	
}
