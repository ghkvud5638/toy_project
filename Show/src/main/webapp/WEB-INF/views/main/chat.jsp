<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">


.myTalk{
    border-color: #f7e600;
    box-shadow: -1px 1px 0 rgba(0,0,0,0.3);
    background-color: #f7e600;
    width: 133px;
    padding: 3px;
	margin: 9px 0 0 114px;
    border-radius: 11px;

}
.oppositeTalk{
	background-color:white;
    width: 151px;
    padding: 3px;
    margin: 32px 0 0 0px;
    border-radius: 11px;
}
.myMiddle{
}
.chatWrap{
/* 	background-color: #6884b3; */
height: 292px;
/* 	overflow:scroll; */
}

/* #messageinput{ */
/* 	border:none; */
/* 	width: 438px; */
/* 	height:55px; */
/* } */
.sendArea{
	float: left;
}
</style>


<body>
<div class="chatWrap">
    <div>
        <button type="button" onclick="openSocket();">대화방 참여</button>
        <button type="button" onclick="closeSocket();">대회방 나가기</button>        
    	<br/><br/><br/>
    </div>
<!--     Server responses get written here -->
    <div id="messages">
    </div>
</div>

<input type="text" id="sender" value="${sessionScope.member_id}" style="display: none;">
<!-- <div class="sendArea"> -->
<!--  <input type="text" id="messageinput"/> -->
<!--  <button type="button" class="sendBtn" onclick="send();">메세지 전송</button> -->
<!-- </div> -->

<!--         <button type="button" onclick="javascript:clearText();">대화내용 지우기</button> -->
    
    
    
    <!-- websocket javascript -->
    <script type="text/javascript">
        var ws;
        var messages = document.getElementById("messages");
        
        function openSocket(){
        	
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
                writeResponse("WebSocket is already opened.");
                return;
            }
     
            //웹소켓 객체 만드는 코드
			ws = new WebSocket("ws://IP:8088/echo.do");
            console.log(ws)
            
            ws.onopen = function(event){
                if(event.data === undefined){
              		return;
                }
            };
            
            ws.onmessage = function(event){

//                 console.log('writeResponse');
                console.log(event.data)
                
                var chatMsg = event.data
                
                console.log(chatMsg.substring(0,2))
                if (chatMsg != '') {
	                if (chatMsg.substring(0,3) == '관리자') {
						var printHTML = "<div class='oppositeTalk'>";
						printHTML += "<strong>"+chatMsg+"</strong>";
						printHTML += "</div>";
						$("#messages").append(printHTML);
		            	$(".chatWrap").scrollTop($(".chatWrap")[0].scrollHeight);
	               			
	                }else{
						var printHTML = "<div class='myTalk'>";
						printHTML += "<strong>"+chatMsg+"</strong>";
						printHTML += "</div>";
						$("#messages").append(printHTML);
	            		$(".chatRoomInside").scrollTop($(".chatRoomInside")[0].scrollHeight);
					}
                }
            };
            
            ws.onclose = function(event){
                writeResponse("대화 종료");
            }
            
        }
        
        function writeResponse(text){
            messages.innerHTML += "<br/>"+text;
        }
        
        
        function send(){
            var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value;
            ws.send(text);
            text = "";
            $("#messageinput").val('');
        }
        
        function closeSocket(){
            ws.close();
            $(".chatRoomInside").empty();
            $(".chatRoomInside").load("/main/askBtn");
        }
        
        function clearText(){
            console.log(messages.parentNode);
            messages.parentNode.removeChild(messages)
      	}
        
        
        $("#messageinput").keydown(function(key){
        	if (key.keyCode==13) {
        		send()
			}
        })
        
        
         $(".closeBtn").click(function(){
        	 ws.close();
        	 setTimeout(function(){
				$(".chatRoom").css("margin-right","-400px")
			 },100)
			 $("#messageinput").val('');
        	 $(".chatRoomInside").empty();
        	 $(".chatRoomInside").load("/main/askBtn")
        })
        
     

        
  </script>
