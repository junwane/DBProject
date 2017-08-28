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
<style>
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
</head>
<body>
<div class="container">
	<div style="width:500px; top:20%;" id="login-box">
		<div class="logo">
			<img src="./resources/contents/images/microphone.png" class="img img-responsive img-circle center-block"/>
			<h1 class="logo-caption"><span class="tweak">A</span>WESOME <span class="tweak">V</span>OICE</h1>
		</div><!-- /.logo -->
		<div class="controls">
			<div class="dropzone" id="dropzone" style="float:left; margin-left:15px;margin-right:30px;">
			  <div><img src="./resources/contents/images/user.png"></div>
			  <input type="file" accept="image/png, application/pdf" />
			</div>
			<div class="dropzone"id="dropzone2" style="float:left;">
			  <div><img src="./resources/contents/images/microphone2.png"></div>
			  <input type="file" accept="image/png, application/pdf" />
			</div>
			<input type="text" name="username" placeholder="Username" class="form-control" />
			<input type="text" name="username" placeholder="Password" class="form-control" />
			<button id="account"type="button" class="btn btn-default btn-block">Acount</button>
			
		</div><!-- /.controls -->
	</div><!-- /#login-box -->
</div><!-- /.container -->
<div id="particles-js"></div>
<!--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js"></script>-->

</body>
</html>

