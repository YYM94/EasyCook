<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yy.MM.dd. a. hh.mm");
%>
<meta charset="UTF-8">
<title>레시피 관리자 페이지</title>
<link rel="stylesheet" type="text/css" href="./resources/css/admin_post.css" />
<body >
	<%@ include file="../menubar/adminleftbar.jsp"%>
	<div id="ap_header">
		<b style="font-size: 200%;">레시피 리스트</b>
	</div>
	
	<div id="ap_panel">
		<div id="ap_search">
			<form class="table-form">
				<fieldset>
					<legend class="hidden">검색</legend>
					<label class="hidden">검색어</label> 
					<input type="text" name="q"	value="" placeholder="검색어를 입력해주세요." /> 
					<input type="submit" value="검색" />
				</fieldset>				
			</form>
			
		</div>
				
		<table id="ap_list" style="border-collapse:collapse" >
			<tr style="	background-color:#cccdd0;">
				<th id="ap_list_no">번호</th>
				<th id="ap_list_title">제목</th>
				<th id="ap_list_writer">작성자</th>
				<th id="ap_list_date">등록날짜</th>
				<th id="ap_list_management">관리</th>
			</tr>
			<%for(int i=10; i>=1; i--){ %>
			<tr style="background-color:#f5f5f5;">
				<td><%=i %></td>
				<td><div id="contents">백종원의 만능 간장 소스 조회수 1위!</div></td>
				<td>관리자</td>
				<td><%= sf.format(nowTime) %></td>
				<td><input type="button" value="조회" onclick="location.href='recipeBoard_view';"/>
					<input type="button" value="수정" onclick="location.href='admin_post_management';"/>
					<input type="button" value="삭제" /></td>
			</tr>
			<%} %>			
		</table>
		
		
		<div id="admin_page_number" style="background-color:#f5f5f5;">
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
				<a href="admin_post_list?page=<%=1%>">[FIRST]</a>
			<%}
			if (currentPage > 1) {
			%>			
				<a href="admin_post_list?page=<%=currentPage-1%>">[PREV]</a>
			<%}
			for (int iCount = startPage; iCount <= endPage; iCount++) {
			%> 
				<a href="admin_post_list?page=<%=iCount%>" >
				<%if (iCount == currentPage) { %>		
					<b class="CurrentPageNumber">&nbsp;<%= iCount %>&nbsp;</b>
			<%} else {%>
					<span class="PageNumber">&nbsp;<%= iCount %>&nbsp;</span>
			<%}%>
				</a>
			<%}

			if (currentPage < totalPage) {%>
				<a href="admin_post_list?page=<%=currentPage+1%>">[NEXT]</a>
			<%}
			if (endPage < totalPage) {%>
				<a href="admin_post_list?page=<%=totalPage%>">[LAST]</a>
			<%} %>			
		</div>
	</div>

</body>
</html>