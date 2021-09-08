<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EasyCook! 회원가입</title>

<link rel="stylesheet" type="text/css" href="./resources/css/join.css"/>
<script src="./resources/js/jquery.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	/* 우편번호 찾기 */
	function Postcode() {
		daum.postcode.load(function() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					$("#join_post_box_1").val(data.zonecode);
					$("#join_post_box_2").val(data.roadAddress);
					$("#join_post_box_3").val('').focus();
				}
			}).open();
		});
	}
	
	/* 가입시 알림창 띄우기 */
	function joinConfirm() {
		if (confirm("회원가입 하시겠습니까?")) {
			form.submit();
		} else {
			return false;
		}
	}
	
	/* 회원가입 창에서 [취소]버튼 클릭시 알림창 띄우기 */
	function joinreset(){
		if(confirm("회원가입을 [취소]하시겠습니까?\n입력한 값이 모두 초기화 됩니다.")){
			form.reset();
		}else{
			return false;
		}
	}
	

	
	//이메일 입력방식 선택 
	function emailselect() {
		var num=m.join_email_3_box.selectedIndex;
		if(num == -1){
			return true;
		}
		if(m.join_email_3_box.value == "직접입력"){
			m.join_email_2_box.value = "";
			m.join_email_2_box.readOlny=false;
			m.join_email_2_box.focus();
		}else{
			m.join_email_2_box.value=m.join_email_3_box.options[num].value;
			m.join_email_2_box.readOnly=true;
		}
	}
	
	
	//비밀번호 확인 질문 선택시 비밀번호 확인 답 입력칸으로 포커스 이동
	function joinQ(){
		$('#join_pw_q_box').change(function(){ 
			$('#join_pw_q_box').each(function () { 
				$('#join_pw_q_a_box').focus();	
			});
		});
	}
	
</script>
</head>
<body onLoad="$('#join_id_box').focus();" id="join_body">
<%@ include file="./menubar/top_left_menubar.jsp"%>
	<div id="container">
		<div id="panel">
			<div id="panel-body">
				<form method="post" name="m" action="join_ok" onreset="return joinreset();" style="margin-bottom: 0;">
					<div id="panel-header">
						<a href="/easycook" id="join_header_title_1"><span>EasyCook!</span></a><span id="join_header_title_2"> 회원가입</span>
					</div>
					<div id="panel-table">
						<div id="join_id" class="join_title">
							<strong><label for="join_id_box">아이디</label></strong>
							<input type="text" name="join_id_box" id="join_id_box"
							class="form-control" maxlength="14"
							placeholder="8글자 이상 작성하세요." required /><br/>
							<span class="error" id="idError"></span>
						</div>
						
						<div id="join_email" class="join_title">
							<strong><label for="join_email_1_box">이메일</label></strong>
							<input type="text" name="join_email_1_box" id="join_email_1_box" class="form-control"
							placeholder="이메일을 입력해주세요." />&nbsp;@
							<input type="text" name="join_email_2_box" id="join_email_2_box" class="form-control" readonly />&nbsp;
							<select name="join_email_3_box" class="form-control" onchange="emailselect();">
								<c:forEach var="mail" items="${email}">
									<option value="${mail}">${mail}</option>
								</c:forEach>
							</select>
							<br/>
							<span class="error">8글자 이상 입력하세요!</span>
						</div>
						
						<div id="join_pw" class="join_title">
							<strong><label for="join_pw_box">비밀번호</label></strong>
							<input type="password" name="join_pw_box" id="join_pw_box" 
							class="form-control" maxlength="20" placeholder="8~20자 사이로 입력하세요." autocomplete="new-password" required />
							<br/>
							<span class="error">8글자 이상 입력하세요!</span>
						</div>
						
						<div id="join_pw_check" class="join_title">
							<strong><label for="join_pw_check_box">비밀번호 확인</label></strong>
							<input type="password" name="join_pw_check_box" id="join_pw_check_box"
							class="form-control" maxlength="20" placeholder="입력하신 비밀번호와 일치해야합니다." autocomplete="new-password" required />
							<br/>
							<span class="error">8글자 이상 입력하세요!</span>
						</div>
						
						<div id="join_name" class="join_title">
							<strong><label for="join_name_box">이름</label></strong>
							<input type="text" name="join_name_box" id="join_name_box"
							class="form-control" maxlength="6" placeholder="이름을 입력하세요." required />
							<br/>
							<span class="error">8글자 이상 입력하세요!</span>
						</div>
						
						<div id="join_nickname" class="join_title">
							<strong><label for="join_nickname_box">닉네임</label></strong>
							<input type="text" name="join_nickname_box" id="join_nickname_box" 
							class="form-control" maxlength="8" placeholder="닉네임을 입력하세요." required />
							<br/>
							<span class="error">8글자 이상 입력하세요!</span>
						</div>
						
						<div id="join_tel" class="join_title">
							<strong><label for="join_tel_1_box">핸드폰 번호</label></strong>
							<input type="tel" name="join_tel_1_box" id="join_tel_1_box"
							class="form-control" maxlength="3" style="width: 10%;" required />&nbsp;-
							<input type="tel" name="join_tel_2_box" id="join_tel_2_box"
							class="form-control" maxlength="4" style="width: 11%;" required />&nbsp;-
							<input type="tel" name="join_tel_3_box" id="join_tel_3_box"
							class="form-control" maxlength="4" style="width: 11%;" required />
							<br/>
							<span class="error">8글자 이상 입력하세요!</span>
						</div>
						
						<div id="join_pw_q" class="join_title">
							<strong><label for="join_pw_q_box">비밀번호 확인 질문</label></strong>
							<select name="join_pw_q_box" id="join_pw_q_box" class="form-control" onclick="joinQ();">
								<c:forEach var="pwdQ" items="${pwdQ}">
									<option value="${pwdQ}">${pwdQ}</option>
								</c:forEach>
							</select>
							<br/>
							<span class="error">8글자 이상 입력하세요!</span>
						</div>
						
						<div id="join_pw_q_a" class="join_title">
							<strong><label for="join_pw_q_a_box">비밀번호 확인 답</label></strong>
							<input type="text" name="join_pw_q_a_box" id="join_pw_q_a_box" class="form-control" required />
							<br/>
							<span class="error">8글자 이상 입력하세요!</span>
						</div>
						
						<div id="join_post_1" class="join_title">
							<strong>주소</strong>
							<input type="text" name="join_post_box_1" id="join_post_box_1" class="form-control" 
							placeholder="우편번호" readonly />&nbsp;&nbsp;
							<input type="button" id="join_post_btn" value="우편번호찾기" onclick="Postcode()" />
						</div>
						
						<div id="join_post_2" class="join_title">
							<input type="text" name="join_post_box_2" id="join_post_box_2" class="form-control" 
							placeholder="도로명 주소" readonly />
						</div>
						
						<div id="clear"></div>
						
						<div id="join_post_3" class="join_title">
							<input type="text" name="join_post_box_3" id="join_post_box_3" class="form-control"  
							placeholder="나머지 상세 주소를 입력하세요." required />
							<span class="error">8글자 이상 입력하세요!</span>
						</div>
						
						<div id="join_footer">
							<input type="submit" value="가입하기" id="join_button" />&nbsp;&nbsp;
							<input type="reset" value="취소" id="join_reset_button" onclick="$('#join_id_box').focus();"/>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>




































