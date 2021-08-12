<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="./resources/css/hotNewsBoard.css" />
<script src="./resources/js/jquery.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<%@ include file="../menubar/top_left_menubar.jsp"%>

	<div class="example">
		<ul class="ul_article">
			<%
				for (int i = 0; i < 12; i++) {
			%>
			<div class="hotNews_hyper" onclick="window.open('http://www.google.co.kr');">
				<li>
					<div class="img_wrap">
						<img class="hotNews_img" src="./resources/images/hnboardtemp.jpg" />
					</div>
					<p>기사제목 : 0~74세 등 6월 예약자 중 예약취소·접종연기자0~74세 등 6월 예약자 중 예약취소·접종연기자</p>
				</li>
			</div>
			<%
				}
			%>
		</ul>
	</div>

	<div class="bottom_page">
		<div class="page_search">
			<input name="" type="text" class="input_box"> 
			<input type="button" value="Search" class="btn">
		</div>

		<div class="page_number">
			<%
			int currentPage;
			if(request.getParameter("page") == null){
				currentPage = 1;
			}else{
				currentPage = Integer.parseInt(request.getParameter("page"));
			}
			
			int totalCount=200; //총게시물
			int countList = 8; //보여질 게시물
			int countPage = 7; //보여질 페이징갯수

			int totalPage = totalCount / countList; //페이징객수

			if (totalCount % countList != 0) {
				totalPage++;
			}

			if (totalPage < currentPage) {//현재페이지가 끝페이지를 넘어가는것을 방지
				currentPage = totalPage;
			}

			int startPage = currentPage - 3; ///시작페이징 번호
			int endPage = currentPage + 3; //끝페이징 번호
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
				<a href="hotNewsBoard_view?page=<%=1%>">[FIRST]</a>
			<%}
			if (currentPage > 1) {
			%>			
				<a href="hotNewsBoard_view?page=<%=currentPage-1%>">[PREV]</a>
			<%}
			for (int iCount = startPage; iCount <= endPage; iCount++) {//페이징 7개씩 나열
			%> 
				<a href="hotNewsBoard_view?page=<%=iCount%>" >
				<%if (iCount == currentPage) { %>		
					<b class="CurrentPageNumber">&nbsp;<%= iCount %>&nbsp;</b>
			<%} else {%>
					<span class="PageNumber">&nbsp;<%= iCount %>&nbsp;</span>
			<%}%>
				</a>
			<%}

			if (currentPage < totalPage) {%>
				<a href="hotNewsBoard_view?page=<%=currentPage+1%>">[NEXT]</a>
			<%}
			if (endPage < totalPage) {%>
				<a href="hotNewsBoard_view?page=<%=totalPage%>">[LAST]</a>
			<%} %>
			
		</div>
	</div>

</body>
</html>