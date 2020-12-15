<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
// 		self.onerror=function() {return true;}
			
				
	var scrollHeight = 30;
	var scrollWidth = 20;

	var top = $(window).scrollTop() + scrollHeight
	, left = scrollWidth -$(window).scrollLeft() ;
	$(".Nav-sideMenu-WrapDiv").css("top", top+'px');
	$(".Nav-sideMenu-WrapDiv").css("right", left+"px");

	$('.Nav-sideMenu-li').click(function(){
		var idName = $(this).attr('id')
		, listText = ""
		, loc = ""
		console.log("클릭")
		
		if(idName == "Nav-sideMenu-Home"){
			listText = "홈입니다<br><br>"
		}
		if(idName == "Nav-sideMenu-showList"){
			listText = "공연목록입니다<br><br>"
			loc = "/attraction/nava"
		}
		if(idName == "Nav-sideMenu-attractionList"){
			listText = "볼거리목록입니다<br><br>"
			loc = "/attraction/nava"

		}
		if(idName == "Nav-sideMenu-visitList"){
			listText = "방문목록입니다<br><br>"
			loc = "/attraction/nava"

		}
	 	$(".Nav-sideMenu-listViewListDiv").css("opacity", "0");
		$(".Nav-sideMenu-li").css("background-color", "white")
		$(".Nav-sideMenu-li").css("text-decoration", "")
		$(".Nav-sideMenu-li").css("font-weight", "")
		$(".Nav-sideMenu-listViewText").html(listText);

		$('#'+idName).css("background-color", "gray")
		$('#'+idName).css("text-decoration", "underline")
		$('#'+idName).css("font-weight", "bolder")
		
		$.ajax({
					type: "GET" //요청 메소드
					, url: loc //요청 URL
					, data: {
								"curPage" : 1
								, "listNo" : 5
								, "chkNumber" : 5
							} //전달 파라미터
					, dataType: "html" //응답받은 데이터의 형식
					, success: function( res ) {
						console.log("성공")
						
						$(".Nav-sideMenu-listViewListDiv").css("transition", "all 1s ease-in-out");
				
						$(".Nav-sideMenu-listViewListDiv").css("opacity", "1");

						$(".Nav-sideMenu-listViewListDiv").html(res);
					}
					, error: function() {
						console.log("실패")
					}
					
				})	
	});
	//시작할때 목록 불러오기		
	$('#Nav-sideMenu-visitList').trigger("click");


		function sidebar(){
			
			top = $(window).scrollTop() + scrollHeight;
			$(".Nav-sideMenu-WrapDiv").css("top", top+'px');
	
			left = scrollWidth -$(window).scrollLeft() ;
			console.log("내값은"+left)
			$(".Nav-sideMenu-WrapDiv").css("right", left+'px');
		

		
		}
		
	
		$(window).scroll(()=> {
			sidebar();
// 			console.log($(window).scrollTop())
// 			console.log($(window).scrollLeft())	
		});	
	
		
		
		
	});
	

</script>

<style type="text/css">


	.Nav-sideMenu-WrapDiv {
		border:5px solid #ccc; 
		width:300px;
		 height:90%;
 		 position:absolute;
		right:0%;
		 z-index: 997;
	/*  	 left:calc(90%);  */
		background-color: white;
		border-radius: 7px;
	}
	
	.Nav-sideMenu-li{
		position:absolute;
		float:left;
		display:inline-block;
		width: 25%;
		background-color: white;
		padding: 10px;
		text-align:center;
		z-index: 999;
		top:0;
		left:0;
		border-bottom:1px solid black;
		
		
	}
	
	.Nav-sideMenu-li:nth-child(2){
		left:25%;
		border-left:1px solid black;
	}
	.Nav-sideMenu-li:nth-child(3){
		left:50%;
		border-left:1px solid black;
	}
	.Nav-sideMenu-li:last-child{
		left:75%;
		border-left:1px solid black;
	}

	.Nav-sideMenu-li:hover{
		cursor: pointer;
		background-color: #c3c3c3;
		text-decoration: underline;
	 	font-weight:bolder;
			 	
	}

.Nav-sideMenu-listViewDiv {

	width:100%;
	height:85%;
	margin-top:-15px;
	overflow-x:hidden;
	overflow-y:visible;

}

.Nav-sideMenu-listViewText {

	margin-left: 15px;
	font-size: 15px;
	font-weight: bolder;
	
}

.Nav-sideMenu-listViewListDiv {

	width:100%;
	margin:0 auto;
	position:relative;
	
}

#Nav-sideMenu-loadMore {
 
	text-align:center;
	border:1px solid #ccc;
	position:absolute;
	width:100%;
	bottom:0px;

}

#Nav-sideMenu-loadMore:hover {

	cursor: pointer;
	background-color: gray;
	text-decoration: underline;
	font-weight: bolder;

}

</style>

</head>
<body>
<div class="Nav-sideMenu-WrapDiv">
<ul>
<li class="Nav-sideMenu-li" id="Nav-sideMenu-Home" >홈</li>
<li class="Nav-sideMenu-li" id="Nav-sideMenu-showList" >공연</li>
<li class="Nav-sideMenu-li" id="Nav-sideMenu-attractionList" >볼거리</li>
<li class="Nav-sideMenu-li" id="Nav-sideMenu-visitList">목록</li>
</ul>
<br>
<br>
<br>

	<div class="Nav-sideMenu-listViewDiv">
	<span class="Nav-sideMenu-listViewText"></span>
	
				<div class="Nav-sideMenu-listViewListDiv">
		</div>
	
		
	</div>
		<div id="Nav-sideMenu-loadMore" style="display:none;">
		load more
		</div>
</div>


</body>
</html>