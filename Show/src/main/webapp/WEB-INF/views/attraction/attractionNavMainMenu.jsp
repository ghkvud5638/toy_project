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


	var chk = false;


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
						$(".nav").css("opacity", '0');
						$(document.body).append(res);
						console.log(pageno);

					}
					, error: function() {
						console.log("실패")
					}
					
				})	
			
		} else {
			$(".nav").css("opacity", '1');

			$(".Nav-sideMenu-WrapDiv").css("opacity", '0');
			setTimeout(function() {
			$('.Nav-sideMenu-WrapDiv').remove();
			chk = false;
				
			}, 300);
			
		}
	});
		
	$("#navLoginLogout").click(function(){
			if(chk == true){
				$('.Nav-sideMenu-WrapDiv').remove();
				chk = false;
				$('.nav').trigger('click')
				}
		
		

	})	

		
	});
	

</script>

<style type="text/css">


	.nav {
		border:5px solid black; 
		width:50px;
		 height:50px;
 		 position:absolute;
		right:0%;
		 z-index: 997;
 		transition: all 0.3s ease-in-out;
		 
	/*  	 left:calc(90%);  */
		background-color: white;
		border-radius: 300px;
		position: fixed;
		right:10px;
		bottom:10px; 
		
	}
	
	.nav:hover {
	cursor:pointer;
	background-color: black;
	transform: scale(1.1);
  -webkit-transform: scale(1.1);
  -moz-transform: scale(1.1);
  -ms-transform: scale(1.1);
  -o-transform: scale(1.1);
	}

</style>

</head>
<body>
<div class="nav">
</div>
<input type="hidden" id="navLoginLogout">


</body>
</html>