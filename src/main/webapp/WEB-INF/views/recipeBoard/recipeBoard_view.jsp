<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta charset="UTF-8">
<title>레시피 게시판</title>
<link rel="stylesheet" type="text/css" href="./resources/css/recipeBoard.css"/>
<script src="./resources/js/jquery.js"></script>

<script>
	function ScrollTop(){
		$('html, body').scrollTop(0);
	}
</script>

<%
//하단 페이지 번호 생성을 위한 전체 게시글 수 검색
int totalPostings = 196;

//현재 페이지
int currentPage;
if(request.getParameter("page") == null){
	currentPage = 1;
}else{
	currentPage = Integer.parseInt(request.getParameter("page"));
}

////////////현재 조회중인 게시글 정보//////////////
//게시글 번호
int currentPosting;
if(request.getParameter("post") == null){
	currentPosting = 0;
}else{
	currentPosting = Integer.parseInt(request.getParameter("post"));
}
//게시글 제목
String Title = "번째 게시글 제목";
//게시글 작성자
String Writer = "작성자";
//게시글 조회수
int Visiter = 10;
//게시글 작성날짜
String Date = "2021-07-21";
//게시글 영상 링크
String videoID = "kR77WlHRZrs";
String youtubeLink = "https://www.youtube.com/embed/" + videoID;
//게시글 레시피 설명 폼 갯수
int Recipes = 4;
//게시글 레시피 설명 텍스트 : -,-로 구분 
String recipeDes = "불맛 달걀볶음밥 <br>[재료]<br>밥 1공기(200g)<br>대파 1/2컵(40g)<br>달걀 2개(120g)<br>식용유 4큰술(40g)"
+"<br>진간장 1/2큰술(5g)<br>MSG 1/4큰술(2g)<br>맛소금 1g" + "-,-"
+"[만드는 법]<br>1. 대파는 송송 썰어 준비한다.<br>2. 프라이팬에 식용유, 대파를 넣어 파 기름을 내고 노릇해지면 한쪽으로 몰아둔다."
+"<br>3. 다른 한쪽에 달걀을 넣어 스크램블 한다." + "-,-"
+"4. 재료가 없는 쪽에 간장을 넣어 눌어붙도록 끓여주고 스크램블 한 달걀, 볶은 대파와 섞어준다." + "-,-"
+"5. 달걀, 대파가 골고루 섞이면 맛소금, 밥을 넣고 불을 끈 후 국자를 이용하여 섞어준다."
+"<br>6. 밥이 골고루 섞이면 센 불에 올려 볶는다. "
+"<br>7. 기호에 따라 MSG를 넣어 볶은 후 완성한다.";
String[] recipeSplit = recipeDes.split("-,-");

%>
<!-- 댓글 관련 -->
<c:set var="totalComments" value="124"/><!-- 현재 게시글의 댓글 갯수 -->
<c:set var="cWriter" value="댓글"/><!-- 댓글 작성자 -->
<c:set var="cContent" value="댓글 내용입니다."/><!-- 댓글 내용 -->
<c:set var="cDate" value="2021-07-22"/><!-- 댓글 작성날짜 -->

<c:set var="cPage" value="${ param.cpage }"/><!-- 현재 댓글 페이지 -->



<%@ include file="../menubar/top_left_menubar.jsp"%>


<div class="board_title">레시피 게시판</div>

<%-- 게시글 조회 영역, currentPost가 0일 경우 표시하지 않음 --%>
<%if(currentPosting != 0){ %>
	<div id="PostingViewPage">
		<div id="PostingTitle">
			<%=currentPosting + " " + Title%>
		</div>
		
		<div id="postingInfo">
			<div id="postingWriter"><%= Writer %></div>
			<div id="postingVisiter">조회수 : <%= Visiter %></div>
			<div id="postingDate"><%= Date %></div>
		</div>
		
		<div id="PostingVideo">
			<iframe width="880" height="500" src="<%=youtubeLink %>" 
				title="YouTube video player" frameborder="0" 
				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
				allowfullscreen>
			</iframe>
		</div>
		
		<div id="postingRecipe">
			<%for(int i = 0; i < Recipes; i++){ %>
				<div class="recipeDescriptionBox">
					<img src="./resources/images/RecipeIMG/210721_0/<%=i+1 %>.jpg"/>
					<div class="recipeDescription">
						<%=recipeSplit[i] %>
					</div>
				</div>
			<%} %>
		</div>
		
		<%if(Writer.equals("작성자")){ %>
			<div id="postingEditRmBtn">
				<input type="button" value="수정"/>
				<input type="button" value="삭제"/>
			</div>
		<%} %>
		
		<c:if test="${ totalComments > 0 }">
			<div id="commentWrap">
			
				<!-- 한 페이지에 10개의 댓글을 출력 -->
				<c:set var="startComment" value="${ 1 + ((cPage-1)*10) }"/>
				<c:set var="endComment" value="${ cPage * 10 }"/>
				<c:if test="${ endComment > totalComments }">
					<c:set var="endComment" value="${ totalComments }"/>
				</c:if>
				
				<c:forEach var="i" begin="${ startComment }" end="${ endComment }">
					<div class="commentBox">
						<div class="commentWriter">${ cWriter }</div>
						<div class="commentContent">${ i } ${ cContent }</div>
						<div class="commentDate">
							${ cDate }
							<c:if test="${ cWriter == '댓글'  }">
								<input type="button" value="삭제"/>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<%-- 댓글 페이징 --%>
			<div id="commentPage">
				<%-- 페이징 변수 지정 --%>
				
				<%-- 전체 페이지 수 --%>
				<%-- 페이지 소숫점 버림 --%>
				<fmt:parseNumber var="cPages" integerOnly="true" value="${ totalComments / 10 }"/>
				<c:if test="${ cPages % 10 > 0 }">
					<c:set var="cPages" value="${ cPages + 1 }"/>
				</c:if>
				
				<%-- 페이지 시작 번호 --%>
				<c:set var="startcPage" value="${ cPage - 2 }"/>
				
				<%-- 페이지 끝 번호 --%>
				<c:set var="lastcPage" value="${ cPage + 2 }"/>
				
				<%-- 페이지 시작, 끝 부분 처리 --%>
				<c:if test="${ cPage < 3 }">
					<c:set var="startcPage" value="1"/>
					<c:set var="lastcPage" value="5"/>
					<%-- 댓글 총 페이지 수가 5 미만일 경우 처리 --%>
					<c:if test="${ cPages < 5 }">
						<c:set var="lastcPage" value="${ cPages }"/>
					</c:if>
				</c:if>
				<c:if test="${ lastcPage > cPages }">
					<c:set var="startcPage" value="${ cPages - 4 }"/>
					<c:set var="lastcPage" value="${ cPages }"/>
				</c:if>
				
				<%-- 페이지 버튼 출력 --%>
				<a href="recipeBoard_view?page=<%=currentPage%>&post=<%=currentPosting %>&cpage=1#commentWrap">
					<span class="cPageNumber">
						<img src="./resources/images/PageMoveLeftEnd.png"/>
					</span>
				</a>
				<c:if test="${ cPage == 1 }">
					<span class="cPageNumber">
						<img src="./resources/images/PageEnd.png"/>
					</span>
				</c:if>
				<c:if test="${ cPage != 1 }">
					<a href="recipeBoard_view?page=<%=currentPage%>&post=<%=currentPosting %>&cpage=${ cPage-1 }#commentWrap">
						<span class="cPageNumber">
							<img src="./resources/images/PageMoveLeft.png"/>
						</span>
					</a>
				</c:if>
				
				<c:forEach var="i" begin="${ startcPage }" end="${ lastcPage }">
					<a href="recipeBoard_view?page=<%=currentPage%>&post=<%=currentPosting %>&cpage=${ i }#commentWrap">
						<c:if test="${ i == cPage }">
							<div class="cPageNumber" style="color: #FF6347; font-weight: bold">
								${ i }
							</div>
						</c:if>
						<c:if test="${ i != cPage }">
							<div class="cPageNumber" style="color: #252525;">
								${ i }
							</div>
						</c:if>
					</a>
				</c:forEach>
				
				<c:if test="${ cPage == cPages }">
					<span class="cPageNumber">
						<img src="./resources/images/PageEnd.png"/>
					</span>
				</c:if>
				<c:if test="${ cPage != cPages }">
					<a href="recipeBoard_view?page=<%=currentPage%>&post=<%=currentPosting %>&cpage=${ cPage+1 }#commentWrap">
						<span class="cPageNumber">
							<img src="./resources/images/PageMoveRight.png"/>
						</span>
					</a>
				</c:if>
				<a href="recipeBoard_view?page=<%=currentPage%>&post=<%=currentPosting %>&cpage=${ cPages }#commentWrap">
					<span class="cPageNumber">
						<img src="./resources/images/PageMoveRightEnd.png"/>
					</span>
				</a>
			</div>
			
			<div id="commentWrite">
				<div id="commentWrtier">댓글 아이디</div>
				<div id="commentContWrite">
					<textarea></textarea>
				</div>
				<div id="commentWriteBtn">
					<input type="button" value="등록"/>
				</div>
			</div>
			
		</c:if>
		<c:if test="${ totalComments == 0 }">
			
		</c:if>
		<div id="moveTopBtn">
			<input type="button" value="▲" onclick="ScrollTop();"/>
		</div>
	</div>
<%} %>

<%-- 게시글 검색 영역 --%>
<div id="RecipieSearchPage">

	<div id="Board_blur"></div>

	<div id="Board_Recipies">
		<%-- 현재 페이지를 기준으로 8개의 게시글을 로드 --%>
		<%
		int startPosting = currentPage*8 - 7;
		int lastPosting = currentPage * 8;
		if(currentPage*8 > totalPostings){
			lastPosting = totalPostings;
		}
		for(int i=startPosting; i<=lastPosting; i++){ 
		%>
			<a href="recipeBoard_view?page=<%=currentPage%>&post=<%=totalPostings-i+1%>&cpage=1">
				<span class="BoardPostings">
					<span class="BoardPostThumbnail"></span>
					<span class="BoardPostTitle"><%=totalPostings-i+1 %>번째 게시글의 제목 : 요리(料理, Cooking)는 먹기 좋게 가공한 음식이나 가공 행위 자체를 의미한다.</span>
					<span class="BoardPostCont"><%=totalPostings-i+1 %>번째 게시글의 내용 :<%= recipeSplit[0] %></span>
				</span>
			</a>
		<%
		}
		%>
	
	</div>
	
	<div id="bottomPageNumber">
		<%-- 전체 게시글 수를 이용한 하단 페이지 번호 생성 --%>
		<%
		int pages = totalPostings/8;
		if((totalPostings % 8) > 0){
			pages++;
		}
		//페이지 첫번째, 마지막 번호 지정
		int firstPage = currentPage-4;
		int lastPage = currentPage+5;
		if((currentPage-5) <= 0){
			firstPage = 1;
			lastPage = 10;
			if( pages < 10 ){
				lastPage = pages;
			}
		}
		if((currentPage+5) > pages){
			firstPage = pages-9;
			lastPage = pages;
		}
		%>
		<a href="recipeBoard_view?page=<%=1%>&post=0&cpage=1">
			<span class="PageNumber">
				<img src="./resources/images/PageMoveLeftEnd.png"/>
			</span>
		</a>
		<%if(currentPage == 1){ %>
			<span class="PageNumber">
				<img src="./resources/images/PageEnd.png"/>
			</span>
		<%}else{ %>
			<a href="recipeBoard_view?page=<%=currentPage-1%>&post=0&cpage=1">
				<span class="PageNumber">
					<img src="./resources/images/PageMoveLeft.png"/>
				</span>
			</a>
		<%} %>
		<%
		for(int i=firstPage; i<=lastPage; i++){
		%>
			<a href="recipeBoard_view?page=<%=i%>&post=0&cpage=1">
				<%if(i == currentPage){ %>
					<span class="PageNumber" style="color: #FF6347; font-weight: bold">
						<%=i %>
					</span>
				<%}else{ %>
					<span class="PageNumber" style="color: #252525;">
						<%=i %>
					</span>
				<%} %>
			</a>
		<%
		}
		%>
		<%if(currentPage == pages){ %>
			<span class="PageNumber">
				<img src="./resources/images/PageEnd.png"/>
			</span>
		<%}else{ %>
			<a href="recipeBoard_view?page=<%=currentPage+1%>&post=0&cpage=1">
				<span class="PageNumber">
					<img src="./resources/images/PageMoveRight.png"/>
				</span>
			</a>
		<%} %>
		<a href="recipeBoard_view?page=<%=pages%>&post=0&cpage=1">
			<span class="PageNumber">
				<img src="./resources/images/PageMoveRightEnd.png"/>
			</span>
		</a>
	</div>
</div>

<div id="postWriteBtn">
	<input type="button" value="글쓰기" onclick="location.href='recipeBoard_write?page=<%=currentPage%>'"/>
</div>