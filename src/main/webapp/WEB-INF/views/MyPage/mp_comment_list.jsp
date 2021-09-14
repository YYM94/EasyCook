<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" type="text/css" href="./resources/css/mypage_view.css" />
<body >
<%@ include file="../menubar/top_left_menubar.jsp"%>
	<div id="mp_header">
		<b style="font-size: 200%;">마이 페이지-댓글</b>
	</div>
	
	<div id="mp_member_info">
			<img id="mp_info_img" src="./resources/images/human.png" width="150" height="150"/>
			<input type="button" id="mp_info_update" value="회원정보 수정" onclick="location.href='info_update';"/>				
			
		</div>
		
	<div id="mp_panel">
		<div id="mp_search">
			<form class="table-form">
				<fieldset>
					<legend class="hidden">검색</legend>
					<label class="hidden">검색어</label> 
					<input type="text" name="searchText"	value="" placeholder="검색어를 입력해주세요." /> 
					<input class="btn btn-search" type="submit" value="검색" />
				</fieldset>				
			</form>
			
		</div>
		
			<div id="mp_title_list">
				<input type="button" id="mp_btn_recipe" value="나의 레시피" onclick="location.href='mp_recipe_list?page=1';"/>	
				<input type="button" id="mp_btn_home" value="홈으로 돌아가기" onclick="location.href='mypage_view';"/>				
				<input type="button" id="mp_btn_comment" value="나의 댓글" onclick="location.href='mp_comment_list?page=1';"/>	
			</div>
				
			<table id="mr_list" style="border-collapse:collapse" >
			<tr style="	background-color:#cccdd0;">
				<th id="mr_list_no">번호</th>
				<th id="mr_list_date">등록날짜</th>
				<th id="mr_list_comment">내용</th>
				<th id="mr_list_management">관리</th>
			</tr>
			<%for(int i=10; i>=1; i--){ %>
			<tr style="background-color:#f5f5f5;">
				<td><%=i %></td>
				<td>2021.01.01</td>
				<td>123456789</td>
					<td><input type="button" value="이동" onclick="location.href='#';"/></td>
			</tr>
			<%} %>			
		</table>			
			<div id="mypage_view_number" style="background-color:#f5f5f5;">
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
				<a href="mp_recipe_list?page=<%=1%>">[FIRST]</a>
			<%}
			if (currentPage > 1) {
			%>			
				<a href="mp_recipe_list?page=<%=currentPage-1%>">[PREV]</a>
			<%}
			for (int iCount = startPage; iCount <= endPage; iCount++) {
			%> 
				<a href="mp_recipe_list?page=<%=iCount%>" >
				<%if (iCount == currentPage) { %>		
					<b class="CurrentPageNumber">&nbsp;<%= iCount %>&nbsp;</b>
			<%} else {%>
					<span class="PageNumber">&nbsp;<%= iCount %>&nbsp;</span>
			<%}%>
				</a>
			<%}

			if (currentPage < totalPage) {%>
				<a href="mp_recipe_list?page=<%=currentPage+1%>">[NEXT]</a>
			<%}
			if (endPage < totalPage) {%>
				<a href="mp_recipe_list?page=<%=totalPage%>">[LAST]</a>
			<%} %>			
		</div>
	</div>

</body>
</html>