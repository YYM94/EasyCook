<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EasyCook! 회원 정보 변경</title>

<link rel="stylesheet" type="text/css" href="./resources/css/info_update.css"/>
<script src="./resources/js/jquery.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>

	/* 우편번호 */
	function execDaumPostcode() {
		daum.postcode.load(function() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					$("#update_post_box_1").val(data.zonecode);
					$("#update_post_box_2").val(data.roadAddress);
					$("#update_post_box_3").val('').focus();
				}
			}).open();
		});
	}
	
	//이메일 입력방식 선택 
	function emailselect() {
		$('#update_email_3_box').change(function(){ 
			$('#update_email_3_box option:selected').each(function () { 
				if($(this).val()== '1'){ //직접입력일 경우 
					$('#update_email_2_box').val(''); //값 초기화 
					$('#update_email_2_box').attr('disabled',false); //활성화 
					$('#update_email_2_box').focus(); //메일주소 입력창으로 포커스 이동
				}else{ //직접입력이 아닐경우 
					$('#update_email_2_box').val($(this).text()); //선택값 입력 
					$('#update_email_2_box').attr('disabled',true); //비활성화 
				} 
			}); 
		});
	}
	/* 비밀번호 찾기  클릭시 비밀번호찾기 화면 띄우기 */
	function UpdatePWD(){
		$('#update_pwd_btn').off('click').click(function(){
			$('#info_update_pwd').fadeToggle();
			$('.update_pwd_control').val('');
			$('#update_pw_q').val('');
			$('#update_pwd_id_text').focus();
		});
	}
	function UpQ_pw(){
		$('#update_pw_q').change(function(){ 
			$('#update_pw_q').each(function () { 
				$('#update_pwd_q_a').focus();	
			});
		});
	}
</script>
</head>
<body onLoad="$('#update_id_box').focus();" id="info_update_body">
	
		<div id="panel">
			<div id="panel-body">
				<form action="update_ok.jsp" method="post" name="reg_form" onsubmit="return updateConfirm();" onreset="return updatereset();" style="margin-bottom: 0;">
					<div id="panel-header">
						<a href="./mypage_view" id="update_header_title_1"><span>EasyCook!</span></a><span id="update_header_title_2"> 회원 정보 수정 </span>
					</div>
					<div id="panel-table">
						<div id="update_id" class="update_title">
							<strong><label for="update_id_box">아이디</label></strong>
							<input required type="text" name="update_id_box" id="update_id_box"
							class="form-control" maxlength="14"
							placeholder="8글자 이상 작성하세요."><br/>
							<span class="error">8글자 이상 입력하세요!</span>
						</div>
						
						<div id="update_email" class="update_title">
							<strong><label for="update_email_1_box">이메일</label></strong>
							<input type="text" name="update_email_1_box" id="update_email_1_box" class="form-control"
							placeholder="이메일을 입력해주세요.">&nbsp;
							<input type="email" name="update_email_2_box" id="update_email_2_box" class="form-control"
							autocomplete="email" disabled>&nbsp;
							<select name="update_email_3_box" id="update_email_3_box" class="form-control" onclick="emailselect();">
								<option value="" selected>선택하세요.</option>
								<option value="naver.com">@naver.com</option>
								<option value="hanmail.net">@hanmail.net</option>
								<option value="nate.com">@nate.com</option>
								<option value="hotmail.com">@hotmail.com</option>
								<option value="gmail.com">@gmail.com</option>
								<option value="1">직접입력</option>
							</select>
							<br/>
							<span class="error">8글자 이상 입력하세요!</span>
						</div>
						
						<div id="update_name" class="update_title">
							<strong><label for="update_name_box">이름</label></strong>
							<input type="text" name="update_name_box" id="update_name_box"
							class="form-control" maxlength="6" placeholder="이름을 입력하세요." />
							<br/>
							<span class="error">8글자 이상 입력하세요!</span>
						</div>
						
						<div id="update_nickname" class="update_title">
							<strong><label for="update_nickname_box">닉네임</label></strong>
							<input type="text" name="update_nickname_box" id="update_nickname_box" 
							class="form-control" maxlength="8" placeholder="닉네임을 입력하세요." />
							<br/>
							<span class="error">8글자 이상 입력하세요!</span>
						</div>
						
						<div id="update_tel" class="update_title">
							<strong><label for="update_tel_1_box">핸드폰 번호</label></strong>
							<input type="tel" name="update_tel_1_box" id="update_tel_1_box"
							class="form-control" maxlength="3" style="width: 10%;" />&nbsp;-
							<input type="tel" name="update_tel_2_box" id="update_tel_2_box"
							class="form-control" maxlength="4" style="width: 11%;" />&nbsp;-
							<input type="tel" name="update_tel_3_box" id="update_tel_3_box"
							class="form-control" maxlength="4" style="width: 11%;" />
							<br/>
							<span class="error">8글자 이상 입력하세요!</span>
						</div>
					
						
						<div id="update_post_1" class="update_title">
							<strong><label for="update_post_box_1">주소</label></strong>
							<input type="text" name="update_post_box_1" id="update_post_box_1" class="form-control" 
							placeholder="우편번호" disabled />&nbsp;&nbsp;
							<input type="button" id="update_post_btn" value="우편번호찾기" onclick="execDaumPostcode()" /><br/>
						</div>
						
						<div id="update_post_2" class="update_title">
							<input type="text" name="update_post_box_2" id="update_post_box_2" class="form-control" 
							placeholder="도로명 주소" disabled />
						</div>
						
						<div id="clear"></div>
						
						<div id="update_post_3" class="update_title">
							<input type="text" name="update_post_box_3" id="update_post_box_3" class="form-control"  
							placeholder="나머지 상세 주소를 입력하세요." required />
							<span class="error">8글자 이상 입력하세요!</span>
						</div>
						
						<div id="update_footer">
							<input type="button" value="변경" id="update_button" style="margin-left:50px"/>&nbsp;&nbsp;
							<input type="button" value="탈퇴" id="delete_button"/>&nbsp;&nbsp;
							<a id="update_pwd_btn"><b onclick="UpdatePWD()">비밀번호 재설정</b></a>
								</div>
								</div>
								</form>
								</div>		
	
				
				<!-- 비밀번호 찾기 영역 -->
				
				<div id="info_update_pwd">
				<div id="update_pwd_header">
					EasyCook! 비밀번호 재설정
				</div>

				<div id="update_pwd_table">
					<div id="update_pwd_id">
						<b id="update_pwd_id_title"><label for="update_pwd_id_text">아이디</label></b> 
						<input type="text" name="update_pwd_id_text"
							id="update_pwd_id_text" class="update_pwd_control" />
					</div>

					<div id="info_update_pwd_q">
						
						<select name="update_pw_q" id="update_pw_q" onclick="UpQ_pw();">
								<option value="">질문을 선택하세요.</option>
								<option value="1">어머니의 성함은?</option>
								<option value="2">아버지의 성함은?</option>
								<option value="3">나의 출신 초등학교는?</option>
							</select>
						<input type="text" name="update_pwd_q_a"
							id="update_pwd_q_a" class="update_pwd_control" />
					</div>

					<div id="info_update_pwd_newpwd">
						<b id="update_pwd_newpwd"><label for="update_pwd_newpwd_box">새로운 비밀번호</label></b>
						<input type="text" name="update_pwd_newpwd_box"
							id="update_pwd_newpwd_box" class="update_pwd_control" autocomplete="new-password" />
					</div>
					
					<div id="info_update_pwd_newpwd_check">
						<b id="update_pwd_newpwd_check"><label for="update_pwd_tel_box">비밀번호 확인</label></b>
						<input type="text" name="update_pwd_tel_box"
							id="update_pwd_tel_box" class="update_pwd_control" autocomplete="new-password" />
					</div>
										
					<div id="update_button_pwd">
						<button onclick="RePWD()" id="update_button_pwd_title">비밀번호 재설정</button>
					</div>
				</div>

			</div>

			</div>
		
</body>
</html>
