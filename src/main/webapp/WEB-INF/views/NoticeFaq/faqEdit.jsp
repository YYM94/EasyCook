<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문과답변</title>
<link rel="stylesheet" type="text/css" href="./resources/css/writefaq.css" />
<%@ include file="../menubar/adminleftbar.jsp"%>
</head>
<body>

	<div class="search-form">
		<h3 class="hidden2">질문과 답변 관리자페이지</h3>
	</div>

	<div class="board_wrap">
		<div class="board_title">
			<strong>질문과 답변 수정</strong>
		</div>
		<div class="board_write_wrap">
			<div class="board_write">
				<div class="title">
					<dl>
						<dt>제목</dt>
						<dd>
							<input type="text" placeholder="제목을 입력하세요">
						</dd>
					</dl>
				</div>
				<div class="cont">
					<textarea placeholder="내용을 입력하세요."></textarea>
				</div>
				<div class="buttonwrite">
					<input type="button" id="save" value="수정" style="color:white" />
					<input type="button" id="cancel" value="취소" onclick="location.href='adminfaq'" />
				</div>
			</div>
		</div>

	</div>
</body>
</html>