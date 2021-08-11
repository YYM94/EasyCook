<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>공지사항 관리자 페이지</title>
<style>
button{

}

#admin_page_number{
	margin: 10px 0 10px 20% ;
	font-weight: bold;	
}

#admin_page_number a:link {
  color : black;
  text-decoration: none;
}
#admin_page_number a:hover {
  color : gray;
  text-decoration: underline;
}
#admin_page_number a:active {
  color : aqua;
  text-decoration: none;
}
</style>
<link rel="stylesheet" type="text/css" href="./resources/css/adminnotice.css" />
<body>
<%@ include file="../menubar/adminleftbar.jsp"%>
	<div id="noticeadmin">
		<div class="search-form">
			<h3 class="hidden2">공지사항 관리자페이지</h3>
			<form class="table-form">
				<fieldset>
					<legend class="hidden">검색</legend>
					<label class="hidden">검색분류</label> 
					<select name="f">
					<option value="title">제목</option>
					</select> 
					<label class="hidden">검색어</label> 
					<input type="text" name="n"	value="" placeholder="검색어를 입력해주세요." /> 
					<input class="btn btn-search" type="submit" value="검색" />
					<input class="write" type="button" value="공지사항등록" onclick="location.href='noticewrite'"/>
				</fieldset>
			</form>
		</div>
		<div class="admintitle">
			<!-- <b>제목</b> <b>작성자</b> <b>날짜</b> -->
			<div id=title1>제목</div>
			<div id=title2>작성자</div>
			<div id=title3>날짜</div>
		</div>
		<div id="adminnoticecon">
			<div id="con1">20210731공지사항</div>
			<div id="con2">이지쿡</div>
			<div id="con3">2021-07-27</div>
			<div class="faqbutton">
				<input type="button" value="수정" onclick="location.href='noticeEdit'" />
				<input type="button" value="삭제"/>
			</div>
		</div>
		<div id="adminnoticecon">
			<div id="con4">공지사항</div>
			<div id="con2">이지쿡</div>
			<div id="con5">2021-07-28</div>
			<div class="faqbutton">
				<input type="button" value="수정" onclick="location.href='noticeEdit'" />
				<input type="button" value="삭제"/>
			</div>
		</div>
		<div id="adminnoticecon">
			<div id="con6">공지사항</div>
			<div id="con2">이지쿡</div>
			<div id="con7">2021-07-29</div>
			<div class="faqbutton">
				<input type="button" value="수정" onclick="location.href='noticeEdit'" />
				<input type="button" value="삭제"/>
			</div>
		</div>
		<div id="adminnoticecon">
			<div id="con6">공지사항</div>
			<div id="con2"></div>
			<div id="con7"></div>
			<div class="faqbutton">
				<input type="button" value="수정" onclick="location.href='noticeEdit'" />
				<input type="button" value="삭제"/>
			</div>
		</div>
		<div id="adminnoticecon">
			<div id="con6">공지사항</div>
			<div id="con2"></div>
			<div id="con7"></div>
			<div class="faqbutton">
				<input type="button" value="수정" onclick="location.href='noticeEdit'" />
				<input type="button" value="삭제"/>
			</div>
		</div>
		<div id="adminnoticecon">
			<div id="con6"></div>
			<div id="con2"></div>
			<div id="con7"></div>
			<div class="faqbutton">
				<input type="button" value="수정" onclick="location.href='noticeEdit'" />
				<input type="button" value="삭제"/>
			</div>
		</div>
		<div id="adminnoticecon">
			<div id="con6"></div>
			<div id="con2"></div>
			<div id="con7"></div>
			<div class="faqbutton">
				<input type="button" value="수정" onclick="location.href='noticeEdit'" />
				<input type="button" value="삭제"/>
			</div>
		</div>
		


	</div>
	<div id="admin_page" style="text-align: center;">
		
		<div id="admin_page_number">
			<%
			int currentPage;
			if(request.getParameter("page") == null){
				currentPage = 1;
			}else{
				currentPage = Integer.parseInt(request.getParameter("page"));
			}
			
			int totalCount=200; 
			int countList = 8; 
			int countPage = 7; 

			int totalPage = totalCount / countList;

			if (totalCount % countList != 0) {
				totalPage++;
			}

			if (totalPage < currentPage) {
				currentPage = totalPage;
			}

			int startPage = currentPage - 3; 
			int endPage = currentPage + 3; 
			if(currentPage < 4){
				startPage = 1;
				endPage = 7;
			}
			if(endPage > totalPage){
				startPage = totalPage-6;
				endPage = totalPage;
			}

			if (currentPage > 4) {
			%>
				<a href="adminnotice?page=<%=1%>">[FIRST]</a>
			<%}
			if (currentPage > 1) {
			%>			
				<a href="adminnotice?page=<%=currentPage-1%>">[PREV]</a>
			<%}
			for (int iCount = startPage; iCount <= endPage; iCount++) {
			%> 
				<a href="adminnotice?page=<%=iCount%>" >
				<%if (iCount == currentPage) { %>		
					<span class="CurrentPageNumber">&nbsp;<%= iCount %>&nbsp;</span>
			<%} else {%>
					<span class="PageNumber">&nbsp;<%= iCount %>&nbsp;</span>
			<%}%>
				</a>
			<%}

			if (currentPage < totalPage) {%>
				<a href="adminnotice?page=<%=currentPage+1%>">[NEXT]</a>
			<%}
			if (endPage < totalPage) {%>
				<a href="adminnotice?page=<%=totalPage%>">[LAST]</a>
			<%} %>
			
		</div>
		</div>
	</div>
	</div>
</div>
</body>
</html>
</body>
</html>