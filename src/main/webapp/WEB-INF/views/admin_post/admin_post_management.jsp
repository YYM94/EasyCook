<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 관리</title>
<style>
#admin_header {
	text-align: center;
	margin: auto;
	padding: 1%;
	background: peachpuff;
	width: 50%;
}

#admin_panel {
	margin: auto;
	width: 50%;
	background: lavender;
	padding: 1%;
}
#admin_title_box{
	margin: auto;
	width: 40%;
	height: 20px;
}

#admin_contents_box{
	margin: auto;
	width: 55%;
	height: 160px;
}
#admin_link_box{
	margin: auto;
	width: 60%;
	height: 20px;
}

</style>
</head>
<body>
<%@ include file="../menubar/adminleftbar.jsp"%>
	<div id="admin_header">
		<b style="font-size: 200%;">게시글 관리</b>
	</div>

	<div id="admin_panel">
			게시글 제목 : <input type="text" placeholder="제목을 입력하세요" id="admin_title_box"><br/><br/>
			게시글 내용 : <input type="text" placeholder="내용을 입력하세요" id="admin_contents_box"> <br><br>
			파일(추가 및 변경) : <input type="file" id="admin_post_file" ><br/><br/>
			링크 : <input type="text" placeholder="링크 삽입"  id="admin_link_box"/> <br><br>
			<input type="submit" value="등록" class="admin_btn" onclick="location.href='#';">&nbsp;&nbsp;
			<input type="submit" value="수정" class="admin_btn" onclick="location.href='#';">&nbsp;&nbsp; 
			<input type="reset" value="취소" class="admin_btn">&nbsp;&nbsp;
			<input type="button" value="게시글 리스트" class="admin_btn" onclick="location.href='admin_post_list';">			
	</div>
</body>
</html>