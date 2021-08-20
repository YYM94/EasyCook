<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" type="text/css" href="./resources/css/admin.css" />
<script src="./resources/js/jquery.js"></script>
</head>
<body id="admin_body">
	<%@ include file="./menubar/adminleftbar.jsp"%>
	<div id="admin_header">
		<h3 style="font-size: 200%; text-align: center; padding: 10px; margin: 0 0 0 0;">회원 관리</h3>
	</div>
	
	<!-- 회원정보 조회 및 수정 영역 -->
	<div id="admin_member"> 
		<div id="admin_member_table">
			<div id="admin_member_header">
				<span id="info_title">회원 정보 관리</span>
			</div>
			<div id="admin_member_cont">
				<div id="admin_member_id">
					<strong id="member_id" class="member_text">아이디</strong> 
					<input type="text" id="member_id_info" class="member_info" value="abc123" disabled />
					<br/><br/>
				</div>
				<div id="admin_member_email">
					<strong id="member_email" class="member_text">이메일</strong> 
					<input type="text" id="member_email_info" class="member_info" value="abc123@naver.com"/>
					<br/><br/>
				</div>
				<div id="admin_member_nickname">
					<strong id="member_nickname" class="member_text">닉네임</strong> 
					<input type="text" id="member_nickname_info" class="member_info" value="이지쿡"/>
					<br/><br/>
				</div>
				<div id="admin_member_tel">
					<strong id="member_tel" class="member_text">핸드폰 번호</strong> 
					<input type="text" id="member_tel_info" class="member_info" value="010-2323-4545"/>
					<br/><br/>
				</div>
				<div id="admin_member_pwd_q">
					<strong id="member_pwd_q" class="member_text">가입시 선택한 질문</strong> 
					<input type="text" id="member_pwd_q_info" class="member_info" value="나의 출신 초등학교는?" disabled />
					<br/><br/>
					<strong id="member_pwd_q_a" class="member_text">가입시 선택한 질문의 답</strong> 
					<input type="text" id="member_pwd_q_a_info" class="member_info" value="KG초등학교" disabled />
					<br/><br/>
				</div>
				<div id="admin_member_post">
					<strong id="member_post" class="member_text">우편번호</strong> 
					<input type="text" id="member_post_info" class="member_info" value="07741 "/>
					<br/><br/>
					<strong id="member_addr1" class="member_text">주소</strong> 
					<input type="text" id="member_addr1_info" class="member_info" value="서울시 동작구 장승배기로 171" />
					<br/><br/>
					<strong id="member_addr2" class="member_text">상세주소</strong> 
					<input type="text" id="member_addr2_info" class="member_info" value="노량진 아이비빌딩 303호" />
					<br/><br/>
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