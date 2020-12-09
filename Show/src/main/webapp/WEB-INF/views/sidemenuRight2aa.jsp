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
		self.onerror=function() {return true;}

	var scrollHeight = 30;
	var scrollWidth = 20;
	var pageno = 1;

	var top = $(window).scrollTop() + scrollHeight
	, left = scrollWidth -$(window).scrollLeft() ;
	$(".nave").css("top", top+'px');
	$(".nave").css("right", left+"px");

	$('#main-sideMenu-attraction').click(function(){
		console.log("클릭")
		$.ajax({
					type: "GET" //요청 메소드
					, url: "/attraction/nava" //요청 URL
					, data: {
								"curPage" : 1
							} //전달 파라미터
					, dataType: "html" //응답받은 데이터의 형식
					, success: function( res ) {
						console.log("성공")
						$(".main-sideMenu-listViewListDiv").html(res);
						pageno = 2
						console.log(pageno);
	                	$("#load").css("display", "");
					}
					, error: function() {
						console.log("실패")
					}
					
				})	
	});
				
	$('#load').on('click', function(){
		console.log("클릭")
		var no = 1;
// 			${paging.totalPage} no: 1
// 			if( ${empty paging.totalPage} ) {
// 			50
// 			return false;
// 		} else {
// 			return true;
// 		}
				

		console.log("클릭asdasd")
		if(pageno > no){
        	$("#load").css("display", "none");
        	console.log(pageno)
        	console.log(${paging.totalPage})
        	consoel.log("이제그만")
		} else {
			
			$.ajax({
						type: "GET" //요청 메소드
						, url: "/attraction/nava" //요청 URL
						, data: {
									"curPage" : pageno
								} //전달 파라미터
						, dataType: "html" //응답받은 데이터의 형식
						, success: function( res ) {
							console.log("성공")
							$(".main-sideMenu-listViewListDiv").append(res);
							pageno++
							console.log(pageno);	
		                	console.log(${paging.totalPage})
								
						}
						, error: function() {
							console.log("실패")
						}
						
					})		
		}
	})

		function sidebar(){
			
			top = $(window).scrollTop() + scrollHeight;
			$(".nave").css("top", top+'px');
	
			left = scrollWidth -$(window).scrollLeft() ;
			console.log("내값은"+left)
			$(".nave").css("right", left+'px');
		

		
		}
		
	
		$(window).scroll(()=> {
			sidebar();
			console.log($(window).scrollTop())
			console.log($(window).scrollLeft())	
		});	
		if(${empty paging.totalPage}){
			return;
		}
		if(${!empty paging.totalPage}){
		if(pageno > Object.keys(${paging.totalPage})){
			console.log("이제안할래")
		
		}else{
		$('.main-sideMenu-listViewDiv').scroll(()=> {
			if($('.main-sideMenu-listViewDiv').prop('scrollHeight') -
				($('.main-sideMenu-listViewDiv').innerHeight() + $('.main-sideMenu-listViewDiv').scrollTop()) <= 5 )
				{
// 				alert("끝");
// 				$('.sese').append("끝끝끝<br>")
				console.log("끝")
				$('#load').trigger("click");
				}
			console.log($('.nav').height())
			console.log($('.main-sideMenu-listViewDiv').innerHeight())
			console.log($('.main-sideMenu-listViewDiv').prop('scrollHeight'))
		});	
			
		}
			
		}
		
	});
	

</script>

<style type="text/css">

	table, tr, td {
	/* 	table-layout: fixed; */
	  border:1px solid #ccc; 
	
	}
	.nave {
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
	
	.main-sideMenu-li{
		position:absolute;
		float:left;
		display:inline-block;
		width: 25%;
		background-color: gray;
		padding: 10px;
		text-align:center;
		z-index: 999;
		top:0;
		left:0;
		border:1px solid black;
		
		
	}
	
	.main-sideMenu-li:nth-child(2){
		left:25%;
	}
	.main-sideMenu-li:nth-child(3){
		left:50%;
	}
	.main-sideMenu-li:last-child{
		left:75%;
	}

	.main-sideMenu-li:hover{
		cursor: pointer;
		background-color: #c3c3c3;
		text-decoration: underline;
	 	font-weight:bolder;
			 	
	}
p{
	line-height: 1em;
}
</style>

</head>
<body>
<div class="nave">
<ul>
<li class="main-sideMenu-li">홈</li>
<li class="main-sideMenu-li">공연</li>
<li class="main-sideMenu-li"  id="main-sideMenu-attraction">볼거리</li>
<li class="main-sideMenu-li">목록</li>
</ul>
<br>
<br>
<br>

	<div class="main-sideMenu-listViewDiv" style="width:100%; height:85%;  overflow-x:hidden; overflow-y:visible;">
	
	
				<div class="main-sideMenu-listViewListDiv" style="width:100%; margin:0 auto; position:relative;">
	
		</div>
	
		<div id="load" style="text-align:center; border:1px solid #ccc; position:relative; display:none;">
		load more
		</div>

	</div>
</div>


</body>
</html>