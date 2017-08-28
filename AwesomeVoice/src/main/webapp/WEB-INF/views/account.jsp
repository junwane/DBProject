<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/contents/css/login.css">
<link href='https://fonts.googleapis.com/css?family=Ubuntu:300,400' rel='stylesheet' type='text/css'>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="./resources/contents/js/login.js"></script>
<script src="./resources/contents/js/jquery-1.12.4.min.js"></script>
<style>
textarea {
  margin-top:5px;
  height:120px;
  max-width:600px;
  color:white;
  font-weight:400;
  font-size:15px;
  font-family:'Ubuntu', Helvetica, Arial, sans-serif;
  width:100%;
  background:#626060;
  line-height:2em;
  border:none;
  box-shadow:0px 0px 5px 1px rgba(0,0,0,0.1);
  padding:10px;
  -webkit-transition: height 2s ease;
  -moz-transition: height 2s ease;
  -ms-transition: height 2s ease;
  -o-transition: height 2s ease;
  transition: height 2s ease;
}

* {
  -webkit-font-smoothing:antialiased !important;
}

.dropzone {
  position: relative;
  border: 5px dotted #FFF;
  border-radius: 20px;
  color: white;
  font: bold 24px/200px arial;
  height: 200px;
  margin: 30px auto;
  text-align: center;
  width: 200px;
}

.dropzone.hover {
  border: 5px solid #FE5;
  color: #FE5;
}

.dropzone.dropped {
  background: #222;
  border: 5px solid #444;
}

.dropzone div {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
}

.dropzone img {
  border-radius: 10px;
  vertical-align: middle;
  max-width: 95%;
  max-height: 95%;
}

.dropzone [type="file"] {
  cursor: pointer;
  position: absolute;
  opacity: 0;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
}
</style>
<script>
$(function() {
	  
	  $('#dropzone').on('dragover', function() {
	    $(this).addClass('hover');
	  });
	  
	  $('#dropzone').on('dragleave', function() {
	    $(this).removeClass('hover');
	  });
	  
	  $('#dropzone input').on('change', function(e) {
	    var file = this.files[0];

	    $('#dropzone').removeClass('hover');
	    
	    if (this.accept && $.inArray(file.type, this.accept.split(/, ?/)) == -1) {
	      return alert('File type not allowed.');
	    }
	    
	    $('#dropzone').addClass('dropped');
	    $('#dropzone img').remove();
	    
	    if ((/^image\/(gif|png|jpeg)$/i).test(file.type)) {
	      var reader = new FileReader(file);

	      reader.readAsDataURL(file);
	      
	      reader.onload = function(e) {
	        var data = e.target.result,
	            $img = $('<img />').attr('src', data).fadeIn();
	        
	        $('#dropzone div').html($img);
	      };
	    } else {
	      var ext = file.name.split('.').pop();
	      
	      $('#dropzone div').html(ext);
	    }
	  });
	});
</script>
<script>
$(function() {
	  
	  $('#dropzone2').on('dragover', function() {
	    $(this).addClass('hover');
	  });
	  
	  $('#dropzone2').on('dragleave', function() {
	    $(this).removeClass('hover');
	  });
	  
	  $('#dropzone2 input').on('change', function(e) {
	    var file = this.files[0];

	    $('#dropzone2').removeClass('hover');
	    
	    if (this.accept && $.inArray(file.type, this.accept.split(/, ?/)) == -1) {
	      return alert('File type not allowed.');
	    }
	    
	    $('#dropzone2').addClass('dropped');
	    $('#dropzone2 img').remove();
	    
	    if ((/^image\/(gif|png|jpeg)$/i).test(file.type)) {
	      var reader = new FileReader(file);

	      reader.readAsDataURL(file);
	      
	      reader.onload = function(e) {
	        var data = e.target.result,
	            $img = $('<img />').attr('src', data).fadeIn();
	        
	        $('#dropzone2 div').html($img);
	      };
	    } else {
	      var ext = file.name.split('.').pop();
	      
	      $('#dropzone2 div').html(ext);
	    }
	  });
	});
</script>
<script>
var app = angular.module('myApp', []);

app.controller('AppCtrl', ['$scope', '$http', '$timeout', function($scope, $http, $timeout) {
  
  // Load the data
  $http.get('http://www.corsproxy.com/loripsum.net/api/plaintext').then(function (res) {
		$scope.loremIpsum = res.data;
    $timeout(expand, 0);
  });
  
  $scope.autoExpand = function(e) {
        var element = typeof e === 'object' ? e.target : document.getElementById(e);
    		var scrollHeight = element.scrollHeight -60; // replace 60 by the sum of padding-top and padding-bottom
        element.style.height =  scrollHeight + "px";    
    };
  
  function expand() {
    $scope.autoExpand('TextArea');
  }
}]);
</script>
<script>
function submitButton(){
	var accountForm = $("#accountForm");
	accountForm.attr("method", "post");
	accountForm.attr("action", "account");
	accountForm.submit();
}
</script>
</head>
<body>
<div class="container">
	<form id="accountForm" role="form" action="account" method="post">
	<div style="width:500px; top:12%;" id="login-box">
		<!-- 로고, 뒤로/다음 버튼 -->
		<div class="logo">
			<a style="color:white;" href="/awesome"><img src="./resources/contents/images/back.png"></a>
			<a style="color:white; float:right;" href="#" onclick="submitButton();"><img src="./resources/contents/images/next.png"></a>
			<img src="./resources/contents/images/microphone.png" class="img img-responsive img-circle center-block"/>
			<h1 class="logo-caption"><span class="tweak">A</span>WESOME <span class="tweak">V</span>OICE</h1>
		</div><!-- /.logo -->
		
		<!-- 회원 가입 : 입력 란 -->
		<div class="controls">
			<div class="dropzone" id="dropzone" style="float:left; margin-left:15px;margin-right:30px;">
			  <div><img src="./resources/contents/images/user.png"></div>
			  <input id="m_img" name="m_img" type="file" accept="image/png, application/pdf" />
			</div>
			<div class="dropzone"id="dropzone2" style="float:left;">
			  <div><img src="./resources/contents/images/microphone2.png"></div>
			  <!-- <input id="m_voice" name="m_voice" type="file" /> -->
			</div>
			<input type="text" name="m_id" placeholder="Username" class="form-control" />
			<input type="text" name="m_pw" placeholder="Password" class="form-control" />
			<div ng-app="myApp">
				<div ng-controller="AppCtrl" align="center">
					<textarea name="m_info" id="TextArea" ng-model="loremIpsum" ng-keyup="autoExpand($event)" placeholder="Writing your Introduce." ></textarea>
				</div>
			</div>
			<!-- <button id="account"type="button" class="btn btn-default btn-block">Acount</button> -->
			
		</div><!-- /.controls -->
	</div><!-- /#login-box -->
	</form>
</div><!-- /.container -->
<div id="particles-js"></div>
</body>
</html>

