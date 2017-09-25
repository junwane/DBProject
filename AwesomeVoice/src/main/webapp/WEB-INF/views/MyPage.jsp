<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
$(document).ready(function(){
	$("body").on("load", function(event){
		event.stopImmediatePropagation();
	});
});
</script>
<style>
	.userInfo{
		display:inline-block;
	}
	.sort{
		display:inline-block;

	}
</style>
<body>
My Page 임
<div>
	<div class="sort"><img src="./resources/contents/images/profile.png"></div>
	<div class="sort">
		<div class="userInfo">아이디</div><div class="userInfo">프로필 편집</div><br/>
		<div class="userInfo">점수점수점수</div>
	</div>
</div>
</body>
