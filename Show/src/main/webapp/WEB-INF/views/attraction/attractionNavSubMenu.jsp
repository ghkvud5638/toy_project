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
	var loginChk = ${login}
	console.log(loginChk)
// 	if(loginChk === undefined){
// 		loginChk = "안녕"
// 	}
		
// 		self.onerror=function() {return true;}
			
	var i = 0;			
	var scrollHeight = 30;
	var scrollWidth = 20;
	var totalCount = ${paging.totalCount}
	var chkNumber = 0;
	var whereList = 0;
	var navOneclick = false;
	
	var top = $(window).scrollTop() + scrollHeight
	, left = scrollWidth -$(window).scrollLeft() ;
	$(".Nav-sideMenu-WrapDiv").css("opacity", '1');
	$(".Nav-sideMenu-WrapDiv").css("top", top+'px');
	$(".Nav-sideMenu-WrapDiv").css("right", left+"px");

	$('.Nav-sideMenu-li').click(function(){
		if(navOneclick){
			
		} else{
			navOneclick = true
			i = 0
			loadMoreChk = false
	
			var idName = $(this).attr('id')
			, listText = ""
			, loc = ""
			console.log("클릭")
			
		
// 			if(idName == "Nav-sideMenu-showList"){
// 				if(loginChk === undefined){
// 					alert("로그인 해야만 볼 수 있습니다.")
// 					navOneclick = false
// 					$('#Nav-sideMenu-Home').trigger("click");

// 					return;
// 				}
// 				listText = "공연목록입니다.<br><br>"
// 				loc = "/attraction/nava"
// 			}
			if(idName == "Nav-sideMenu-attractionList"){
				if(loginChk === undefined){
					alert("로그인 해야만 볼 수 있습니다.")
					navOneclick = false
					$('#Nav-sideMenu-Home').trigger("click");

					return;
				}
				listText = "스크랩목록입니다.<br><br>"
				loc = "/attraction/nava"
					whereList = 3
					chkNumber = 4
	
			}
			if(idName == "Nav-sideMenu-visitList"){
				listText = "방문목록입니다.<br><br>"
				loc = "/attraction/nava"
					whereList = 4
					chkNumber = 5
	
			}
			$(".Nav-sideMenu-li").css("background-color", "#eaeaea")
			$(".Nav-sideMenu-li").css("text-decoration", "")
			$(".Nav-sideMenu-li").css("box-sizing", "")
			$(".Nav-sideMenu-li").css("border-bottom", "2px solid #ccc")
			
			

			$(".Nav-sideMenu-listViewText").html(listText);
	
			$('#'+idName).css("background-color", "#aba6a6")
			$('#'+idName).css("text-decoration", "underline")
			$('#'+idName).css("box-sizing", "border-box")
			$('#'+idName).css("border-bottom", "4px solid black")
			if(idName == "Nav-sideMenu-Home"){
				if(loginChk === undefined){
					listText = "로그인입니다.<br><br>"
				
				} else{
					listText = "로그아웃입니다.<br><br>"
					
				}
				$(".Nav-sideMenu-listViewListDiv").load("/attraction/login");
			
				navOneclick = false
			
				$(".Nav-sideMenu-listViewText").html(listText);
				$('#Nav-sideMenu-loadMore').css("display", "none")

				return;

			}
		 	$(".Nav-sideMenu-listViewListDiv").css("opacity", "0");

			setTimeout(function() {
			$(".Nav-sideMenu-listViewListDiv").empty()
			$('#Nav-sideMenu-loadMore').trigger("click");
			navOneclick = false
	
			}, 500);
			
		}


			
	});
	
	var loadMoreChk = false;
	var removeChk = false;
	var kNo = 5;
	$('#Nav-sideMenu-loadMore').on("click", function(){
				if(loadMoreChk == false ){
					loadMoreChk = true	
						listNo = 1
					console.log("클릭")
					console.log(removeChk)
					if(removeChk == true){
						kNo = 1
					} else {
						kNo = 5
					}
					console.log(kNo)
					for(var k=0; k<kNo; k++){
						

						$('#Nav-sideMenu-loadMore').css("display", "none")

						i++
					$.ajax({
								type: "GET" //요청 메소드
								, url: "/attraction/nava" //요청 URL
								, data: {
											"curPage" : i
											,"listNo" : listNo
											,"chkNumber" : chkNumber
											,"whereList" : whereList
										} //전달 파라미터
								, dataType: "html" //응답받은 데이터의 형식
								, async:false
								, success: function( res ) {
									console.log("성공")
// 									console.log(res)
									
									$(".Nav-sideMenu-listViewListDiv").append(res);
// 									$(".Nav-sideMenu-listViewListDiv").append($(res).find($('#total')));
									$(".Nav-sideMenu-listViewListDiv").css("transition", "all 0.5s ease-in-out");
									
									
									$(".Nav-sideMenu-listViewListDiv").css("opacity", "1");

									totalCount = $('#total').val()
									removeChk = false
								}
								, error: function() {
									console.log("실패")
								}
								
							})	
							
								

							if(i >= totalCount){
// 								alert("안해용")
								loadMoreChk = true

								return;
							} else{
								$('#Nav-sideMenu-loadMore').css("display", "")
									loadMoreChk = false
									

								
							}
						}
					} else{
// 			 			alert("한번만합시다")
			 			if(removeChk == true){
							if(i < totalCount){
							loadMoreChk = false
								
							}

							removeChk = false
			 			}
					}

				});
	
	$("#removeLoadMore").on('click', function(){
		console.log("작동?")
		removeChk = true
		i--
		$('#total').val($('#total').val()-1)
		$('#Nav-sideMenu-loadMore').trigger("click");

		
	
	})
	
	
	//시작할때 목록 불러오기		
// 	$('#Nav-sideMenu-visitList').trigger("click");
	$('#Nav-sideMenu-Home').trigger("click");


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
	
		$('.Nav-sideMenu-navCloseBtn').click(function(){
			$('.nav').trigger("click")
		})
		
		
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
		transition: all 0.3s ease-in-out;
		opacity: 0;
		
	/*  	 left:calc(90%);  */
		background-color: white;
		border-radius: 7px;
	}
	
	.Nav-sideMenu-li{
		position:absolute;
		float:left;
		display:inline-block;
		width: 33.3333%;
		background-color: #eaeaea;
		padding: 10px;
		text-align:center;
		z-index: 999;
		top:0;
		left:0;
		border-bottom:2px solid #ccc;
		font-family: 'HANGANG', cursive;
		font-weight:bolder;
		
		
	}
	
	.Nav-sideMenu-li:nth-child(2){
		left:33.3%;
		border-left:2px solid #ccc;
/* 		border-right:2px solid #ccc; */
	}
/* 	.Nav-sideMenu-li:nth-child(3){ */
/* 		left:50%; */
/* 		border-left:2px solid #ccc; */
/* 	} */
	.Nav-sideMenu-li:last-child{
			left:66.6%;
	
		border-left:2px solid #ccc;
	}

	.Nav-sideMenu-li:hover{
		cursor: pointer;
 		background-color: #aba6a6;
		text-decoration: underline;
	 	font-weight:bolder;
			 	
	}

	.Nav-sideMenu-listViewDiv {
	
		width:100%;
		height:85%;
		margin-top:-14px;
		overflow-x:hidden;
		overflow-y:visible;
	}
	
	.Nav-sideMenu-listViewText {
	
		margin-left: 15px;
		font-size: 15px;
		font-weight: bolder;
		font-family: 'HANGANG', cursive;
		
		
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
		font-family: 'NAMSAN', cursive;
		
	
	}
	
	#Nav-sideMenu-loadMore:hover {
	
		cursor: pointer;
		background-color: gray;
		text-decoration: underline;
		font-weight: bolder;
	
	}
	
	.Nav-sideMenu-navCloseBtn {
		 margin-right: 15px;
		 color: #de1111;
		 margin-top: -8px;
		 right: 3%;
		 position: absolute;
 		font-family: 'HANGANG', cursive;
		 
	}

	.Nav-sideMenu-navCloseBtn:hover {
		text-decoration: underline;
		cursor: pointer;
		font-weight: bolder;
	}

</style>

</head>
<body>
	<div class="Nav-sideMenu-WrapDiv">
	
		<ul>
			<li class="Nav-sideMenu-li" id="Nav-sideMenu-Home" >홈</li>
<!-- 			<li class="Nav-sideMenu-li" id="Nav-sideMenu-showList" >공연</li> -->
			<li class="Nav-sideMenu-li" id="Nav-sideMenu-attractionList" >스크랩</li>
			<li class="Nav-sideMenu-li" id="Nav-sideMenu-visitList">방문목록</li>
		</ul>
			<br>
			<br>
			<br>
		<div class="Nav-sideMenu-listViewDiv">
					<span class="Nav-sideMenu-navCloseBtn">닫기</span>
			<span class="Nav-sideMenu-listViewText"></span>
			
				<div class="Nav-sideMenu-listViewListDiv">
				</div>
			
		</div>
		<div id="Nav-sideMenu-loadMore" style="display:none;">
				더보기
		</div>
	
	</div>
			<input type="hidden" id="removeLoadMore">

</body>
</html>