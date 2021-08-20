<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<link rel="stylesheet" type="text/css" href="./resources/css/admin.css" />
<script src="./resources/js/jquery.js"></script>
<script>

	function member() {
		$('#admin_panel').hide();
		$('#admin_member').show();
	}


</script>


</head>
<body id="admin_body">
	<%@ include file="./menubar/adminleftbar.jsp"%>
	<div id="admin_header">
		<h3 style="font-size: 200%; text-align: center; padding: 10px; margin: 0 0 0 0;">회원 관리</h3>
	</div>

	<div id="admin_panel">
		<div id="admin_search">
			<form class="table-form">
				<fieldset>
					<legend class="hidden">검색</legend>
					<label class="hidden">검색분류</label> 
					<select name="f">
					<option value="search_id">회원아이디</option>
					<option value="search_name">회원이름</option>
					<option value="search_join">회원상태</option>
					</select> 
					<label class="hidden">검색어</label> 
					<input type="text" name="q"	value="" placeholder="검색어를 입력해주세요." /> 
					<input class="btn btn-search" type="submit" value="검색" />
				</fieldset>
			</form>
		</div>

		<div class="admintitle">
			<!-- <b>제목</b> <b>작성자</b> <b>날짜</b> -->
			<div id=title1>번호</div>
			<div id=title2>아이디</div>
			<div id=title3>회원이름</div>
			<div id=title4>회원상태</div>
			<div id=title5>가입날짜</div>
			<div id=title6>관리</div>
		</div>

		<div id="admin_cont">
			<% for(int i=10; i>=1; i--){ %>
			<div id="admin_cont_list">
				<div id="con1"><%=i %></div>
				<div id="con2">abc123</div>
				<div id="con3">홍길동</div>
				<div id="con4">가입</div>
				<div id="con5">2021.08.20</div>
				<div id="admin_button"><input type="button" value="관리" onclick="member()" /></div>
			</div>
			<%} %>

			<%-- 			<table id="admin_list_table">
				<% for(int i=15; i>=1; i--){ %>
				<tr>
					<td><%=i %></td>
					<td><div id="a_id">abc123</div></td>
					<td>홍길동</td>
					<td>가입</td>
					<td>2021.08.02</td>
					<td><button id="member_button" onclick="member()" >관리</button></td>
				</tr>
				<%} %>
			
		</table> --%>
				
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
						<a href="/admin?page=<%=1%>">[FIRST]</a>
						<% }
						if (currentPage > 1) { %>
						<a href="/admin?page=<%=currentPage - 1%>">[PREV]</a>
						<% }
						for (int iCount = startPage; iCount <= endPage; iCount++) { %>
						<a href="/admin?page=<%=iCount%>"> 
						<% if (iCount == currentPage) { %>
						<span class="CurrentPageNumber">&nbsp;<%=iCount%>&nbsp; </span> 
						<% } else {
 							%> <span class="PageNumber">&nbsp;<%=iCount%>&nbsp; </span> 
 							<% } %> </a>
						<% }
						if (currentPage < totalPage) {%>
						<a href="/admin?page=<%=currentPage+1%>">[NEXT]</a>
						<%}
						if (endPage < totalPage) {%>
						<a href="/admin?page=<%=totalPage%>">[LAST]</a>
						<%} %>

					</div>
				</div>
				

				
			</div>
		</div>
	

	<div id="admin_member"> <!-- 회원정보 조회 및 수정 영역 -->
		<div id="admin_member_table">
			<div id="admin_member_header">
				<span id="info_title">회원 정보 관리</span>
			</div>
			<div id="admin_member_cont">
				<div id="admin_member_id">
					<strong id="member_id" class="member_text">아이디</strong> 
					<input type="text" id="member_id_info" class="member_info" value="abc123" disabled />
					<p />
				</div>
				<div id="admin_member_email">
					<strong id="member_email" class="member_text">이메일</strong> 
					<input type="text" id="member_email_info" class="member_info" value="abc123@naver.com"/>
					<p />
				</div>
				<div id="admin_member_nickname">
					<strong id="member_nickname" class="member_text">닉네임</strong> 
					<input type="text" id="member_nickname_info" class="member_info" value="이지쿡"/>
					<p />
				</div>
				<div id="admin_member_tel">
					<strong id="member_tel" class="member_text">핸드폰 번호</strong> 
					<input type="text" id="member_tel_info" class="member_info" value="010-2323-4545"/>
					<p />
				</div>
				<div id="admin_member_pwd_q">
					<strong id="member_pwd_q" class="member_text">가입시 선택한 질문</strong> 
					<input type="text" id="member_pwd_q_info" class="member_info" value="나의 출신 초등학교는?" disabled />
					<p />
					<strong id="member_pwd_q_a" class="member_text">가입시 선택한 질문의 답</strong> 
					<input type="text" id="member_pwd_q_a_info" class="member_info" value="KG초등학교" disabled />
					<p />
				</div>
				<div id="admin_member_post">
					<strong id="member_post" class="member_text">우편번호</strong> 
					<input type="text" id="member_post_info" class="member_info" value="07741 "/>
					<p />
					<strong id="member_addr1" class="member_text">주소</strong> 
					<input type="text" id="member_addr1_info" class="member_info" value="서울시 동작구 장승배기로 171" />
					<p />
					<strong id="member_addr2" class="member_text">상세주소</strong> 
					<input type="text" id="member_addr2_info" class="member_info" value="노량진 아이비빌딩 303호" />
					<p />
				</div>
			</div>
				<div id="admin_member_pwd">
					<strong id="member_pwd_reset" class="admin_infoBtn">비밀번호 초기화</strong>
					<input type="checkbox" id="member_pwd_reset_info" />
				</div>
				<div id="member_button">
					<button id="admin_member_edit" class="admin_infoBtn">수정</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="admin_member_set" class="admin_infoBtn">탈퇴</button>
				</div>
				<div id="admin_info_close">
					<button id="close" class="admin_infoBtn" onclick="location='admin';" >X</button>
				</div>	
		</div>
	</div>

</body>
</html>