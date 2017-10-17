<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	border :1px solid black;
}

#chatting {
	width : 900px;
	height : 600px;
	border : 1px solid black;
	position:absolute;
	left:250px;
	background:rgba(255, 255, 255, 0.7);
	z-index:99999;
	border-left: 1px solid #262626;
	border-bottom: 1px solid #262626;
	
}

#chattingView {
	width : 900px;
	height : 500px;
	border : 1px solid black ;
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
	width: 700px;
	height : 98px;
	
}
#chattingSend button {
	width : 93px;
	height : 96px;
	margin-top : -5px;
}

#audio {
	width : 93px;
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


</style>

</head>
<div id="wrap">
	<div id="m_id" style="display:none">${m_id}</div>
	<div id="chatting">
		<div id="chattingView"></div>
		<div id="chattingSend">
			<input type="textarea" id="message">
			<audio id="audio" controls autoplay style="display:none"></audio>
			<button id="btn-start-recording">Start Recording</button> 
    		<button id="btn-stop-recording" disabled>Stop Recording</button> 
			<button class="btn" id="sendBtn">전송</button>
		</div>
	</div>
	<div id="chattingDetail">
		<div id="chattingTitle">
			<h2>ddddd</h2>
		</div>
		<div id="chattingOther">
			<img src="./resources/contents/images/default.png" >
			<h3>닉네임</h3>
		</div>
	</div>
</div>

<script>
var audio = document.querySelector('audio'); 
function captureMicrophone(callback) { 
    navigator.getUserMedia = navigator.getUserMedia || navigator.mozGetUserMedia || navigator.webkitGetUserMedia; 
    navigator.getUserMedia({audio: true}, callback, function (error) { 
        alert('Unable to access your microphone.'); 
         console.error(error); 
    }); 
} 


function stopRecordingCallback() { 
    
    var blob = recorder.getBlob(); 
    console.log("blob : " + blob);
    audio.src = URL.createObjectURL(blob); 
    recorder.microphone.stop(); 


    createAudioElement(window.URL.createObjectURL(blob)); 
} 


var recorder; // globally accessible 
document.getElementById('btn-start-recording').onclick = function () { 

    this.disabled = true; 
    $("#message").css("display","none");
    $("#audio/.").css("display","inline-block");
    captureMicrophone(function (microphone) { 
        audio.src = URL.createObjectURL(microphone); 
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
    const downloadEl = document.createElement('a'); 
    downloadEl.style = 'display: block'; 
    downloadEl.innerHTML = 'download'; 
    downloadEl.download = 'audio.wav'; 
    downloadEl.href = blobUrl; 
    const audioEl = document.createElement('audio'); 
    audioEl.controls = true; 
    const sourceEl = document.createElement('source'); 
    sourceEl.src = blobUrl; 
    sourceEl.type = 'audio/wav'; 
    audioEl.appendChild(sourceEl); 
    document.body.appendChild(audioEl); 
    document.body.appendChild(downloadEl); 
} 
	
 


</script>