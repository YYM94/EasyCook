<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="stylesheet" type="text/css" href="./resources/css/FAQ.css" />
<script src="./resources/js/jquery.js"></script>
<%@ include file="../menubar/top_left_menubar.jsp"%>


<%--
	//하단 페이지 번호 생성을 위한 전체 게시글 수 검색
int totalPages = 3;

//현재 페이지
int currentPage;
if (request.getParameter("page") == null) {
	currentPage = 1;
} else {
	currentPage = Integer.parseInt(request.getParameter("page"));
}
--%>

<div id="FAQPage">
    <div class="board_title">질문과 답변</div>
	<div class="search-form2">
		<form class="table-form">
			<fieldset>
				<legend class="hidden">검색</legend>
				<label class="hidden">검색분류</label> <select name="f">
					<option value="title">제목</option>
					<option value="titlecont">제목+내용</option>
				</select> <label class="hidden">검색어</label> <input type="text" name="q"
					value="" placeholder="검색어를 입력해주세요." /> <input
					class="btn btn-search" type="submit" value="검색" />
			</fieldset>
		</form>
	</div>
	<div>
		<%--
			int startPosting = currentPage;
		int lastPosting = currentPage;
		if (currentPage > totalPages) {
			lastPosting = totalPages;
		}
		for (int i = startPosting; i <= lastPosting; i++) {
		--%>
		<c:if test="${!empty aflist}">
			<c:forEach var="af" items="${aflist}">
				<div class="FAQ">
					<input type="checkbox" id="FAQ01"> <label for="FAQ01">
					${af.adminfaq_title}<em></em>
					</label>
					<div>
						<p>${af.adminfaq_cont}</p>
					</div>
				</div>
			</c:forEach>
		</c:if>
			
		<c:if test="${empty aflist}">
			<input type="checkbox" id="emptyfaq"> <label
			 	for="emptyfaq">FAQ가 등록되지 않았습니다.<em></em></label>
			<div>
				<p>FAQ가 없습니다.</p>
			</div>
		</c:if>
			<%--
		}
	--%>

		</div>

		<div id="bottomPage">
		<div id="bList_paging">
   <%-- 검색 전 페이징(쪽나누기) --%>
  	 	<c:if test="${(empty find_field) && (empty find_name)}">
    	<c:if test="${page <= 1}">
     [이전]&nbsp;
    </c:if>
    <c:if test="${page >1}">
     <a href="FAQ?page=${page-1}">[이전]</a>&nbsp;
    </c:if>
    
    <%-- 쪽번호 출력부분 --%>
    <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
     <c:if test="${a==page}"><${a}></c:if>
     
     <c:if test="${a != page}">
      <a href="FAQ?page=${a}">[${a}]</a>&nbsp;
     </c:if>
    </c:forEach>
    
    <c:if test="${page >= maxpage}">[다음]</c:if>
    
    <c:if test="${page < maxpage}">
       <a href="FAQ?page=${page+1}">[다음]</a>
    </c:if>
   </c:if>
   
   <%-- 검색 후 페이징  --%>
    <c:if test="${(!empty find_field) && (!empty find_name)}">
    <c:if test="${page <= 1}">
     [이전]&nbsp;
    </c:if>
    <c:if test="${page >1}">
     <a href="FAQ?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
    </c:if>
    
    <%-- 쪽번호 출력부분 --%>
    <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
     <c:if test="${a==page}"><${a}></c:if>
     
     <c:if test="${a != page}">
      <a href="FAQ?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
     </c:if>
    </c:forEach>
    
    <c:if test="${page >= maxpage}">[다음]</c:if>
    
    <c:if test="${page < maxpage}">
       <a href="FAQ?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
    </c:if>
   </c:if>
  </div>
			<%--
		int pages = totalPages;
	if ((totalPages) > 0) {
		pages++;
	}
	int firstPage = currentPage - 1;
	int lastPage = currentPage;
	if ((currentPage - 8) <= 0) {
		firstPage = 1;
		lastPage = 3;
	}
	if ((currentPage) > pages) {
		firstPage = pages;
		lastPage = pages;
	}
	--%>
<%--
			<%
		for (int i = firstPage; i <= lastPage; i++) {
	%>
			<a href="FAQ?page=<%=i%>"> <%
 	if (i == currentPage) {
 %> <span class="pageNum" style="color: #ffff00; font-weight: bold"><%=i%></span>
				<%
			} else {
		%> <span class="pageNum" style="color: #ffffff;"><%=i%></span> <%
 	}
 %>
			</a>
			<%
			}
		%>
		 --%>
		</div>
</div>