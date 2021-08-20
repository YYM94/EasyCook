<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>

<link rel="stylesheet" type="text/css" href="./resources/css/adminnotice.css" />

</head>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yy.MM.dd. a. hh.mm");
%>
<body id="noticebody">
	<%@ include file="../menubar/adminleftbar.jsp"%>
	<div id="noticeheader">
		<h3 style="font-size: 200%; text-align: center; padding: 10px; margin: 0 0 0 0;">공지사항 관리</h3>
	</div>

	<div id="notice_panel">
		<div id="notice_search">
			<form class="table-form">
				<fieldset>
					<legend class="hidden">검색</legend>
					<label class="hidden">검색분류</label> 
					<select name="f">
					<option value="titie">제목</option>

					</select> 
					<label class="hidden">검색어</label> 
					<input type="text" name="q"	value="" placeholder="검색어를 입력해주세요." /> 
					<input class="btn btn-search" type="submit" value="검색" />
					<input class="write" type="button" value="공지사항등록" onclick="location.href='noticewrite'" />
				</fieldset>
			</form>
		</div>

		<div class="noticetitle">
			<!-- <b>제목</b> <b>작성자</b> <b>날짜</b> -->
			<div id=title1>번호</div>
			<div id=title2>작성자</div>
			<div id=title3>등록날짜</div>
			<div id=title4>관리</div>
		</div>

		<div id="notice_cont">
			<% for(int i=10; i>=1; i--){ %>
			<div id="notice_cont_list">
				<div id="con1"><%=i %></div>
				<div id="con2">관리자</div>
				<div id="con3"><%= sf.format(nowTime) %></div>
				<div id="admin_button">
					<div id="button">
						<input type="button" value="수정" onclick="location.href='noticeEdit'" />
						<input type="button" value="삭제"/>
					</div>
				</div>
			</div>
			<%} %>

				
				<div id="admin_page" style="text-align: center;">

					<div id="admin_page_number">
						<%
							int currentPage;
						if (request.getParameter("page") == null) {
							currentPage = 1;
						} else {
							currentPage = Integer.parseInt(request.getParameter("page"));
						}

						int totalCount = 200;
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
						if (currentPage < 4) {
							startPage = 1;
							endPage = 7;
						}
						if (endPage > totalPage) {
							startPage = totalPage - 6;
							endPage = totalPage;
						}

						if (currentPage > 4) {
						%>
						<a href="adminnotice?page=<%=1%>">[FIRST]</a>
						<% }
						if (currentPage > 1) { %>
						<a href="/adminnotice?page=<%=currentPage - 1%>">[PREV]</a>
						<% }
						for (int iCount = startPage; iCount <= endPage; iCount++) { %>
						<a href="adminnotice?page=<%=iCount%>"> 
						<% if (iCount == currentPage) { %>
						<span class="CurrentPageNumber">&nbsp;<%=iCount%>&nbsp; </span> 
						<% } else {
 							%> <span class="PageNumber">&nbsp;<%=iCount%>&nbsp; </span> 
 							<% } %> </a>
						<% }
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

</body>
</html>