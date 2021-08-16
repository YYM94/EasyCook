<%@ page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="./resources/css/adminleftbar.css" />
<div id="menubar_wrap">

	<div id="top_menubar">
		<div id="top_login_join_btn">
			<a href="login">Login</a>&nbsp;&nbsp; <a
				href="join">Join</a> <br> <a
				href="/controller/mypage_view">마이페이지</a> <br>
			<a href="admin">관리자 페이지</a>
		</div>

	</div>

	<div id="left_menubar">
		<div id="left_menu">
			<div id="left_logo">
				<a href="/EasyCook_Project/Home/index.jsp"><img
					src="./resources/images/logo.png" /></a>
			</div>
			<div id="left_sessionInfo">로그인 정보</div>
			<div id="left_menulink">
				<div id="left_notice">
					<input type="checkbox" id="answer01"> 
					<label for="answer01">레시피 관리</label>
					<div>
						<p>
							<a href="admin_post_management">작성한 레시피 관리</a>
						</p>
						<p>
							<a href="#">레시피 조회</a>
						</p>
					</div>
				</div>
				<div id="left_board">
					<input type="checkbox" id="answer02"> 
					<label for="answer02">이용자 관리</label>
					<div class="open">
						<p>
							<a href="/EasyCook_Project/Home/admin.jsp">이용자 조회</a>
						</p>
					</div>
				</div>
				<div id="left_news">
					<input type="checkbox" id="answer03"> 
					<label for="answer03">열린마당 관리</label>
					<div>
							<a href="adminnotice">공지사항 관리</a><br/><br/>
							<a href="adminfaq">FAQ 관리</a><br/><br/>
							<a href="admin_hotnews_list">핫뉴스 관리</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>