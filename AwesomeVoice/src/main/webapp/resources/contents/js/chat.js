/**
 * 
 */
var wsocket;
var groupCode ;
var m_id ;
var scrollData;

$(document).ready(function(){

	wsocket = new SockJS("/awesome/chat.sockjs");
	//wsocket = new WebSocket("ws://localhost:8080/awesome/fileserver");
	//wsocket.binaryType="arraybuffer";
	wsocket.onopen = onOpen;
	wsocket.onmessage = onMessage;
	wsocket.onclose = onClose;
	m_id = $("#m_id").text();

		// enter 버튼 누르면 글자가 쳐진다.
		$('#message').keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
				
			if(keycode == '13'){
				send(); 
			}
			
			event.stopPropagation();
		  
		});
			  
		$('#sendBtn').click(function() {  send(); });
		

})


function chatConnect(){
	
}
	 
function disconnect() {
	wsocket.close();
}
	 
function onOpen(evt) {
	 
}
		 
function onClose(evt) {
	  
}
	 
function onMessage(evt) {

	var data = evt.data;
	var afterStr = data.split(',');
	
	console.log("aftersTr : " + afterStr[2]);
	appendMessage(afterStr);
	  
}
	 
	 
function send() {
	
	
	console.log("usefd00 :" +m_id);
	var msg = $("#message").val();
	
	
	console.log("msg :" +msg);
	wsocket.send(m_id+","+msg );

		
	$("#message").val("");
		
		  
}

function appendMessage(msg) {
	//console.log("1번"+msg[0] );
	//console.log("2번"+msg[1] );
	
	if(msg == "2"){
		$.ajax({
			url : "unknownChattingOther",
			type: "POST",
			success : function(data){
				console.log("data : " + data);
				console.log("dd d : " + $("#chattingDetail").children().size());
				if($("#chattingDetail").children().size() == 1){
				$("#chattingDetail").append("<div id='chattingOther'><img src='./resources/contents/images/default.png' ><h3>"+data+"</h3></div>")
				}
			} 
		})
	}else{
	
			 
		var date = new Date() ;
		date = date.getHours() +"."+date.getMinutes() ;
			
		var target = $("#chattingView") ;
		
		//msg[0] : 사용자 id
		if(msg[0] == m_id){
			
			
			var message = $("<div></div>").addClass("self").css("clear","both") ;
	
			$("<div></div>").addClass("avatar user").append("<i class='fa fa-user margin-right-6'></i><span>"+m_id+"</span>").appendTo(message) ;
			console.log("msg[1].indexOf() : " + msg[1].indexOf("blob:"));
			if(msg[1].indexOf("blob:")==0){
				$("<div></div>").addClass("msg").append("<audio controls><source src='"+msg[1]+"' type='audio/wav'></audio>").append("<time>"+ date+"</time>").appendTo(message);
			}else{
				$("<div></div>").addClass("msg").append("<p>"+msg[1]+"</p>").append("<time>"+ date+"</time>").appendTo(message);
			}
	
	
		}else{
			
			var message = $("<div></div>").addClass("other").css("clear","both") ;
				 
			$("<div></div>").addClass("avatar user").append("<i class='fa fa-user margin-right-6'></i><span>"+msg[0]+"</span>").appendTo(message) ;
			if(msg[1].indexOf("blob") == 0){
				$("<div></div>").addClass("msg").append("<audio controls><source src='./resources/contents/20171019114822audio.wav' type='audio/wav'></audio>").append("<time>"+ date+"</time>").appendTo(message);
			}else{
				$("<div></div>").addClass("msg").append("<p>"+msg[1]+"</p>").append("<time>"+ date+"</time>").appendTo(message);
			}
		} 
			message.appendTo(target);
			setScrollDown();
	}
}
	 
function setScrollDown(){
	$("#chattingView").scrollTop($("#chattingView").height()*999);
}

