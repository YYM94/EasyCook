<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핫뉴스 관리</title>
<link rel="stylesheet" type="text/css" href="./resources/css/admin_hotNewsBoard.css" />
</head>
<body>
	<%@ include file="../menubar/adminleftbar.jsp"%>
	<form class="table-form">
		<div id="admin_header">
			<h3 style="font-size: 200%; text-align: center; padding: 10px; margin: 0 0 0 0;">핫뉴스 관리</h3>
		</div>

		<div id="admin_panel">
			<div id="admin_search">
				<fieldset>
					<legend class="hidden">검색</legend>
					<!-- <label class="hidden">검색분류</label> 
					<select name="f">
					<option value="search_id">회원아이디</option>
					<option value="search_name">회원이름</option>
					<option value="search_join">회원상태</option>
					</select> -->
					<label class="hidden">검색어</label> <input type="text" name="q" value="" placeholder="검색어를 입력해주세요." /> 
					<input class="btn btn-search" type="submit" value="검색" /> 
					<input type="button" id="admin_hn_write" value="등록" onclick="location='/easycook/admin_hotnews_write';" />
				</fieldset>
			</div>


			<table id="admin_hn" style="border-collapse: collapse">
				<tr id="admin_hn_title">
					<th id="admin_list_no" width="6%">번호</th>
					<th id="admin_list_title" width="50%">제목</th>
					<th id="admin_list_writer" width="14%">작성자</th>
					<th id="admin_list_date" width="20%">등록날짜</th>
					<th id="admin_list_viewcnt" width="12%">조회수</th>					
					<th id="admin_list_controller" width="50%">조회/수정/삭제</th>
				</tr>
				
				<c:if test="${!empty hlist }">
					<c:forEach var="h" items="${hlist }">
						<tr id="admin_hn_list">
							<td>${h.hno }</td>
							<td id="left"><a href="admin_hotnews_cont?hno=${h.hno}&page=${page}">${h.htitle }</a></td>
							<td>${h.hwriter }</td>
							<td>${h.regdate }</td>							
							<td>${h.viewcnt }</td>
							<td>
								<input type="button" value="조회" /> 
								<input type="button" value="수정" onclick="location.href='/easycook/admin_hotnews_edit';" /> 
								<input type="button" value="삭제" />
							</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty hlist }">
					<tr>
						<th colspan="6">자료실 목록이 없습니다.</th>
					</tr>
				</c:if>
			</table>			 

			<!-- 페이징 쪽나누기 -->
			<div colspan="5" style="text-align:center;">
					<!--	
					<c:if test="${page<=1 }">[PREV]&nbsp;</c:if>					
					-->
					<c:if test="${page>1 }">
						<a href="admin_hotnews_list?page=1">[FIRST]</a>&nbsp;
						<a href="admin_hotnews_list?page=${page-1 }">[PREV]</a>&nbsp;
					</c:if>
					
					<!-- 쪽번호 출력 -->
					<c:forEach var="p" begin="${startpage }" end="${endpage }" step="1">
						<c:if test="${p == page }">${p }&nbsp;</c:if>
						<c:if test="${p != page }"><a href="admin_hotnews_list?page=${p }">${p }</a>&nbsp;</c:if>				
					</c:forEach>
					
					<!--
					<c:if test="${page >= maxpage }">[NEXT]</c:if>
					-->
					<c:if test="${page < maxpage }">
						<a href="admin_hotnews_list?page=${page+1 }">[NEXT]</a>&nbsp;
						<a href="admin_hotnews_list?page=${maxpage }">[LAST]</a>&nbsp;
					</c:if>					
			</div>
			
			<%--
			
			<div id="admin_page_number" style="background-color: #f5f5f5;">
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
				<a href="admin_hotnews_list?page=<%=1%>">[FIRST]</a>
				<%
					}
				if (currentPage > 1) {
				%>
				<a href="admin_hotnews_list?page=<%=currentPage - 1%>">[PREV]</a>
				<%
					}
				for (int iCount = startPage; iCount <= endPage; iCount++) {
				%>
				<a href="admin_hotnews_list?page=<%=iCount%>"> <%
 	if (iCount == currentPage) {
 %>
					<b class="CurrentPageNumber">&nbsp;<%=iCount%>&nbsp;
				</b> <%
 	} else {
 %> <span class="PageNumber">&nbsp;<%=iCount%>&nbsp;
				</span> <%
 	}
 %>
				</a>
				<%
					}

				if (currentPage < totalPage) {
				%>
				<a href="admin_hotnews_list?page=<%=currentPage + 1%>">[NEXT]</a>
				<%
					}
				if (endPage < totalPage) {
				%>
				<a href="admin_hotnews_list?page=<%=totalPage%>">[LAST]</a>
				<%
					}
				%>
			</div>
			
			 --%>
		</div>
	</form>

</body>
</html>