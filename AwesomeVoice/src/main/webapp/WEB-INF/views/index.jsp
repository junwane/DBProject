<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Awesome Voice</title>
<meta name="description"
	content="Neuer is a responsive portfolio template for creative people.">
<meta name="author" content="ThemeBang">
<meta name="designer" content="ThemeBang">
<meta name="reply-to" content="themebang@gmail.com">
<meta name="copyright" content="(c) 2017 ThemeBang - www.themebang.com">
<meta name="robots" content="index, follow">
<!--Verifitication-->
<meta name="google-site-verification" content="">
<meta name="alexaVerifyID" content="">
<meta name="yandex-verification" content="">
<meta name="msvalidate.01" content="">
<!-- / Verifitication-->
<link rel="shortcut icon"
	href="resources/contents/images/icons/favicon.png">
<link rel="canonical" href="http://www.domainname.com/">
<!-- CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300i,700"
	rel="stylesheet" type="text/css">
<link href="resources/contents/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="resources/contents/css/hover-min.css" rel="stylesheet"
	type="text/css">
<link href="resources/contents/portfolio/css/cubeportfolio.css"
	rel="stylesheet" type="text/css">
<link href="resources/contents/portfolio/css/portfolio.min.css"
	rel="stylesheet" type="text/css">
<link href="resources/contents/css/customize.css" rel="stylesheet"
	type="text/css">
<style>
a {
	text-decoration: none;
}
</style>
<!-- Font Awesome -->
<script src="https://use.fontawesome.com/e9965a82bb.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		$(".main").click(function() {
			window.location.href = "mainPage";
		});

		$(".AllSounds").click(function() {
			window.location.href = "AllSounds";
		});

		$(".main").click(function() {
			window.location.href = "mainPage";
		});

		$(".SongSounds").click(function() {
			window.location.href = "SongSounds";
		});

		$(".CopySounds").click(function() {
			window.location.href = "CopySounds";
		});

		$(".LookForSounds").click(function() {
			window.location.href = "LookForSounds";
		});

		$(".UnknownSounds").click(function() {
			window.location.href = "UnknownSounds";
		});

		$(".GradeSounds").click(function() {
			window.location.href = "GradeSounds";
		});
		
		$(".myPage").click(function() {
			window.location.href = "MyPage";
		});
		
		
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<!--Menu-->
		<div class="hidden-xs menu">
			<div
				class="list-group cbp-l-filters-button js-filters-juicy-projects">
				<div data-filter="*" class="cbp-filter-item list-group-item logo">
					<span style="font-weight: bold; font-size: 35px;" class="main">AWESOME
						VOICE</span>
				</div>

				<div
					class="cbp-filter-item list-group-item hvr-underline-from-left text-uppercase main">
					BEST SOUNDS</div>
				<div
					class="cbp-filter-item list-group-item hvr-underline-from-left text-uppercase AllSounds">
					ALL SOUNDS</div>
				<div
					class="cbp-filter-item list-group-item hvr-underline-from-left text-uppercase SongSounds">
					SONG SOUNDS</div>
				<div
					class="cbp-filter-item list-group-item hvr-underline-from-left text-uppercase CopySounds">
					COPY SOUNDS</div>
				<div
					class="cbp-filter-item list-group-item hvr-underline-from-left text-uppercase LookForSounds">
					LOOK FOR SOUNDS</div>
				<div
					class="cbp-filter-item list-group-item hvr-underline-from-left text-uppercase UnknownSounds">
					UNKNOWN SOUNDS</div>
				<div
					class="cbp-filter-item list-group-item hvr-underline-from-left text-uppercase GradeSounds">
					GRADE SOUNDS</div>
				<!--Contact-->
				<div class="list-group-item">
					<address>
						<strong class="myPage">USER</strong> <a href="MyPage"><i class="fa fa-cog myPage"
							aria-hidden="true"></i></a><br>

					</address>
				</div>
				<!--/Contact-->
			</div>
		</div>

		<!-- /Menu-->
		<div class="main">
			<!--Mobile Menu-->
			<!-- <div class="visible-xs">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div id="BtnMobilMenu" class="navbar-header text-center">
							<img data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false" src="resources/contents/images/logo.png"
								alt="img2" />
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav js-filters-juicy-projects">
								<li
									class="cbp-singlePage list-group-item text-center hvr-underline-from-center text-uppercase"><a
									href="about-me.html" class="cbp-singlePage"
									data-cbp-singlePage="myCustomSinglePage1">About Me</a></li>
								<div
									class="cbp-filter-item list-group-item hvr-underline-from-left text-uppercase">
									BEST SOUNDS</div>
								<div
									class="cbp-filter-item list-group-item hvr-underline-from-left text-uppercase">
									ALL SOUNDS</div>
								<div
									class="cbp-filter-item list-group-item hvr-underline-from-left text-uppercase">
									SONG SOUNDS</div>
								<div
									class="cbp-filter-item list-group-item hvr-underline-from-left text-uppercase">COPY
									SOUNDS</div>
								<div
									class="cbp-filter-item list-group-item hvr-underline-from-left text-uppercase">
									LOOK FOR SOUNDS</div>
								<div
									class="cbp-filter-item list-group-item hvr-underline-from-left text-uppercase">
									UNKNOWN SOUNDS</div>
								<div
									class="cbp-filter-item list-group-item hvr-underline-from-left text-uppercase">
									GRADE SOUNDS</div>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div> -->

		<!-- /Mobile Menu-->

		<jsp:include page="${contents}.jsp"></jsp:include>
	</div>
	<!--footer -->
	<footer class="footer">
		<div class="container-fluid">
			<div class="row">
				<div class="hidden-xs col-sm-3 col-md-4">
					<small class="footer-small">2017 © &nbsp; Made by WDB</small>
				</div>
				<div class="col-xs-12 col-sm-9 col-md-8">
					<!--Address -->
					<div class="visible-xs text-center">
						<address>
							<strong>Company, Inc.</strong><br> 1234 Lorem Street, 100<br>
							Lorem Ipsum City, 10100<br> <abbr title="Phone">P:</abbr>
							(123) 456-7890 <br /> <br /> <i aria-hidden="true"
								data-toggle="modal" data-target="#map"
								class="glyphicon glyphicon-map-marker"></i>
						</address>
						<address>
							<strong>Your Name</strong><br> <a href="mailto:#">your.name@email.com</a>
						</address>
					</div>
					<!-- /Address -->
					<!--Social Media -->
					<ul class="social-icons">
						<li class="facebook"><a href="#" target="_blank">Facebook</a>
						</li>
						<li class="twitter"><a href="#" target="_blank">Twitter</a></li>
						<li class="googleplus"><a href="#" target="_blank">Google
								+</a></li>
						<li class="youtube"><a href="#" target="_blank">YouTube</a></li>
						<li class="pinterest"><a href="#" target="_blank">Pinterest</a></li>
						<li class="vimeo"><a href="#" target="_blank">Vimeo</a></li>
						<li class="linkedin"><a href="#" target="_blank">LinkedIn</a></li>
						<li class="rss"><a href="#" target="_blank">RSS Feed</a></li>
					</ul>
					<div class="clearfix"></div>
					<!-- /Social Media -->
				</div>
			</div>
		</div>
	</footer>
	<!-- /footer -->
	<!-- /.modal Google Maps -->
	<div id="map" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-default">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h5>
						<strong>Company, Inc.</strong>
					</h5>
					<address>
						1234 Lorem Street, 100. Lorem Ipsum City, 10100. <abbr
							title="Phone">P:</abbr> (123) 456-7890
					</address>
				</div>
				<div class="modal-body">
					<div id="map-canvas" style="width: 100%; height: 450px">
						<iframe
							src="https://www.google.com/maps/embed/v1/place?q=place_id:ChIJLU7jZClu5kcR4PcOOO6p3I0&key=AIzaSyBad8Je938IWh7fiz3CeCzbChFrl6a81bo"
							height="450" style="border: 0" allowfullscreen></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.modal Google Maps-->
	<!-- jQuery -->
	<script src="resources/contents/js/jquery-1.12.4.min.js"
		type="text/javascript"></script>
	<script src="resources/contents/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="resources/contents/portfolio/js/jquery.cubeportfolio.js"
		type="text/javascript"></script>
	<script src="resources/contents/portfolio/js/portfolio-1.js"
		type="text/javascript"></script>
	<script src="resources/contents/js/retina.min.js"
		type="text/javascript"></script>
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
        <script src="contents/js/html5shiv.min.js"></script>
        <script src="contents/js/respond.min.js"></script>
        <![endif]-->
	<script src="resources/contents/js/main.js" type="text/javascript"></script>
	<!--Google Analytics -->
	<!-- <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','../../../www.google-analytics.com/analytics.js','ga');

          ga('create', 'UA-24357544-3', 'auto');
          ga('send', 'pageview');

        </script> -->
	<!-- /Google Analytics -->
</body>
</html>