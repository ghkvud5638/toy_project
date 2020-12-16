<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<style type="text/css">
#allimSpaceWrap{
	width: 280px; 
	height: 300px; 
 	background-color: #333;  
	position: absolute;
	z-index: 999;
	overflow: scroll;
	overflow-x: hidden;
	margin:  -25px 0 0 1500px;
	border-radius: 10px;
	padding: 10px;
}
.eachAllimBoxClass{
/* 	border-bottom: 1px solid #ccc; */
	width: 250px;
	height: 60px; 
	color:white;
	cursor: pointer;
}
.eachAllimBoxClass:hover{
/* 	opacity: .8; */
}
.eachAllimBoxInsideClass{
	width: 240px;
    height: 55px;	
    border-radius: 10px;
    padding: 3px;
}
.eachAllimBoxInsideClass:hover{
	opacity: .8;
	background-color: #565454;
}
#box{
	border-radius: 70%;
    overflow: hidden;
    width:50px; 
    height:50px;
	float: left;
}

    
}
#allimImg{
	object-fit: cover;
	width: 100%;
    height: 100%;
}
#allimTxtDiv{
	margin: 0px -12px 3px 50px;
    padding: 6px 0px 6px 9px;
}

.N{
	 width: 7px;
     height: 7px;
     border-radius: 50%;
     background-color: #2E89FF;
     margin: 0px 0px -6px 2px;
}
/* #2E89FF */
</style>

<script type="text/javascript">
$(document).ready(function(){
	connectWs();
})


function connectWs(){
	var ws = new WebSocket("ws://192.168.25.33:8088/allimSocket");
	
    ws.onopen = function(event){
       	$.ajax({
    		url : '/allim/list',
    		type : 'POST',
    		contentType : "application/json",
    		dataType: 'json',
    		success : function(data) {
    			
    			console.log(data)
    			var startTxt = "<div id='eachAllimBox'><div id='eachAllimBoxInside'>";
    			var endTxt = "</div></div>";
    			var txt = "";
    			if (data != null) {
// 					$(data).each(function(index, item){
// 						$("#eachAllimBox").append(item.show_name) 
						
// 					})
					for (var i = 0; i < data.length; i++) {
						console.log(data[i].show_name+"을(를) " + data[i].status+ " 해주셨습니다.")
						
						//data[i].is_read='N' 이면 class에 circle 추가
// 						var read = '';
// 						if (data[i].is_read =='Y') {
							
// 						}
						
						if (data[i].status=="pay") {
							txt = "<div class='eachAllimBoxClass' id='eachAllimBox_"+i+"'><input type='hidden' id='hiddenAllimId_"+i+"' value='"+data[i].allim_id+"'/><div class='eachAllimBoxInsideClass' id='eachAllimBoxInside_"+i+"'>"+
									"<div class='"+data[i].is_read+"' id='circle_"+i+"'></div><div id='box'><img style='width:100%; height:100%;' id='allimImg_"+i+"' src='"+data[i].show_image+"'/></div>" + "<div id='allimTxtDiv_"+i+"'>'"+data[i].show_name+"' 결제 완료</div>" + endTxt
						}
						if (data[i].status=="book") {
							txt = "<div class='eachAllimBoxClass' id='eachAllimBox_"+i+"'><input type='hidden' id='hiddenAllimId_"+i+"' value='"+data[i].allim_id+"'/><div class='eachAllimBoxInsideClass' id='eachAllimBoxInside_"+i+"'>"+
									"<div class='"+data[i].is_read+"' id='circle_"+i+"'></div><div id='box'><img style='width:100%; height:100%;' id='allimImg_"+i+"' src='"+data[i].show_image+"'/></div>" + "<div id='allimTxtDiv_"+i+"'>'"+data[i].show_name+"' 예매 완료</div>" + endTxt
						}
						$("#allimInsideWrap").append(txt)
					}
					
					var id='';
					$(".eachAllimBoxClass").on("click",function(e){						
						//뽑아낸 allim_id값을 매개로 전달하여 이미 읽은 것인지 체크
						//이미 읽었다 -> isRead 컬럼 Y로 변경 (isRead 컬럼은 기본으로 N)
						//ajax로?
						
						id = $("#hiddenAllimId_"+e.target.id.split('_')[1]).val()
						console.log("id : "+id)
						$.ajax({
							url : '/allim/isRead',
				    		type : 'POST',
				    		data :  id,
				    		contentType : "application/json",
				    		dataType: 'json',    		
				    		success : function(res) {
				    			console.log(res)
				    		},error : function(err){
				    			console.log(err)
				    		}
						})
								
						location.href="/myPage/bookList"				
					})
					
					
				}    				
    		},
    		error : function(err){
//     			alert('err');
    			alert(err);
    		}
       	});
        if(event.data === undefined){
      		return;
        }
    };

	ws.onmessage = function(event){
	}	
	
	ws.onclose = function(event){
	    console.log("연결 종료");
	}
	        
}

</script>



<div id="allimInsideWrap">

<!-- 		<div id="eachAllimBox"> -->

<!-- 		</div> -->

</div>






