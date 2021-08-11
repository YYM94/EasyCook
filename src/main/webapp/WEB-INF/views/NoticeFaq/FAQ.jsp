<%@ page contentType="text/html; charset=UTF-8"%>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="stylesheet" type="text/css" href="./resources/css/FAQ.css" />
<script src="./resources/js/jquery.js"></script>
<%@ include file="../menubar/top_left_menubar.jsp"%>


<%
	//하단 페이지 번호 생성을 위한 전체 게시글 수 검색
int totalPages = 3;

//현재 페이지
int currentPage;
if (request.getParameter("page") == null) {
	currentPage = 1;
} else {
	currentPage = Integer.parseInt(request.getParameter("page"));
}
%>

<div id="FAQPage">

	<div class="search-form2">
		<h3 class="hidden2">질문과 답변</h3>
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
		<%
			int startPosting = currentPage;
		int lastPosting = currentPage;
		if (currentPage > totalPages) {
			lastPosting = totalPages;
		}
		for (int i = startPosting; i <= lastPosting; i++) {
		%>
			<div class="FAQ">
				<input type="checkbox" id="FAQ01"> <label for="FAQ01">요리
					레시피 등록은 어떻게 하나요?<em></em>
				</label>
				<div>
					<p>우리는 프로젝트 중입니다.</p>
				</div>
				<input type="checkbox" id="FAQ02"> <label for="FAQ02">회원가입은
					어떻게 하나요?<em></em>
				</label>
				<div>
					<p>우리는 프로젝트 중입니다.</p>
				</div>
				<input type="checkbox" id="FAQ03"> <label for="FAQ03">회원
					탈퇴를 하고싶습니다 어떻게 할수있나요?<em></em>
				</label>
				<div>
					<p>우리는 프로젝트 중입니다.</p>
				</div>
				<input type="checkbox" id="FAQ04"> <label for="FAQ04">추천재료가
					바뀌는 날은 언제인가요?<em></em>
				</label>
				<div>
					<p>우리는 프로젝트 중입니다.</p>
				</div>
			</div>
			<%
		}
	%>

		</div>

		<div id="bottomPage">
			<%
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
	%>

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
		</div>
</div>