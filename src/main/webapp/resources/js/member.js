/**
 * member.js
 */

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
	
	//회원가입 체크
	function join_check(){
		if($.trim($("#join_id_box").val())==""){
			alert("회원 아이디를 입력하세요!");
			$("#join_id_box").val('').focus();
			return false;
		}
		if($.trim($("#join_email_1_box").val()) == ""){
			alert("이메일 아이디를 입력하세요!");
			$("#join_email_1_box").val('').focus();
			return false;
		}
		if($.trim($("#join_email_2_box").val()) == ""){
			alert("이메일 주소를 선택하세요!");
			$("#join_email_3_box").focus();
			return false;
		}
		$join_pw_box=$.trim($("#join_pw_box").val());
		$join_pw_check_box=$.trim($("#join_pw_check_box").val());
		if($join_pw_box == ""){
			alert("비밀번호를 입력하세요!");
			$("#join_pw_box").val('').focus();
			return false;
		}
		if($join_pw_check_box == ""){
			alert("비밀번호 확인을 입력하세요!");
			$("#join_pw_check_box").val('').focus();
			return false;
		}
		if($join_pw_box != $join_pw_check_box){
			alert("비밀번호가 다릅니다!");
			$("#join_pw_box").val("");
			$("#join_pw_check_box").val("");
			$("#join_pw_box").focus();
			return false;
		}
		if($.trim($("#join_name_box").val()) == ""){
			alert("회원 이름을 입력하세요!");
			$("#join_name_box").val('').focus();
			return false;
		}
		if($.trim($("#join_nickname_box").val()) == ""){
			alert("닉네임을 입력하세요!");
			$("#join_nickname_box").val('').focus();
			return false;
		}
		if($.trim($("#join_tel_1_box").val()) == ""){
			alert("첫번째 폰번호를 입력하세요!");
			$("#join_tel_1_box").val('').focus();
			return false;
		}
		if($.trim($("#join_tel_2_box").val()) == ""){
			alert("두번째 폰번호를 입력하세요!");
			$("#join_tel_2_box").val('').focus();
			return false;
		}
		if($.trim($("#join_tel_3_box").val()) == ""){
			alert("세번째 폰번호를 입력하세요!");
			$("#join_tel_3_box").val('').focus();
			return false;
		}
		if($.trim($("#join_pw_q_a_box").val()) == ""){
			alert("비밀번호 확인 답을 입력하세요!");
			$("#join_pw_q_a_box").val('').focus();
			return false;
		}
		if($.trim($("#join_post_box_1").val()) == ""){
			alert("우편번호를 입력하세요!");
			$("#join_post_box_1").val('').focus();
			return false;
		}
		if($.trim($("#join_post_box_2").val()) == ""){
			alert("주소를 입력하세요!");
			$("#join_post_box_1").val('').focus();
			return false;
		}
		if($.trim($("#join_post_box_3").val()) == ""){
			alert("나머지 주소를 입력하세요!");
			$("#join_post_box_3").val('').focus();
			return false;
		}
	}
	//아이디 중복 검색
	
/* 	//정규표현식
	function validate_id($join_id_box){
		var pattern = new RegExp(/^[a-z0-9_]+$/);
		return pattern.test($join_id_box);
	} */
	
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