<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핫뉴스 관리</title>
<link rel="stylesheet" type="text/css" href="./resources/css/admin_hotNewsBoard.css" />

</head>

<body >
	<%@ include file="../menubar/adminleftbar.jsp"%>
	<div id="admin_header">
		<b style="font-size: 200%;">핫뉴스 관리</b>
	</div>
	
	<div id="admin_panel">
		<div id="admin_search">
			<form class="table-form">
				<fieldset>
					<legend class="hidden">검색</legend>
					<!-- <label class="hidden">검색분류</label> 
					<select name="f">
					<option value="search_id">회원아이디</option>
					<option value="search_name">회원이름</option>
					<option value="search_join">회원상태</option>
					</select> --> 
					<label class="hidden">검색어</label> 
					<input type="text" name="q"	value="" placeholder="검색어를 입력해주세요." /> 
					<input class="btn btn-search" type="submit" value="검색" />
					<input type="button" id="admin_hn_input" onclick="location.href='/EasyCook/admin_hotnews_input';" value="등록" />
				</fieldset>				
			</form>
			
		</div>
				
		<table id="admin_list_hn">
			<tr>
				<th id="admin_list_no">번호</th>
				<th id="admin_list_title">제목</th>
				<th id="admin_list_writer">작성자</th>
				<th id="admin_list_date">등록날짜</th>
				<th id="admin_list_controller">조회/수정/삭제</th>
			</tr>
			<%for(int i=15; i>=1; i--){ %>
			<tr>
				<td><%=i %></td>
				<td><div id="left">[오피셜] “슈퍼리그 계속된다”...유럽사법재판소, ‘UEFA 징계’ 철회 명령</div></td>
				<td>관리자</td>
				<td>2021.12.11</td>
				<td><input type="button" value="조회"/>&nbsp;
					<input type="button" value="수정" onclick="location.href='/EasyCook/admin_hotnews_edit';"/>&nbsp;
					<input type="button" value="삭제" /></td>
			</tr>
			<%} %>
			
		</table>
		
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
				<a href="admin_hotnews_list?page=<%=1%>">[FIRST]</a>
			<%}
			if (currentPage > 1) {
			%>			
				<a href="admin_hotnews_list?page=<%=currentPage-1%>">[PREV]</a>
			<%}
			for (int iCount = startPage; iCount <= endPage; iCount++) {
			%> 
				<a href="admin_hotnews_list?page=<%=iCount%>" >
				<%if (iCount == currentPage) { %>		
					<b class="CurrentPageNumber">&nbsp;<%= iCount %>&nbsp;</b>
			<%} else {%>
					<span class="PageNumber">&nbsp;<%= iCount %>&nbsp;</span>
			<%}%>
				</a>
			<%}

			if (currentPage < totalPage) {%>
				<a href="admin_hotnews_list?page=<%=currentPage+1%>">[NEXT]</a>
			<%}
			if (endPage < totalPage) {%>
				<a href="admin_hotnews_list?page=<%=totalPage%>">[LAST]</a>
			<%} %>			
		</div>
	</div>

</body>
</html>