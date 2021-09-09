<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" type="text/css" href="./resources/css/mypage_view.css" />
<body >
<%@ include file="../menubar/top_left_menubar.jsp"%>
	<div id="mp_header">
		<b style="font-size: 200%;">마이 페이지</b>
	</div>
	
	<div id="mp_member_info">
			<img id="mp_info_img" src="./resources/images/logo_B.png" width="150" height="150"/>
			<input type="button" id="mp_info_update" value="회원정보 수정" onclick="location.href='info_update';"/>				
			
		</div>
		
	<div id="mp_panel">
		<div id="mp_search">
			<form class="table-form">
				<fieldset>
					<legend class="hidden">검색</legend>
					<label class="hidden">검색어</label> 
					<input type="text" name="q"	value="" placeholder="검색어를 입력해주세요." /> 
					<input class="btn btn-search" type="submit" value="검색" />
				</fieldset>				
			</form>
			
		</div>
		
			<div id="mp_title_list">
				<input type="button" id="mp_btn_recipe" value="레시피" onclick="location.href='recipeBoard_view';"/>			
				<input type="button" id="mp_btn_comment" value="댓글" onclick="location.href='#';"/>				
				<input type="button" id="mp_btn_hotnews" value="핫뉴스 바로가기" onclick="location.href='hotNewsBoard_view';"/>				
			</div>
			<div id="mp_contents">
			<img id="mp_cont_img" src="./resources/images/human.png" width="250" height="250"/>
			<img id="mp_cont_img" src="./resources/images/camera.png" width="100" height="100"/><br/>
			레시피를 직접 올려보세요!<br/>
			자랑하고 싶은 나만의  레시피! 공유하고 싶은 멋진 레시피를 올려 주세요!
			<input type="button" id="mp_write_recipe" value="레시피 등록하기" onclick="location.href='recipeBoard_write';"/>				
			</div>
	
		
		
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