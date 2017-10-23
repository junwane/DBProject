<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
<style>
@import url(https://fonts.googleapis.com/css?family=Montserrat:400,700);

html, body {
	width: 100%;
	height: 100%;
	margin: 0;
}

#wrap {
	width : 100%;

	margin-top : 150px;
	margin-left : 250px;
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

a.btn:hover {
	color: white;
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
	left: 50%;
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

.room {
	width : 700px; 
	height : 150px ;
	border : 1px solid black;
	float : left ;
	margin-right : 25px;
	margin-bottom :25px;
	padding : 10px;

}
.roomImage{
	margin : 0 ;
	display : inline-block;
    margin-right : 20px;
}

.roomImage > img {
	margin : 0px;
	width:200px;
	height : 130px;
	border : 1px solid black;


	
}
.roomText {
	width : 450px ;
	height : 130px;  
	display : inline-block;
	position : absolute ;
	
}
.roomText > div {

}
.room  h4 {
	margin : 0px;
}

.room button {
	width : 200px;
	padding : 10px;
	position : absolute;
	top: 86px;
}

</style>
<script>
$(document).ready(function(){
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
	
	$(".createChatting").click(function(){
		
		console.log("dd : " + $("#m_id").text());
		if($("#m_id").text() != ""){
			$("form").attr("method","POST");
			$("form").attr("action","createChattingRoom");
			$("form")[0].submit();
		}else{
			alert("로그인 후 이용해주세요");
		}
	})
	
	$(".enter").click(function(){
		var data_code = $(this).parent().parent().attr("data-code");
		var count ;
		
		$.ajax({
			url : "chattingRoomCount",
			type: "POST",
			data: {
				data_code : data_code
			},
			success : function(data){
				count = data ;
				console.log("count : " + count);
			}
		})
		
		if(count >= 2){
			alert("방이 꽉 찼습니다");
		}else{
			
			window.location = "chattingRoomEnter?cr_no="+data_code;
			
		}
	})
})
</script>
</head>
<div id="wrap">
	<div id="m_id" style="display:none">${m_id}</div>
	<div class="page-wrapper">
		<a class="btn trigger" href="#"> 채팅방 생성</a>
	</div>
			<c:if test="${list == null}">
				<div>게시물이 존재하지 않습니다.</div>
			</c:if>
			<c:if test="${list != null}">
				<c:forEach items="${list}" var="list">
					<div class="room" data-code="${list.cr_no}">
						<div class="roomImage">
							<img src="./resources/contents/images/default.png" >
						</div>
						<div class="roomText" >
							<h4>${list.cr_title}</h4>
							<div>(${list.cr_count}/2)</div>
							<button class="btn enter">참여하기</button>
						</div>
					</div>
				</c:forEach>
			</c:if>	

		<!-- /Reply Singing-->
	

	<!-- /portfolio -->
	
	<!-- Modal -->
	<div class="modal-wrapper" style="position:aubsolute; z-index:1000;">
		<div class="modal">
			<div>
	
				<span style="margin: 20px 10px; font-size: 28px; color: white;">UNKONWN SOUNDS</span>
				<button class="createChatting"
					style="background: #e2525c; color: white; opacity: 1; width: 60px; height: 35px; font-size: 15px; border: none; border-radius: 3px; position:absolute; right : 80px; top:10px; font-size : bold;padding: 10px 0;">생성</button>
	
				<button class="close"
					style="background: #e2525c; color: white; opacity: 1; width: 60px; height: 35px; font-size: 15px; border: none; border-radius: 3px; position:absolute; right: 10px; top:10px; padding: 10px 0;">닫기</button>
	
			</div>
			<div class="content">
	
				<form class="content form" enctype="multipart/form-data">
					<h4 style="color: white; font-size:24px">Chatting Room Title</h4>
					<input type="text" id="cr_title" name="cr_title" style="width: 100%;height : 35px;background:none ;border:0; border-bottom:1px solid white; color : white" 
							placeholder="제목을 입력하세요" />
					<h4 style="color: white;display:inline-block; font-size:24px;margin-top:30px;">Chatting Room Image</h4>	
					<input type="file" name="cr_image" class="btn" style="display:inline-block; background:gray; width:150px; height:30px; padding: 0;">
					<div style="width: 100%;height : 170px; border:1px solid white"></div>
				</form>
			</div>
	
		</div>
	</div>
</div>

    