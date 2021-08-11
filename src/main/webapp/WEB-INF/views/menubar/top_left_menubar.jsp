<%@ page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="./resources/css/top_left_menubar.css"/>
<script src="./resources/js/jquery.js"></script>
<script>
	//상단 검색바 이벤트 생성
	topSearchbarEvent();
	
	//상단 검색창, 좌측 메뉴바 팝업 시 스크롤 정지
	top_search_scrollLock();
	
//////////////////////////// 페이지 흐림처리/////////////////////////////////////
	function windowBlurByMask(){  
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
		
		$("#page_blur").css({"width":maskWidth, "height":maskHeight});
		
		$("#page_blur").fadeTo("normal", 0.6);
	}
	
	//mask 해제
	function windowBlurHide(){
		$("#page_blur").fadeOut("normal");
	}
//////////////////////////// 페이지 흐림처리 END ////////////////////////////////


	//상단 메뉴바 검색창, 좌측 메뉴바가 팝업되었을 경우 페이지 스크롤 중지
	function top_search_scrollLock(){
		$('#top_search_icon, #top_search_input, #left_menu, #page_blur').on('scroll touchmove mousewheel', function(e) {
			  e.preventDefault();
			  e.stopPropagation();
			  return false;
		});
	}

//////////////////////// 상단 메뉴바 검색아이콘 마우스 이벤트 //////////////////////////
	function topSearchbarEvent(){
		$(document).ready(function(){
			$("#top_search_icon").mouseover(function(){
				if($("#top_search_input").width() == 0){
					$("#top_search_input").animate({
						width: "60%",
						opacity: "1"
					}, 200);
					windowBlurByMask();
				}
			});
			$("#top_search_hide").mouseover(function(){
				if($("#top_search_input").width() > 0){
					$("#top_search_input").animate({
						width: "0",
						opacity: "0"
					}, 200);
				}
				windowBlurHide();
			});
			$("#top_search_hide").mouseout(function(){
				if($("#top_search_input").width() > 0){
					$("#top_search_input").animate({
						width: "0",
						opacity: "0"
					}, 200);
				}
				windowBlurHide();
			});
		});
	}
////////////////////// 상단 메뉴바 검색아이콘 마우스 이벤트 END ////////////////////////


//////////////////////// 좌측 메뉴바 팝업 & close 이벤트 ///////////////////////////
	$(document).ready(function(){
		$("#left_menubtn").click(function(){
			$("#left_menu").animate({
				width: "20%",
				opacity: "1",
				left: "0px"
			});
			$("#left_menubtn").animate({
				opacity: "0"
			});
			windowBlurByMask();
			$("#top_search_hide").unbind("mouseover");
			$("#top_search_hide").unbind("mouseout");
			$("#top_search_icon").unbind("mouseover");
		});
		$("#left_menuclosebtn").click(function(){
			$("#left_menu").animate({
				width: "0",
				opacity: "0",
				left: "-100px"
			});
			$("#left_menubtn").animate({
				opacity: "1"
			});
			windowBlurHide();
			topSearchbarEvent();
		});
	});
////////////////////// 좌측 메뉴바 팝업 & close 이벤트 END /////////////////////////

</script>
<div id="menubar_wrap">
	<div id="page_blur"></div>
	
	<div id="top_menubar">
		<div id="top_login_join_btn">
			<a href="login">Login</a>&nbsp;&nbsp;
			<a href="join">Join</a>
			<br>
			<a href="/EasyCook_Project/Home/MyPage/mypage.jsp">마이페이지</a>
			<br>
			<a href="admin">관리자 페이지</a>
		</div>
		<div id="top_search">
			<img id="top_search_icon" src="./resources/images/top_search.png" width="30" height="30"/>
			<input id="top_search_input" type="text"/>
		</div>
		<div id="top_search_hide"></div>
		
	</div>
	
	<div id="left_menubar">
		<div id="left_menubtn">
			<img src="./resources/images/left_menubtn.png" width="40" height="40"/>
		</div>
		<div id="left_menu">
			<div id="left_menuclosebtn">
				<img src="./resources/images/left_menuclosebtn.png" width="40" height="40"/>
			</div>
			<div id="left_logo">
				<a href="/easycook"><img src="./resources/images/logo.png"/></a>
			</div>
			<div id="left_sessionInfo">
				로그인 정보
			</div>
			<div id="left_menulink">
				<div id="left_notice">
					<a href="Notice">공지사항</a>
				</div>
				<div id="left_board">
					<a href="recipeBoard_view">레시피 게시판</a>
				</div>
				<div id="left_news">
					<a href="/EasyCook_Project/Home/hotNewsBoard/hotNewsBoard_view.jsp">핫뉴스</a>
				</div>
				<div id="left_faq">
					<a href="FAQ">FAQ</a>
				</div>
			</div>
		</div>
	</div>
</div>