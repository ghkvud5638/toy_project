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
	alert("성공적으로불러옴")
	
	$('#load').on('click', function(){
		console.log("클릭")
		var no = "${paging.totalPage}"
		, pageno = "${paging.curPage}"+1
				
		console.log("클릭asdasd")
		if(pageno > no){
        	$("#load").css("display", "none");
        	console.log(pageno)
        	console.log(${paging.totalPage})
        	consoel.log("이제그만")
		} else {
			alert("작동")
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
						console.log(pageno);	
	                	console.log(${paging.totalPage})
							
	                	setTimeout(function() {
							clickChk = false;
						}, 1000);
	                	
					}
					, error: function() {
						console.log("실패")
				}
						
			})		
		}
	})


})


</script>

</head>
<body>

</body>
</html>