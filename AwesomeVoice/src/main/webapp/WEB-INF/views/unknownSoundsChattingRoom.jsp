<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<head>
<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>
<script src="https://cdn.WebRTC-Experiment.com/RecordRTC.js"></script>
<script src="./resources/contents/js/sockjs.js"></script>
<script src="./resources/contents/js/chat.js"></script>

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

#chatting {
	width : 900px;
	height : 600px;
	border : 1px solid black;
	position:absolute;
	left:250px;
	background:rgba(255, 255, 255, 0.7);
	z-index:99999;
	
}

#chattingView {
	width : 900px;
	height : 500px;
	overflow-y:scroll;
	position:relative;
 	display:block;
    text-align:center;
    color:#c0c0c0;
 	line-height:38px;
    cursor:default;
    padding:10px;
}
#chattingSend {
	width : 900px;
	height : 100px; 
	border : 1px solid black;
}
#chattingSend input[type='textarea'] {
	width: 710px;
	height : 98px;
	
}
#chattingSend button {
	width : 93px;
	
}

#audio {
	width : 710px;
	height : 96px;
	margin-top : -5px;
}

#chattingDetail{
	position:absolute;
	left : 1150px;
	width: 500px;
	height : 600px;
	border: 1px solid black;
}

#chattingTitle {
	width : 100% ;
	height : 80px;
	background : white ;
	padding : 10px;
	
}
#chattingTitle h2 {
	margin : 0;
	line-height : 60px;
}
#chattingOther {
	width : 100%;
	height : 120px;
	background : gray ;
	line-height : 100px;
	padding : 10px;

}
#chattingOther h3 {
	margin : 0 ;
	display : inline-block ;
}
#chattingOther img {
	width : 150px;
	height : 100px;
	border-radius:50%;
	
}

.self {
 	padding:0.5rem;
 	overflow:hidden;
 	display:inline-block;
 	float:right;
 	
}
 
.other {
    padding:0.5rem;
 	overflow:hidden;
 	display:inline-block;
 	float:left;
 	clear:both;
}
 
.user img {
    width:25px;
 	height:25px;
 	border-radius:100%;
 	-webkit-border-radius:100%;
 	-moz-border-radius:100%;
 	-ms-border-radius:100%;
    background-color:rgba(255,255,255,0.9);
 	-webkit-touch-callout:none;
 	-webkit-user-select:none;
 	-moz-user-select:none;
 	-ms-user-select:none;
 }
 
.other .msg { order:1; border-top-left-radius:0px; /** box-shadow:-1px 2px 0px #D4D4D4; **/ }
.self .msg { order:1; border-bottom-right-radius:0px; /** box-shadow:1px 2px 0px #D4D4D4; **/ }
.self .avatar { order:2; }
 
.msg {
	background: #484848;
    min-width: 200px;
    max-width: 400px;
    padding: 10px;
    border-radius: 10px;
    /* color: white; */
    /* box-shadow: 0px 2px 0px rgba(0, 0, 0, 0.07); */
    margin-top: 38px;
    border: 1px solid #000000;
}
 
.msg p {
 	font-size:22px;
 	margin:0 0 0.2rem 0;
 	color:white;
 	word-break:normal;
 	word-break:break-all;    
}
.msg img {
	position:relative;
	display:inline-block;
	float:left;
	width:450px;
	border-radius:5px;
	box-shadow:0px 0px 3px #eee;
	transition:all .4s cubic-bezier(0.565, -0.260, 0.255, 1.410);
	cursor:default;
	-webkit-touch-callout:none;
	-webkit-user-select:none;
	-moz-user-select:none;
	-ms-user-select:none;
}
 
.user { display:inline-block; float:left; height:28px; color:black; font-size : 23px }
.user span { line-height:28px; }
@media screen and (max-width:800px) {
 	.msg img { width:300px; }
}
@media screen and (max-width:550px) {
 	.msg img { width:200px; }
}
 
.msg time {
 	font-size:18px;
 	color:#000000;
    margin-top:10px;
    float:right;
 	cursor:default;
    -webkit-touch-callout:none;
    -webkit-user-select:none;
    -moz-user-select:none;
    -ms-user-select:none;
}
.msg time:before{
 	content:"\f017";
    color:#000000;
    font-family:FontAwesome;
    display:inline-block;
    margin-right:4px;
}
#chatArea {width : 710px; height : 98px; float:left; }
#recordButton { width : 90px ; height : 98px; float:left; }
#btn-start-recording { height : 48px ;  width : 90px;}
#btn-stop-recording { height : 48px; width : 90px;}
#sendBtn { height : 96px ;}
#exit { position : absolute ; right : 250px; top : 120px;}

</style>
</head>
<div class="page-wrapper">
	<button id="exit" class="btn" onclick="exitChatting()">나가기</button>
</div>
<div id="wrap">
	<div id="m_id" style="display:none">${m_id}</div>
	<div id="chatting">
		<div id="chattingView"></div>
		<div id="chattingSend">
			<div id="chatArea">
				<input type="textarea" id="message">
				<audio id="audio" controls autoplay style="display:none"></audio>
			</div>
			<div id="recordButton">
				<button id="btn-start-recording">Start</button> 
    			<button id="btn-stop-recording" disabled>Stop</button>
			</div>
			<button class="btn" id="sendBtn">전송</button>
		</div>
	</div>
	<div id="chattingDetail">
		<div id="chattingTitle">
			<h2>${cr_title}</h2>
		</div>
		<c:if test="${cr_id != null }">
			<div id="chattingOther">
				<img src="./resources/contents/images/default.png" >
				<h3>${cr_id}</h3>
			</div>
		</c:if>

		
	</div>
</div>
<script>


var audio = document.querySelector('audio'); 
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();

	if(dd<10) {
	    dd='0'+dd
	} 
	
	if(mm<10) {
	    mm='0'+mm
	} 
	
	today = yyyy+""+mm+""+dd+""+today.getHours()+""+today.getMinutes()+""+today.getSeconds();
	
	

function captureMicrophone(callback) { 
    navigator.getUserMedia = navigator.getUserMedia || navigator.mozGetUserMedia || navigator.webkitGetUserMedia; 
    navigator.getUserMedia({audio: true}, callback, function (error) { 
        alert('Unable to access your microphone.'); 
         console.error(error); 
    }); 
} 


function stopRecordingCallback() { 
    
    blob = recorder.getBlob(); 
    console.log("blob : " + blob);
    audio.src = URL.createObjectURL(blob); 
    audio.play(); 
    recorder.microphone.stop(); 

	console.log("DDDD : " +window.URL.createObjectURL(blob));
	
	$("#message").val(window.URL.createObjectURL(blob));
    createAudioElement(window.URL.createObjectURL(blob)); 
} 


var recorder; // globally accessible 
document.getElementById('btn-start-recording').onclick = function () { 
	$("#audio").css("display","inline-block");
	$("#message").css("display","none");
    this.disabled = true; 
    captureMicrophone(function (microphone) { 
        audio.src = URL.createObjectURL(microphone); 
        audio.play(); 
        recorder = RecordRTC(microphone, { 
            type: 'audio', 
            recorderType: StereoAudioRecorder, 
            numberOfAudioChannels: 1, // or leftChannel:true 
            desiredSampRate: 16000 
        }); 
        recorder.startRecording(); 
        // release microphone on stopRecording
        recorder.microphone = microphone; 
        document.getElementById('btn-stop-recording').disabled = false; 
        }); 
    }; 
    document.getElementById('btn-stop-recording').onclick = function () { 
    this.disabled = true; 
    recorder.stopRecording(stopRecordingCallback); 
    document.getElementById('btn-start-recording').disabled = false; 
}; 




function createAudioElement(blobUrl) { 

    
    


}


function exitChatting(){
	
	var cr_no = ${cr_no};

	
	$.ajax({
		url : "exitChatting",
		type : "POST",
		data : {
			cr_no : cr_no
		},
		success : function(data){
			window.location = "UnknownSounds" ;
			
		}
	})
	
}





</script>



