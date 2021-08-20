<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트</title>
<link rel="stylesheet" type="text/css" href="./resources/css/admin_post_list.css" />

</head>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yy.MM.dd. a. hh.mm");
%>


<body>
	<%@ include file="../menubar/adminleftbar.jsp"%>
	<div id="admin_header">
		<b style="font-size: 200%;">게시글 리스트</b>
	</div>
	
	<div id="admin_panel">
		<div id="admin_search" >
			<input type="text" /> 
			<input type="submit" value="검색" onclick="location.href='#';">  
		</div>
		
		<input type="button" id="admin_post_submit" value="등록" onclick="location.href='admin_post_management';">
		
		<table id="admin_list_table">
			<tr>
				<th id="admin_list_no">번호</th>
				<th id="admin_list_title">제목</th>
				<th id="admin_list_writer">작성자</th>
				<th id="admin_list_date">등록날짜</th>
				<th id="admin_list_controller">조회/수정/삭제</th>
			</tr>
			<%for(int i=10; i>=1; i--){ %>
			<tr>
				<td><%=i %></td>
				<td><div id="post_contents">게시물 예시 가나다라마바사아자차</div></td>
				<td>관리자</td>
				<td><%= sf.format(nowTime) %></td>
				<td><input type="button" value="조회"/>&nbsp;
					<input type="button" value="수정" onclick="location.href='admin_post_management';"/>&nbsp;
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