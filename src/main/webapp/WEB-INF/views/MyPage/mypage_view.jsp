<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" type="text/css" href="./resources/css/mypage_view.css"/>
<script src="./js/jquery.js"></script>
<%@ include file="../menubar/top_left_menubar.jsp"%>

</head> 
<body>
	<div id="mypage_heading">
		<strong id="mypage_heading_title">마이 페이지</strong>
	</div>
	
	
		<div id="mypage_post">
		<div id="table_search">
		<fieldset>
				<label class="hidden">검색분류</label> <select name="f">
					<option value="title">제목</option>
					<option value="titlecont">제목+내용</option>
				</select> <label class="hidden">검색어</label> <input type="text" name="search"
					value="" placeholder="검색어를 입력해주세요." />
					<input type="submit" value="검색" class="btn" onClick="location.href='#'"/> 
					<input type="button" value="게시물 작성" id="text_create_button" onClick="location='#'" />&nbsp;&nbsp;
					<input type="button" value="회원 정보 변경" id="info_update_button" onClick="location='./info_update'" />
			</fieldset>
			</div>
			<div id="post_ex1"> 내가 올린 게시물 </div>
			<div id="post_ex2"> 내가 올린 게시물 </div>
			<div id="post_ex3"> 내가 올린 게시물 </div>
			
			<div id="page_number_controller">
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
				<a href="mypage_view?page=<%=1%>">[FIRST]</a>
			<%}
			if (currentPage > 1) {
			%>			
				<a href="mypage_view?page=<%=currentPage-1%>">[PREV]</a>
			<%}
			for (int iCount = startPage; iCount <= endPage; iCount++) {
			%> 
				<a href="mypage_view?page=<%=iCount%>" >
				<%if (iCount == currentPage) { %>		
					<b class="CurrentPageNumber">&nbsp;<%= iCount %>&nbsp;</b>
			<%} else {%>
					<span class="PageNumber">&nbsp;<%= iCount %>&nbsp;</span>
			<%}%>
				</a>
			<%}

			if (currentPage < totalPage) {%>
				<a href="mypage_view?page=<%=currentPage+1%>">[NEXT]</a>
			<%}
			if (endPage < totalPage) {%>
				<a href="mypage_view?page=<%=totalPage%>">[LAST]</a>
			<%} %>			
		</div>
		</div>
			

		<div id="mypage_text">
		<div id="table_search">
		<fieldset>
				<label class="hidden">검색분류</label> <select name="k">
					<option value="title">제목</option>
					<option value="titlecont">제목+내용</option>
				</select> <label class="hidden">검색어</label> <input type="text" name="search"
					value="" placeholder="검색어를 입력해주세요." /> 
					<input type="submit" value="검색" class="btn" onClick="location.href='#'"/>
					<input type="button" value="게시글 작성" id="text_create_button" onClick="location='#'" />
			</fieldset>
			</div>
		<div id="text_ex1" >내가 작성한 게시글</div>
		<div id="text_ex2" >내가 작성한 게시글</div>
				
		<div id="page_number_controller">
			<%

			if (currentPage > 4) {
			%>
				<a href="mypage_view?page=<%=1%>">[FIRST]</a>
			<%}
			if (currentPage > 1) {
			%>			
				<a href="mypage_view?page=<%=currentPage-1%>">[PREV]</a>
			<%}
			for (int iCount = startPage; iCount <= endPage; iCount++) {
			%> 
				<a href="mypage_view?page=<%=iCount%>" >
				<%if (iCount == currentPage) { %>		
					<b class="CurrentPageNumber">&nbsp;<%= iCount %>&nbsp;</b>
			<%} else {%>
					<span class="PageNumber">&nbsp;<%= iCount %>&nbsp;</span>
			<%}%>
				</a>
			<%}

			if (currentPage < totalPage) {%>
				<a href="mypage_view?page=<%=currentPage+1%>">[NEXT]</a>
			<%}
			if (endPage < totalPage) {%>
				<a href="mypage_view?page=<%=totalPage%>">[LAST]</a>
			<%} %>			
		</div>
		</div>
		
</body>
</html>