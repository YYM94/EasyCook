<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>레시피 글쓰기</title>
<link rel="stylesheet" type="text/css" href="./resources/css/recipeBoard_write.css"/>
<script src="./resources/js/jquery.js"></script>

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
		var removeIndex = $(node.parentNode).find(".contImg").attr('id').substr(7);
		contExist[removeIndex] = 0;
		contImgArr[removeIndex] = -1;
		
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
			contImgArr[changeImgIndex] = f;
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
	var contExist = new Array(); // 삭제되지 않은 배열
	var contImgArr = new Array(); // 이미지 저장 배열
	function addCont(){
		if(contAmount == 20){
			alert('과정을 더이상 추가할 수 없습니다.');
			return;
		}else{
			$("#addedContWrap").append("<div class='recepeCont'>"
										+"<div class='removeContWrap' onclick='removeCont(this);'>"
										+"	<div class='removeContLabel'>"
										+"		지우기"
										+"	</div>"
										+"	<div class='removeContBtn'>"
										+"		<img src='./resources/images/minusBtn.png' width=30px height=25px>"
								  		+"	</div>"
								  		+"</div>"
								  		+"<div class='contWrap'>"
								  		+"	<img id='contImg"+contIndex+"' class='contImg'"
								  		+"		src='./resources/images/recipeBoardContThumbnail.png' onclick='addImg(this);'>"
								  		+"	<textarea id='contText"+contIndex+"' class='contText'></textarea>"
								  		+"</div>"
									  +"</div>");
			contExist[contIndex] = 1;
			contImgArr[contIndex] = -1;
			
			contIndex++;
			contAmount++;
		}
	}
	
	
	/// 폼 전송버튼 클릭 이벤트 ////
	/// 이미지 소스와 textarea 문자열을 하나씩 묶고 각 문자열의 경계를 [SplitPoint]로 나눈다.
	/// 요리 과정의 전체 개수를 전달한다.
	function sendData(form){
		if(confirm("새 글을 등록하시겠습니까?") == true){
			if(contAmount < 1){
				alert("최소한 하나 이상의 요리 과정을 추가해야 합니다.");
				return false;
			}else{
				var imgString = "";
				var textString = "";
				var contCount = 0;

				var formData = new FormData(form);
				var imgFileIndex = "";
				
				for(var i = 1; i <= contExist.length; i++){
					if(contExist[i] == 1){
						if(contImgArr[i] == -1){
							imgFileIndex += "0";
						}else {
							formData.append("imgFiles",contImgArr[i]);
							imgFileIndex += "1";
						}
						textString += $('#contText'+i).val();
						contCount++;
					}
					if(contCount < contAmount){
						textString += "[SplitPoint]";
					}
				}
				formData.append("imgFileIndex",imgFileIndex);
				
				$('input[name=textPack]').val(textString);
				$('input[name=recipeProcess]').val(contAmount);
				
				$.ajax({
					type: 'POST',
					url: 'recipe_write',
					enctype: 'multipart/form-data',
					data: formData,
		            processData: false,
		            contentType: false,
					success: function(data){
						alert('success');
					}
				});
				
			}
		}else{
			return false;
		}
	}
</script>

<%@ include file="../menubar/top_left_menubar.jsp"%>

<div id="writeFormWrap">
	<div id="recipeInsertForm">
		<form name="dataForm" method="post" onsubmit="return sendData(this);" enctype="multipart/form-data">
			<input type="hidden" name="textPack"/>
			<input type="hidden" name="recipeProcess"/>
			<div id="title">
				게시글 제목<br>
				<input type="text" name="title"/>
			</div>
			<div id="video">
				유튜브 링크<br>
				<input type="text" name="videoLink" id="videoLink" onblur="LoadThumbnail();"/><br>
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
						<img src="./resources/images/plusBtn.png" width=30px height=25px>
					</div>
					<div id="addContLabel">
						추가하기
					</div>
				</div>
			</div>
			<div id="SendButtonWrap">
				<input type="submit" id="writeBtn" value="저장"/>
				<input type="button" id="cancelBtn" value="취소" onclick="location.href='recipeBoard_view?page=${page}'"/>
			</div>
		</form>
	</div>
</div>