<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="./resources/css/hotNewsBoard.css" />
<style>
#hotnews_view_wrap{
 	padding: 10% 10% 0 10%; 	
 }
#hotnews_rank{
 	border: 3px solid #ffa315; border-radius: 1em;
 	background-color: #f5f5f5;
 	height: 250px;
}
.hotnews_rank_one{
	float: left;
	width: 45%;
}
.hotnews_rank_two{
	float: left;
	width: 45%;
}
ul>li:first-child {color: red;}


#admin_panel { /*list, input, edit 공통 */
	padding-top: 5%;
	margin-bottom: 15%;
/* 	min-width: 691px; */
}

#admin_search{
	text-align: center;
	margin-bottom: 2%;	text-align: center;	
}
#admin_hn_input{
	float: right;	
}

table{
	height: 632px;
	margin-bottom: -1px
}
#admin_list_hn{
	width: 100%;
}

#admin_list_no{
	width: 6%;
}
#admin_list_title{
	width: 41%;
	letter-spacing: 0.5em;
}
#admin_list_writer{
	width: 9%;
}
#admin_list_date{
	width: 9%;
}
#admin_list_viewcnt{
	width: 4%;
}


#admin_hn_title > th{
	background-color: #cccdd0;	
}
#admin_hn_list > td{
	background-color:#f5f5f5;	
	border-bottom-style: dotted;
	border-bottom-width: 1px;	
}

#admin_hn_list > td > #left{
	text-align: left;
	padding-left: 14px;
	width: 20em;
	overflow: hidden; 
	text-overflow: ellipsis;
	white-space: nowrap;
}


#bList_paging {
	padding: 10px 0 0 0;
	height: 50px;
	font-weight: bold;
	text-align: center;
}

#admin_page_number a:link {
	color: black;
	text-decoration: none;
}

#admin_page_number a:hover {
	color: gray;
	text-decoration: underline;
}

#admin_page_number a:active {
	color: aqua;
	text-decoration: none;
}

</style>
<script src="./resources/js/jquery.js"></script>
<script type="text/javascript">

$("li:eq(3)").css("border","1px solid #ff0000")

</script>
</head>
<body>
<%@ include file="../menubar/top_left_menubar.jsp"%>
	
<div class="board_title">핫뉴스</div>
	<form method="get" action="hotNewsBoard_view">
    <div id="hotnews_view_wrap">
    	<section>
    	  	<div id="hotnews_rank">    	
    		<c:if test="${!empty hlistv }">    	
    			<ul class="hotnews_rank_one">
   					<c:forEach var="hv" items="${hlistv}" begin="0" end="1">
   						<li style="list-style-type : decimal;">   					
   							<a href="/easycook/hotNewsBoard_cont?hno=${hv.hno }&page=${page}" onclick="window.open('${hv.hlink}')">${hv.htitle }</a>
   						</li>  
   					</c:forEach>    				
    			</ul>
    			
    			<ol class="hotnews_rank_two" start="3">
    				<c:forEach var="hv" items="${hlistv}" begin="2" end="6">
   						
   						<li style="list-style-type : decimal;">   					
   							<a href="/easycook/hotNewsBoard_cont?hno=${hv.hno }&page=${page}" onclick="window.open('${hv.hlink}')">${hv.htitle }</a>
   						</li>
   					</c:forEach>  
    			</ol>
    		</c:if>
    		<c:if test="${empty hlistv }"> 
    		<span >자료가 없습니다.</span>
    		</c:if>   	
    		</div>
    		
    	</section>
    	
    	<section>    	
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
					
					<!-- 검색기능 -->
						<select name="find_field">
							<option value="htitle" <c:if test="${find_field == 'htitle' }"> ${'selected' }</c:if>>제목</option>
							<option value="hcont" <c:if test="${find_field == 'hcont' }"> ${'selected' }</c:if>>내용</option>
						</select>
						<label class="hidden">검색어</label> 
						<input type="text" name="find_name" id="find_name" value="${find_name }" placeholder="검색어를 입력해주세요." /> 
						<input class="btn btn-search" type="submit" value="검색" /> 
						<c:if test="${(!empty find_field) && (!empty find_name)}"> <%-- 검색필드와 검색어가 있는 경우 즉 검색하고 난 이후 실행 --%>
							<input type="button" value="전체목록" onclick="location='hotNewsBoard_view?page=${page}';" />						
						</c:if>
				</fieldset>
			</div>

			<table id="admin_hn" style="border-collapse: collapse">
				<tr id="admin_hn_title">
					<th id="admin_list_no" >번호</th>
					<th id="admin_list_title" >제목</th>
					<th id="admin_list_writer" >작성자</th>
					<th id="admin_list_date" >등록날짜</th>
					<th id="admin_list_viewcnt" >조회수</th>					
				</tr>
				
				<c:if test="${!empty hlist }">
					<c:forEach var="h" items="${hlist }">
						<tr id="admin_hn_list">
							<td align="center">${h.hno }</td>
							<td align="left"><a href="/easycook/hotNewsBoard_cont?hno=${h.hno }&page=${page}&find_field=${find_field}&find_name=${find_name}" onclick="window.open('${h.hlink}')">${h.htitle}</a></td>
<%-- 							<td id="left"><a href="admin_hotnews_cont?hno=${h.hno}&page=${page}">${h.htitle }</a></td> --%>
							<td align="center">${h.hwriter }</td>
							<td align="center">${h.regdate }</td>							
							<td align="center">${h.viewcnt }</td>							
						</tr>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty hlist }">
					<tr>
						<th colspan="6">자료실 목록이 없습니다.</th>
					</tr>
				</c:if>
			</table> 
			
			<!-- 페이징 쪾나누기 -->
			<div id="bList_paging" align="center" style="background-color: #f5f5f5;">
				<!--	
				<c:if test="${page<=1 }">[PREV]&nbsp;</c:if>					
				-->
				<!-- 검색전 페이징 쪽나누기 -->				
				<c:if test="${(empty find_field) && (empty find_name)}">
					<c:if test="${page>1 }">
						<a href="hotNewsBoard_view?page=1">[FIRST]</a>&nbsp;
						<a href="hotNewsBoard_view?page=${page-1 }">[PREV]</a>&nbsp;
					</c:if>
					
					<!-- 쪽번호 출력 -->
					<c:forEach var="p" begin="${startpage }" end="${endpage }" step="1">
						<c:if test="${p == page }">${p }&nbsp;</c:if>
						<c:if test="${p != page }"><a href="hotNewsBoard_view?page=${p }">${p }</a>&nbsp;</c:if>				
					</c:forEach>
					
					<!--
					<c:if test="${page >= maxpage }">[NEXT]</c:if>
					-->
					<c:if test="${page < maxpage }">
						<a href="hotNewsBoard_view?page=${page+1 }">[NEXT]</a>&nbsp;
						<a href="hotNewsBoard_view?page=${maxpage }">[LAST]</a>&nbsp;
					</c:if>	
				</c:if>		
				
				<!-- 검색후 페이징 -->		
				<c:if test="${!(empty find_field) && !(empty find_name)}">
					<c:if test="${page>1 }">
						<a href="hotNewsBoard_view?page=1&find_field=${find_field}&find_name=${find_name}">[FIRST]</a>&nbsp;
						<a href="hotNewsBoard_view?page=${page-1 }&find_field=${find_field}&find_name=${find_name}">[PREV]</a>&nbsp;
					</c:if>
					
					<!-- 쪽번호 출력 -->
					<c:forEach var="p" begin="${startpage }" end="${endpage }" step="1">
						<c:if test="${p == page }">${p }&nbsp;</c:if>
						<c:if test="${p != page }"><a href="hotNewsBoard_view?page=${p }&find_field=${find_field}&find_name=${find_name}">${p }</a>&nbsp;</c:if>				
					</c:forEach>
					
					<!--
					<c:if test="${page >= maxpage }">[NEXT]</c:if>
					-->
					<c:if test="${page < maxpage }">
						<a href="hotNewsBoard_view?page=${page+1 }&find_field=${find_field}&find_name=${find_name}">[NEXT]</a>&nbsp;
						<a href="hotNewsBoard_view?page=${maxpage }&find_field=${find_field}&find_name=${find_name}">[LAST]</a>&nbsp;
					</c:if>	
				</c:if>		
			</div>   	
    	</div>
    	</section>    	
    </div>    
    </form> 
 </body>
</html>


<%-- 
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
 --%>
