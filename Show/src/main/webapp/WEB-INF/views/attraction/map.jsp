<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2839883285d5293951571fa58223465e"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

	

	setTimeout(function(){

	$(".attraction-list-mapMainDiv").css("width", "0")
	$(".attraction-list-mapMainDiv").css("height", "0")
	
    $('.attraction-list-mapMainDiv').css("top",(($(window).height() 
  		- $('.attraction-list-mapMainDiv').outerHeight()) / 2) + $(window).scrollTop());
     $('.attraction-list-mapMainDiv').css("left",(($(window).width() 
     		- $('.attraction-list-mapMainDiv').outerWidth()) / 2) + $(window).scrollLeft());

// 	$(".attraction-list-mapMainDiv").css("left", "50%")
// 	$(".attraction-list-mapMainDiv").css("top", "50%")


    },0001);


	var scrollHeight = 20;
	var scrollWidth = 20;
	var top = $(window).scrollTop() - scrollHeight + 20
	, left = $(window).scrollLeft() - scrollWidth + 20;
		$(".attraction-list-mapMainDiv").css("top", top+'px');
		$(".attraction-list-mapMainDiv").css("left", left+'px');
	
	setTimeout(function(){
		$(".attraction-list-mapMainDiv").css("opacity", "1")

		$(".attraction-list-mapMainDiv").css("transition", "all 0.5s ease-in-out")
		$(".attraction-list-mapMainDiv").css("background-color", "rgba(238, 238, 238, 0.8)")

		$(".attraction-list-mapViewDiv").css("border", "3px solid black")
		$(".attraction-list-mapViewDiv").css("border-radius", "8px")
		$(".attraction-list-mapMainDiv").css("width", "100%")
		$(".attraction-list-mapMainDiv").css("height", "100%")
	

		$(".attraction-list-mapMainDiv").css("top", top+'px');
		$(".attraction-list-mapMainDiv").css("left", left+'px');
    },501);
	
	
	function sidebar(){
		
		if($(window).scrollTop() > scrollHeight) {
			
			var top = $(window).scrollTop() - scrollHeight + 20;
			$(".attraction-list-mapMainDiv").css("top", top+'px');
	
		} else {
			$(".attraction-list-mapMainDiv").css("top", "0px");
	
			
		}
	
		if($(window).scrollLeft() > scrollWidth) {
			
			var left = $(window).scrollLeft() - scrollWidth + 20;
			$(".attraction-list-mapMainDiv").css("left", left+'px');
	
		} else {
			$(".attraction-list-mapMainDiv").css("left", "0px");
	
			
		}
		}
		
		$(window).scroll(()=> {
			sidebar();
			console.log($(window).scrollTop())
			console.log($(window).scrollLeft())
		});	
		
		
	
		$( '#attraction-list-mapdetailView').on('click',function(){
			console.log("click")
			var ar = "${area}"
			, no = "${attraction_no}"
			,board = "${boardType}"
// 			alert(board)
			console.log(ar)
			
				if(ar == "all"){
					ar = "";
				} else {
					ar = "area="+ar+"&"
				}
					
			location.href= "/attraction/detail?boardType="+"${boardType }"+"&"+ar+"attraction_no="+no;
					
				
			
		})

		$( '#attraction-list-mapdetailClose').on('click',function(){
			console.log("click")
				$(".attraction-list-mapMainDiv").css("width", "0")
				$(".attraction-list-mapMainDiv").css("height", "0")
				   $('.attraction-list-mapMainDiv').css("top",($('.attraction-list-mapMainDiv').outerHeight() / 2) + $(window).scrollTop());
				$(".attraction-list-mapMainDiv").css("left",  ($('.attraction-list-mapMainDiv').outerWidth()/2)+$(window).scrollLeft())
		   
// 			$('.attraction-list-mapMainDiv').css("left",(($(window).width() 
// 		      		- $('.attraction-list-mapMainDiv').outerWidth())/8)
// 		      		+ $(window).scrollLeft());

// 				$(".attraction-list-mapMainDiv").css("top", $(window).scrollTop()+20+"px")
// 				$(".attraction-list-mapMainDiv").css("left", $(window).scrollLeft()+20+"px")

				setTimeout(function(){
				$(".attraction-list-mapMainDiv").remove();
	                	},501);
		})
	
	// 	$('.attraction-list-mapViewDiv').on('click', '.attraction-list-mapCloseBtn',function(){
	// 		console.log("click")
	// 		$(".attraction-list-mapViewDiv").empty();
	// 		$('.attraction-list-mapMainDiv').css("display", "none")
	// 		$('.attraction-list-mapViewDiv').css("display", "none")	
	// 	})
	
	
});

</script>

<style type="text/css">

/* Div CSS */

	.attraction-list-mapMainDiv {
		position:absolute;
	 	width:100%;
	    height:100%;
	    z-index:995 ;
		opacity: 0;
	    touch-action:none;
	    overflow:hidden !important;
		
	} 
	 
	.attraction-list-mapViewDiv { 
		position:absolute; 
		top:16%; 
		left:30%;
		width:43%;
		height:68%; 
		z-index:998;
		background-color:#FFFFFF;
	
	}


/* Ul, Li CSS */

	.attraction-list-mapBtnUl {
		text-align:center;
		display: table-cell;
		vertical-align: middle;
		
	}
	
	.attraction-list-mapBtnLi{
		padding: 10px;
		background-color: white;
	/* 	width: 100px; */
		width: 50%;
		height: 40px;
		float:left;
		border: 1px solid black;
		border-bottom: 0px;
		display: inline-block;
		text-align:center;
		z-index: 994;
		position: absolute;
		left:0;
		bottom: 0;
		
	}
	
	#attraction-list-mapdetailView{
		border-bottom-left-radius: 3px;
	}
	
	#attraction-list-mapdetailClose {
		left:50%;
		border-bottom-right-radius: 3px;
	}
	
	.attraction-list-mapBtnLi:hover{
		cursor: pointer;
		background-color: #c3c3c3;
		text-decoration: underline;
	 	font-weight:bolder;
	}
	


</style>


</head>
<body>
	<c:choose>
		<c:when test="${chk eq true }">
			<div id="attraction-map-detail" style="width:100%; height:100%; border-radius: 5px;">
			</div>
			 <button class="subwayBtn" style="float:right;">가까운 지하철 찾기</button><br><br>
			 		<span class="attraction-detail-subwaySpan"> </span>
		</c:when>
		<c:otherwise>
			<div class="attraction-list-mapMainDiv">
				<div class="attraction-list-mapViewDiv">
	<%--     	<h1>${attraction.attraction_title }</h1> --%>
					<div id="attraction-map-detail" style="width:100%; height:100%; border-radius: 5px;">
						<ul class="attraction-list-mapBtnUl">
							<li class="attraction-list-mapBtnLi" id="attraction-list-mapdetailView">상세 보기</li>
							<li class="attraction-list-mapBtnLi" id="attraction-list-mapdetailClose">닫기</li>
						</ul>
					</div>
		  		</div>
		  	</div>
		</c:otherwise>
	</c:choose>
	


	<script>
		var container = document.getElementById('attraction-map-detail');
		var options = {
			center: new kakao.maps.LatLng(${attraction.attraction_latitude},${attraction.attraction_longitude}),
			level: 3
		};
		
		var map = new kakao.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(${attraction.attraction_latitude},${attraction.attraction_longitude});
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});
		marker.setMap(map);
		
		var iwContent = '${attraction.attraction_title}', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		iwPosition = new kakao.maps.LatLng(${attraction.attraction_latitude},${attraction.attraction_longitude}); //인포윈도우 표시 위치입니다
		
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
	</script>


</body>
</html>