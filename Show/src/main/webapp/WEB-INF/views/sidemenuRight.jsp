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

	var scrollHeight = 40;
	var scrollWidth = 140;
	var pageno = 1;
	var chk = false;
	var top =   scrollHeight - $(window).scrollTop()
	, left = scrollWidth -$(window).scrollLeft() ;
	$(".nav").css("bottom", top+'px');
	$(".nav").css("right", left+"px");

	$('.nav').click(function(){
		console.log("클릭")
		if(chk == false){
		$.ajax({
					type: "GET" //요청 메소드
					, url: "/attraction/nav" //요청 URL
					, data: {
								"curPage" : 1
							} //전달 파라미터
					, dataType: "html" //응답받은 데이터의 형식
					, success: function( res ) {
						chk = true;
						console.log("성공")
						$(document.body).append(res);
						pageno = 2
						console.log(pageno);
					}
					, error: function() {
						console.log("실패")
					}
					
				})	
			
		} else {
			chk = false;
			$('.nave').remove();
			
		}
	});
		

		function sidebar(){
			
			top = scrollHeight - $(window).scrollTop();	
			$(".nav").css("bottom", top+'px');
			console.log(top)
	
			left = scrollWidth -$(window).scrollLeft() ;
			console.log("내값은"+left)
			$(".nav").css("right", left+'px');
		
			console.log($(window).innerHeight())

		
		}
		
	
		$(window).scroll(()=> {
			sidebar();
			console.log($(window).scrollTop())
			console.log($(window).scrollLeft())	
		});	

		
	});
	

</script>

<style type="text/css">

	table, tr, td {
	/* 	table-layout: fixed; */
	  border:1px solid #ccc; 
	
	}
	.nav {
		border:5px solid black; 
		width:50px;
		 height:50px;
 		 position:absolute;
		right:0%;
		 z-index: 997;
	/*  	 left:calc(90%);  */
		background-color: white;
		border-radius: 300px;
	}
	
	.nav:hover {
	cursor:pointer;
	background-color: black;
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
<div class="nav">

</div>


</body>
</html>