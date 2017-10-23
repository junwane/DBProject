<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="./resources/contents/css/star.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	  
	  /* 1. Visualizing things on Hover - See next part for action on click */
	  $('#stars li').on('mouseover', function(){
	    var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on
	   
	    // Now highlight all the stars that's not after the current hovered star
	    $(this).parent().children('li.star').each(function(e){
	      if (e < onStar) {
	        $(this).addClass('hover');
	      }
	      else {
	        $(this).removeClass('hover');
	      }
	    });
	    
	  }).on('mouseout', function(){
	    $(this).parent().children('li.star').each(function(e){
	      $(this).removeClass('hover');
	    });
	  });
	  
	  
	  /* 2. Action to perform on click */
	  $('#stars li').on('click', function(){
	    var onStar = parseInt($(this).data('value'), 10); // The star currently selected
	    var stars = $(this).parent().children('li.star');
	    
	    for (i = 0; i < stars.length; i++) {
	      $(stars[i]).removeClass('selected');
	    }
	    
	    for (i = 0; i < onStar; i++) {
	      $(stars[i]).addClass('selected');
	    }
	    
	    // JUST RESPONSE (Not needed)
	    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
	    var msg = "";
	    if (ratingValue > 1) {
	        msg = "Thanks! You rated this " + ratingValue + " stars.";
	    }
	    else {
	        msg = "We will improve ourselves. You rated this " + ratingValue + " stars.";
	    }
	    responseMessage(msg);
	    
	  });
	  
	  
	});


	function responseMessage(msg) {
	  $('.success-box').fadeIn(200);  
	  $('.success-box div.text-message').html("<span>" + msg + "</span>");
	}
</script>
<style>
	#myInfo{
		border-bottom:1px dotted gray;
		margin-left:200px;
		text-align:center;
	}
	#myPage{
		font-size:30px;
		color:gray;
	}
	#userId{
		font-size:25px;
		margin-right:10px;
	}
	button{
		font-size:11px;
		background-color:lightgray;
		border:1px solid lightgray;
	}
	
</style>
<p id="myPage">myPage</p>
<div id="myInfo">
	<div>
		<img id="profImg" style="width:70px; margin-right:20px;" src="./resources/contents/images/man.png">
		<span id="userId">${m_id}</span>
		<button>프로필 수정</button>

  		<!-- 내 목소리 평점 -->
  		<div class='rating-stars text-center'>
		    <ul id='stars'>
		      <li class='star' title='Poor' data-value='1'>
		        <i class='fa fa-star fa-fw'></i>
		      </li>
		      <li class='star' title='Fair' data-value='2'>
		        <i class='fa fa-star fa-fw'></i>
		      </li>
		      <li class='star' title='Good' data-value='3'>
		        <i class='fa fa-star fa-fw'></i>
		      </li>
		      <li class='star' title='Excellent' data-value='4'>
		        <i class='fa fa-star fa-fw'></i>
		      </li>
		      <li class='star' title='WOW!!!' data-value='5'>
		        <i class='fa fa-star fa-fw'></i>
		      </li>
		    </ul>
		 </div>
	</div>	
</div>
<div style="font-size:25px; color:gray; text-align:center; margin-top:60px;">Recent writing</div>	
<div class="portfolio-content portfolio-1" style="margin-top: 5%;">
	<div class="cbp js-grid-juicy-projects">
		<c:if test="${myPosts != null}">

			<c:forEach items="${myPosts}" var="myPosts" varStatus="i">
				<div class="cbp-item movie" data-id="${myPosts.b_title}">
					<div class="cbp-item-wrap">
						<div class="cbp-caption">
							<div class="cbp-caption-defaultWrap">
								 <img src="resources/contents/images/lookForSounds.jpg" alt="img3">
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
							class="cbp-l-grid-projects-title uppercase text-center uppercase text-center">${myPosts.b_title}</div>
						
						<div
						class="cbp-l-grid-projects-desc uppercase text-center uppercase text-center">dd</div>

					</div>
				</div>

			</c:forEach>

		</c:if>

		<c:if test="${myPosts == null}">
			<div>게시물이 존재하지 않습니다.</div>
		</c:if>

	</div>
</div>