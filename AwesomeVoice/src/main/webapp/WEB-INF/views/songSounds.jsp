<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<style>
@import url(https://fonts.googleapis.com/css?family=Montserrat:400,700);

html, body {
	width: 100%;
	height: 100%;
	margin: 0;
}

.page-wrapper {
	width: 100%;
	height: 100%;
	background-size: cover;
}

.blur-it {
	filter: blur(4px);
}

a.btn {
	width: 120px;
	padding: 18px 0;
	position: absolute;
	top: 3%;
	right: 20px;
	font-family: 'Montserrat', Arial, Helvetica, sans-serif;
	font-weight: 700;
	text-align: center;
	text-decoration: none;
	text-transform: uppercase;
	color: #fff;
	border-radius: 10px;
	background: #222222;
}

a.btn:hover{
	color:white;
}
.modal-wrapper {
	width: 100%;
	background: rgba(93, 93, 93, 0.5);
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	visibility: hidden;
	opacity: 0;
	transition: all 0.25s ease-in-out;
}

.modal-wrapper.open {
	opacity: 1;
	visibility: visible;
}

.modal {
	width: 600px;
	height: 400px;
	display: block;
	margin: 50% 0 0 -300px;
	position: relative;
	top: 50%;
	left: 47%;
	background: #222222;;
	opacity: 0;
	transition: all 0.5s ease-in-out;
}

.modal-wrapper.open .modal {
	margin-top: -200px;
	opacity: 1;
}

.content {
	padding: 2%;
}

.good-job {
	font-family: 'Montserrat', Arial, Helvetica, sans-serif;
	color: #e2525c;
}
</style>
<script>
	$(document).ready(function() {
		
		$.ajax({
			url:"AllArtist",
			type:"get",
			dataType:"json",
			success: function(data){
				var list = $("#selectSinger");
				
				var length = data.mi_artist.length;
				
				for(var i = 0; i < length; i++){
					list.append($("<option value='"+ data.mi_artist[i].singer +"'></option>").text(data.mi_artist[i].singer));
				}
				
			}
		});
		
		
		$('.trigger').on('click', function() {
			$('.modal-wrapper').toggleClass('open');
			$('.page-wrapper').toggleClass('blur-it');

			return false;
		});

		$(".modal").click(function(event) {
			event.stopPropagation();
		});

		$(".modal-wrapper").click(function(event) {
			event.stopPropagation();
		});

		$(".btn-close").click(function() {
			$('.modal-wrapper').toggleClass('open');
			$('.page-wrapper').toggleClass('blur-it');
		});
		
		
		$(".close").click(function() {
			$('.modal-wrapper').toggleClass('open');
			$('.page-wrapper').toggleClass('blur-it');
		});
		
		$("#selectSinger").on("change", function(){
			
			$("#showAlbum").show();
			
			$("#showVoicefile").show();
			
			var selectSinger = $("#selectSinger option:selected").val();
			
			$.ajax({
				url:"selectAlbum",
				type:"get",
				data:{
					mi_artist : selectSinger
				},
				dataType:"json",
				success: function(data){
					var list = $("#selectAlbum");
					
				
					
					list.empty();
					list.append($("<option value='0'></option>").text("앨범을 선택해주세요."));
					
					var length = data.musicInfo.length;
					
					for(var i = 0; i < length; i++){
						list.append($("<option value='"+ data.musicInfo[i].mi_no +"'></option>").text(data.musicInfo[i].mi_nm));
					}
					
				}
			});
			
			
		});
	
		

	});
</script>
</head>
<div class="page-wrapper">
	<a class="btn trigger" href="#"> 노래부르기 등록</a>
</div>


<!-- Modal -->
<div class="modal-wrapper">
	<div class="modal" style="width:42%">
		<div>

			<span style="margin: 20px 10px; font-size: 28px; color: white;">SONG SOUNDS</span>
			
				
			<button class="close"
				style="background: #e2525c; color: white; opacity:1; width: 60px; height: 35px; font-size: 15px; border: none; border-radius: 3px; float: right; margin: 8px 10px; padding: 10px 0;">닫기</button>
			
			
			<button class="btn-close"
				style="background: #e2525c; color: white; width: 60px; height: 35px; font-size: 15px; border: none; border-radius: 3px; float: right; margin: 8px 10px; padding: 10px 0;">EDIT</button>
	
		</div>
		<div class="content">


			<div class="good-job">
				<h4 style="color: white;">새글 쓰기</h4>
				<input type="text" style="width: 100%;" id="b_title" placehoder="제목을 입력하세요"/>
				<div style="margin-top: 10px; height:90px;">
				
					<div style="float: left; width: 150px; height:70px; margin-right:35px;">
						<h4 style="color: white;">아티스트</h4>
						<select id="selectSinger">
						<option value="0">가수를 선택해주세요</option>
						</select>
		
					</div>
					<div style="display:none; float:left;  margin-right:15px;" id="showAlbum">
						<h4 style="color: white;">앨범</h4>
						<select id="selectAlbum">
						<option value="0">앨범을 선택해주세요</option>
						</select>
					</div>
					
					<div style="display:none;  float:left; height:70px;" id="showVoicefile">
						<h4 style="color: white;">음성파일</h4>
						<input type="file" id="b_voicefile" />
					</div>

				</div>

				
				<div>
				
					<h4 style="color: white;">본문을 작성하세요</h4>
				<textarea style="width: 100%; height: 110px;" id="b_content"></textarea>
				
				</div>

				
			</div>


		</div>
	</div>
</div>
