<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		
	var scrollHeight = 30;
	var scrollWidth = 20;

	var top = $(window).scrollTop() + scrollHeight
	, left = scrollWidth -$(window).scrollLeft() ;
	$(".nav").css("top", top+'px');
	$(".nav").css("right", left+"px");


		function sidebar(){
			
			top = $(window).scrollTop() + scrollHeight;
			$(".nav").css("top", top+'px');
	
			left = scrollWidth -$(window).scrollLeft() ;
			console.log("내값은"+left)
			$(".nav").css("right", left+'px');
		

		
		}
		
		$(window).scroll(()=> {
			sidebar();
			console.log($(window).scrollTop())
			console.log($(window).scrollLeft())
		});	
		
	});
	

</script>

<style type="text/css">
	.nav {
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

</style>

</head>
<body>
<div class="nav">
<ul>
<li class="main-sideMenu-li">홈</li>
<li class="main-sideMenu-li">공연</li>
<li class="main-sideMenu-li">볼거리</li>
<li class="main-sideMenu-li">목록</li>
</ul>

</div>


</body>
</html>