<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핫뉴스 등록</title>
<link rel="stylesheet" type="text/css" href="./resources/css/admin_hotNewsBoard.css" />
<script src="./resources/js/jquery.js"></script>
<script type="text/javascript">
function write_check(){
 	 	
 	if($.trim($('#htitle').val()) == ''){
 		alert('글제목을 입력하세요!');
 		$('#htitle').val('').focus();
 		return false;
 	}
 	
 	if($.trim($('#hlink').val()) == ''){
 		alert('링크를 입력하세요!');
 		$('#hlink').val('').focus();
 		return false;
 	}
 	
 	if($.trim($('#hcont').val()) == ''){
 		alert('글내용을 입력하세요!');
 		$('#hcont').val('').focus();
 		return false;
 	}
 	
 }
 
 
// 	function thumbnail(event) {
// 		var reader = new FileReader();
// 		reader.onload = function(event) {
// 			var img = document.createElement("img");
// 			img.setAttribute("src", event.target.result);
// 			document.querySelector("div#image_container").appendChild(img);
// 		};
// 		reader.readAsDataURL(event.target.files[0]);
// 	}
</script>
</head>

<body>
	<%@ include file="../menubar/adminleftbar.jsp"%>
	<div id="admin_header">
		<b style="font-size: 200%;">핫뉴스 등록</b>
	</div>

	<div id="admin_panel">
	
		<form method="post" action="admin_hotnews_write_ok" onsubmit="return write_check();" enctype="multipart/form-data">
			핫뉴스 제목 : <input type="text" placeholder="제목을 입력하세요" id="htitle" name="htitle" size="40" /> <br> <br>
			<p>핫뉴스 내용 :&nbsp;</p><textarea id="hcont" name="hcont" rows="10" cols="40" style="resize: none;"></textarea><br><br> 
			썸네일(미리보기) : <input type="file" id="hfile" name="hfile" multiple /> <br><br>
<!-- 			썸네일(미리보기) : <input type="file" id="hfile" name="hfile" accept="image/*" onchange="thumbnail(event);" /> -->
<!-- 			<div id="image_container" ></div><br><br>  -->
			링크 : <input type="text" id="hlink" name="hlink" size="80" /> <br> <br> 
			<input type="submit" value="등록" /> 
			<input type="reset" value="취소" onclick="return $('#htitle').focus();" /> 
			<input type="button" value="목록보기" onclick="location='/easycook/admin_hotnews_list';">
		</form>
		
	</div>
</body>
</html>