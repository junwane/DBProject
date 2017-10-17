<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/contents/css/login.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="./resources/contents/js/login.js"></script>
<script>
function login(){
	$.ajax({
		url : 'login',
		data :{
			username : $("#username").val(),
			password : $("#password").val()
		},
		type : 'POST',
		success:function(data){
			if(data == "success"){
				window.location.href="mainPage";
			}
			else{
				alert("존재하지 않는 회원입니다.");
			}
		},
		error:function(data){
			alert("login 에러");
		}
	});
}
</script>
</head>
<body>
<div class="container">
	<div id="login-box">
		<div class="logo">
			<img src="./resources/contents/images/microphone.png" class="img img-responsive img-circle center-block"/>
			<h1 class="logo-caption"><span class="tweak">A</span>WESOME <span class="tweak">V</span>OICE</h1>
		</div><!-- /.logo -->
		<div class="controls">
			<input type="text" id="username" name="username" placeholder="Username" class="form-control" value="user" />
			<input type="password" id="password" name="Password" placeholder="Password" class="form-control" value="1234"/>
			<button type="button" class="btn btn-default btn-block btn-custom" onclick="login();">Login</button>
			<a id="account" type="button" class="btn btn-default btn-block" href="account">Acount</a>
		</div><!-- /.controls -->
	</div><!-- /#login-box -->
</div><!-- /.container -->
<div id="particles-js"></div>
<!--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js"></script>-->
</body>
</html>