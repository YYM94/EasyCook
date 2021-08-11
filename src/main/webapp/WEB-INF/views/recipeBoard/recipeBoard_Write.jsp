<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>레시피 글쓰기</title>
<link rel="stylesheet" type="text/css" href="../css/recipeBoard_Write.css"/>
<script src="../js/jquery.js"></script>

<script>
	//유튜브 링크를 입력하고 입력창을 빠져나오면 하단에 유튜브 영상 로드
	function LoadThumbnail(){
		var link = $("#videoLink").val();
		var linkSplit = link.split("/");
		link = linkSplit[linkSplit.length-1];
		//링크의 watch?v= 제거
		if(link.substr(0,8) == "watch?v="){
			link = link.substr(8);
		}
		var youtubeLink = "https://www.youtube.com/embed/" + link;

		$("#thumbnail").html(""+
			"<iframe width='740' height='500' src='"+youtubeLink+"'"+
				"title='YouTube video player' frameborder='0' "+
				"allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' "+
				"allowfullscreen>"+
			"</iframe>");
	}

	
	//레시피 과정 삭제 버튼 클릭
	function removeCont(node){
		$(node.parentNode).remove();
		contAmount--;
	}
	
	//레시피 과정 이미지 추가버튼 클릭
	var changeImgIndex = 0; //바꿀 이미지 위치
	function addImg(img){
		imgFileInput.click();
		changeImgIndex = img.getAttribute('id').substr(7);
	}
	//이미지 업로드 시 inputfile change이벤트
	$(document).ready(function(){
		$("#imgFileInput").on("change", contImgChange);
	});
	function contImgChange(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image/*")){
				alert("이미지 파일이 아닙니다.");
				return;
			}
			var reader = new FileReader();
			reader.onload = function(e){
				$("#contImg"+changeImgIndex).attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
	
	
	//레시피 과정 추가 버튼 클릭
	var contIndex = 1; // 요소 아이디
	var contAmount = 0; // 요소 갯수
	function addCont(){
		$("#addedContWrap").append("<div class='recepeCont'>"
										+"<div class='removeContWrap' onclick='removeCont(this);'>"
										+"	<div class='removeContLabel'>"
										+"		지우기"
										+"	</div>"
										+"	<div class='removeContBtn'>"
										+"		<img src='../images/minusBtn.png' width=30px height=25px>"
								  		+"	</div>"
								  		+"</div>"
								  		+"<div class='contWrap'>"
								  		+"	<img id='contImg"+contIndex+"' class='contImg'"
								  		+"		src='../images/recipeBoardContThumbnail.png' onclick='addImg(this);'>"
								  		+"	<textarea class='contText'></textarea>"
								  		+"</div>"
								  +"</div>");
		contIndex++;
		contAmount++;
	}
</script>

<%@ include file="../menubar/top_left_menubar.jsp"%>

<div id="writeFormWrap">
	<div id="recipeInsertForm">
		<form>
			<div id="title">
				게시글 제목<br>
				<input type="text"/>
			</div>
			<div id="video">
				유튜브 링크<br>
				<input type="text" id="videoLink" onblur="LoadThumbnail();"/><br>
				<div id="thumbnail">
					미리보기
				</div>
			</div>
			<div id="recipeContWrap">
				<input type="file" id="imgFileInput" accept="image/*" style="display:none;"/>
				<div id="contTitle">
					요리 과정
				</div>
				<div id="addedContWrap">
					
				</div>
				<div id="addContWrap" onclick="addCont();">
					<div id="addContBtn">
						<img src="../images/plusBtn.png" width=30px height=25px>
					</div>
					<div id="addContLabel">
						추가하기
					</div>
				</div>
			</div>
			<div id="SendButtonWrap">
				<input type="button" id="writeBtn" value="저장"/>
				<input type="button" id="cancelBtn" value="취소" onclick="location.href='./recipeBoard_view.jsp'"/>
			</div>
		</form>
	</div>
</div>