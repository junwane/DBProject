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

.good-job {
	font-family: 'Montserrat', Arial, Helvetica, sans-serif;
	color: #e2525c;
}
</style>
<script>
	$(document)
			.ready(
					function() {

						$
								.ajax({
									url : "AllMimiCryMenu",
									type : "get",
									dataType : "json",
									success : function(data) {
										console.log(data.copyCategory);
										var select = $("#copyCategory");

										select.empty();

										var length = data.copyCategory.length;

										for (var i = 0; i < length; i++) {

											select
													.append($(
															"<option value='"+ data.copyCategory[i].mm_no +"'></option>")
															.text(
																	data.copyCategory[i].mm_name));

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

					});
</script>
</head>
<div class="page-wrapper">
	<a class="btn trigger" href="#"> 성대모사 등록</a>
</div>


<div class="portfolio-content portfolio-1" style="margin-top: 5%;">



	<div class="cbp js-grid-juicy-projects" >
		<c:if test="${list1 != null}">
		
			<c:forEach items="${list1}" var="list" varStatus="i">
			<div class="cbp-item movie" data-id="${list.b_no}">
				<div class="cbp-item-wrap">
					<div class="cbp-caption">
						<div class="cbp-caption-defaultWrap">
							<img src="resources/contents/images/" alt="img3">
						</div>
						<div class="cbp-caption-activeWrap">
							<div class="cbp-l-caption-alignCenter">
								<div class="cbp-l-caption-body">
									<div class="btn-group">
										<a href="projects/project1.html"
											class="cbp-singlePage btn text-lowercase" rel="nofollow"
											data-cbp-singlePage="projects">more info</a> <a
											href="https://www.youtube.com/watch?v=3wbvpOIIBQA"
											class="cbp-lightbox btn btn-sm text-lowercase btn-right"
											data-title="GoPro: HERO3+ Black Edition<br>by GoPro">좋아요</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div
						class="cbp-l-grid-projects-title uppercase text-center uppercase text-center">${list.b_title}</div>
					<div
						class="cbp-l-grid-projects-desc uppercase text-center uppercase text-center">${list.mm_name}</div>
				</div>
			</div>

		</c:forEach>
		
		</c:if>
		
		<c:if test="${list1 == null}">
		<div>게시물이 존재하지 않습니다.</div>
		</c:if>
	
	</div>



	<!-- /Reply Singing-->

</div>
<!-- /portfolio -->

<!-- Modal -->
<div class="modal-wrapper">
	<div class="modal">
		<div>

			<span style="margin: 20px 10px; font-size: 28px; color: white;">COPY
				SOUNDS</span>

			<button class="close"
				style="background: #e2525c; color: white; opacity: 1; width: 60px; height: 35px; font-size: 15px; border: none; border-radius: 3px; float: right; margin: 8px 10px; padding: 10px 0;">닫기</button>

		</div>
		<div class="content">

			<form class="content form" action="insertCopyBoard" method="post"
				enctype="multipart/form-data">
				<button class="btn-close" type="submit"
					style="background: #e2525c; color: white; width: 60px; height: 35px; font-size: 15px; border: none; border-radius: 3px; float: right; margin: 8px 10px; padding: 10px 0;">EDIT</button>

				<div class="good-job">
					<h4 style="color: white;">새글 쓰기</h4>
					<input type="text" style="width: 100%;" id="b_title" name="b_title"
						placehoder="제목을 입력하세요" />
					<div style="margin-top: 10px;">

						<div style="float: left; width: 150px; height: 70px;">
							<h4 style="color: white;">분야</h4>
							<select id="copyCategory" name="mm_no">

							</select>
						</div>
						<div style="height: 70px;">
							<h4 style="color: white;">음성 파일</h4>
							<input type="file" name="file">
						</div>

					</div>



					<h4 style="color: white;">본문을 작성하세요</h4>
					<textarea style="width: 100%; height: 110px;" id="b_content" name="b_content"></textarea>
				</div>
			</form>
		</div>

	</div>
</div>
