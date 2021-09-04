<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핫뉴스 수정</title>
<link rel="stylesheet" type="text/css" href="./resources/css/admin_hotNewsBoard.css" />

<script type="text/javascript">
	function thumbnail(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
</head>

<body>
	<%@ include file="../menubar/adminleftbar.jsp"%>
	<div id="admin_header">
		<b style="font-size: 200%;">핫뉴스 수정</b>
	</div>

	<div id="admin_panel">
		<form action="#">
			핫뉴스 제목 : <input type="text" placeholder="제목을 입력하세요" id="title" name="title" size="40"/> <br> <br>
			<p>핫뉴스 내용 :&nbsp;</p><textarea rows="10" cols="40" style="resize: none;" ></textarea> <br><br>
			썸네일(미리보기) : <input type="file" id="image" accept="image/*" onchange="thumbnail(event);" />
			<div id="image_container" ></div><br><br> 
			링크 : <input type="text" size="80"/> <br><br>
			<input type="submit" value="수정" /> 
			<input type="reset" value="취소" />
			<input type="button" value="목록보기" onclick="location.href='/easycook/admin_hotnews_list';">			
		</form>
	</div>
</body>
</html>