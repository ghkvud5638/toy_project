<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:import url="/WEB-INF/views/header.jsp" />
<c:import url="/WEB-INF/views/sidemenuRight.jsp" />


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2839883285d5293951571fa58223465e"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
	
		var mapchk = false
		, showchk = false
		, attractionchk = false
		, closechk = 3;

		$('.subwayBtn').click(function(){
			var no = document.location.href.split("?")
			var no2 = document.location.href.split("attraction_no=")
			console.log(no)
			console.log(no2[1])

			$.ajax({
				type: "GET" //요청 메소드
				, url: "/attraction/subway" //요청 URL
				, data: { "attraction_no" : no2[1] } //전달 파라미터
				, dataType: "json" //응답받은 데이터의 형식
				, success: function( res ) {
					console.log("성공")
					
					console.log(res) //응답데이터 전체
					
					$(res.subway.subway).each (function(index, item){
						
					if(index!=0){
					$(".attraction-detail-subwaySpan").append(", ");
						
					}
					var resd1 = res.subway.subway[index].subway_line
					var resd2 = res.subway.subway[index].subway_name
// 					$(".attraction-detail-subwaySpan").append(resd1 + "호선 : ");
					$(".attraction-detail-subwaySpan").append(item.subway_line + "호선 : ");
					$(".attraction-detail-subwaySpan").append(item.subway_name + "<br>");
					
					})
					
					console.log(resd) //전달된 모델 객체
				
				}
				, error: function() {
					console.log("실패")
				}
				
			})

		})
		
	
		$('.attraction-detail-viewBtnList').click(function(){
			console.log(mapchk)
			console.log($(this).attr('id'))
			var loc = ""
			
			
			
			console.log("나 있어?" + closechk)
			if( mapchk == true || showchk == true || attractionchk == true) {
				$('.attraction-detail-viewBtnList').css("background-color", "")
	 			$('.attraction-detail-viewBtnList').css("font-weight", "")
				$("#attraction-detail-detailmap").css("width", "0px")
				$("#attraction-detail-detailmap").css("opacity", "0")

					$("#attraction-detail-detailmap").css("background-color", "black")
				if( showchk == true || attractionchk == true ) {
				$(".attraction-detail-showTable").css("width", "0px")
				} else {
					
				}
	
				$("#attraction-detail-detailmap").css("height", "350px")
// 				setTimeout(function(){

// 				$("#attraction-detail-detailmap").css("height", "0px")

//             	},150);
				setTimeout(function(){
					$("#attraction-detail-detailmap").empty();

            	},500);
				
				
					
				}
					
		
				console.log("여기서끝납니다")
					mapchk = false;
					showchk = false;
					attractionchk = false;
				if(closechk == 0 &&  $(this).attr('id') =='attraction-detail-mapViewLi' ){
					$("#attraction-detail-detailmap").css("height", "0px")
					closechk = 3

		 			console.log("맵체크꺼진다 ㅜ")
					return;	
				} else if(closechk == 1 &&  $(this).attr('id') =='attraction-detail-showViewLi') {
					$("#attraction-detail-detailmap").css("height", "0px")
					$(".attraction-detail-showTable").css("height", "0px")
					$(".attraction-detail-showTable").css("width", "0px")
					$(".attraction-detail-showTable").css("transition", "all 0.6s ease-in-out")

					closechk = 3

		 			console.log("쇼체크꺼진다ㅜ")
					return;
				} else if(closechk == 2 &&  $(this).attr('id') =='attraction-detail-attractionViewLi') {
					$("#attraction-detail-detailmap").css("height", "0px")
					$(".attraction-detail-showTable").css("height", "0px")
					$(".attraction-detail-showTable").css("width", "0px")
					$(".attraction-detail-showTable").css("transition", "all 0.6s ease-in-out")

					closechk = 3
		 			console.log("볼거리체크꺼진다ㅜ")
					return;
				} else {
		 			console.log("암껏도 안꺼져 ㅎㅎㅜ")
					
				}
					
			
			
			if( $(this).attr('id') =='attraction-detail-attractionViewLi') {
					attractionchk = true;
			 	var chkNumber = 2
			 	loc = "/attraction/nearbyshowlist"

			 } else if( $(this).attr('id') =='attraction-detail-showViewLi') {
				 showchk = true;
				 	var chkNumber = 1

				 loc = "/attraction/nearbyshowlist"
			} else {
				mapchk = true;
			 	var chkNumber = 0

				loc = "/attraction/map"
			}
			
				console.log("안끝나요!")
				console.log("attractionchk=" + attractionchk)
				console.log("showchk=" + showchk)
				console.log("mapchk=" + mapchk )
				console.log("loc=" + loc )
						
				var no2 = document.location.href.split("attraction_no=")
				console.log(no2[1])
				$.ajax({
					type: "GET" //요청 메소드
					, url: loc //요청 URL
					, data: {
								"attraction_no" : no2[1],
							    "ajaxChk" : true , 
							    "curPage" : 1,
							    "chk" : true,
							    "chkNumber" : chkNumber
							} //전달 파라미터
					, dataType: "html" //응답받은 데이터의 형식
					, success: function( res ) {
						console.log("성공")
// 						console.log(res) //응답데이터 전체


					if(mapchk == true) {
						closechk = 0

						$('#attraction-detail-mapViewLi').css("background-color", "gray")
						$('#attraction-detail-mapViewLi').css("font-weight", "bolder")

						$("#attraction-detail-detailmap").css("background-color", "#dfdeca")	
										setTimeout(function(){

						$("#attraction-detail-detailmap").css("height", "600px")	
				
				            	},151);

	                
	                	setTimeout(function(){
							$("#attraction-detail-detailmap").css("width", "800px")	
							$("#attraction-detail-detailmap").css("opacity", "1")

	                	},510);
	                	setTimeout(function(){
	                		$("#attraction-detail-detailmap").html(res);

							$("#attraction-map-detail").css("border", "3px solid black")
							$("#attraction-map-detail").css("border-radius", "8px")

	                	},1020);
					
						
						
				} else if(showchk == true || attractionchk == true) {
					if(showchk == true) {
						$('#attraction-detail-showViewLi').css("background-color", "gray")
						$('#attraction-detail-showViewLi').css("font-weight", "bolder")
						 closechk = 1

					} else {
						$('#attraction-detail-attractionViewLi').css("background-color", "gray")
						$('#attraction-detail-attractionViewLi').css("font-weight", "bolder")
						 closechk = 2

					}
					setTimeout(function(){

				
					$("#attraction-detail-detailmap").css("height", "350px")
				            	},151);

						$("#attraction-detail-detailmap").css("background-color", "black")
					setTimeout(function(){
						$("#attraction-detail-detailmap").css("width", "100%")
							$("#attraction-detail-detailmap").html(res);
						$("#attraction-detail-detailmap").css("background-color", "")
						$("#attraction-detail-detailmap").css("opacity", "1")

	                	},500);
					
				}
					}
					, error: function() {
						console.log("실패")
					}
					
				})
				
			

		})
		
	
		$('.attraction-detail-contentCateSpan').click(function(){
			console.log("클릭");
			
			var chkurl = document.location.href.indexOf("area")
			, area = ""
			, cate = $(this).attr('id')
			, cateName = document.getElementById($(this).attr('id')).innerHTML;
		
			cateName = cateName.substr(1)

			if(chkurl !== -1){
				var areasplit = document.location.href.split("area=")
				, idx = areasplit[1].indexOf("&")
				, area = areasplit[1].substring(0, idx);
				
				area = "area=" + area +"&"
				
			}
			
			if(cateName == '건축/조형물'){
				cateName = "structure"
			} else if(cateName == '문화시설') {
				cateName = "culture"
			} else if(cateName == '산업관광지') {
				cateName = "tourSpot1"
			} else if(cateName == '역사관광지') {
				cateName = "tourSpot2"
			} else if(cateName == '기념탑/전망대') {
				cateName = "tower"
			} else if(cateName == '유명건축물/건물') {
				cateName = "structure"
			} else {
				cateName = "etc"
			}
			location.href= "/attraction/list?"+area+cate+"="+cateName+"&curPage=1";

		})
		
	});

</script>

<style type="text/css">	

.attraction-detail-vieBtnUl{
	text-align: center;
}
.attraction-detail-viewBtnList{
	display: inline-block;
	padding: 10px;
	width: 33%;
	border-bottom: 1px solid #ccc;
	float:left;
}

.attraction-detail-viewBtnList:not(:first-child){
	border-left: 1px solid #ccc;
}
.attraction-detail-viewBtnList:hover{
	cursor: pointer;
	background-color: #c3c3c3;
	text-decoration: underline;
 	font-weight:bolder;
	 	
}

body {
	background-color: gray;
}


/* Div CSS */

.attraction-detail-wrapDiv {
	width: 1500px;
	margin: 0 auto;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: white;
	
}

.attraction-detail-wrapAllDiv {
	width: 1250px;
	margin: 0 auto;
	margin-bottom:50px;

}
.attraction-detail-conetentDiv {
 	white-space:normal; 
	padding: 10px;
	vertical-align: top;
	line-height: 1.2;	
	overflow: hidden;
}

#attraction-detail-detailmap {
	margin: 0 auto;
 	transition: all 0.5s ease-in-out; 
	 width:0px; height:0px;
	border-radius:5px;
}


.attraction-detail-imgMainDiv {
	border-top:1px solid #ccc;"
	width: 1250%;
	height: 500px;
	position: relative;
	margin: 0 auto;
/* 	overflow: hidden; */
	white-space: nowrap;
	
	
}
.attraction-detail-imgDiv {
	width: 40%;
	height: 90%;
	/* 	기준점 */
 	position: relative; 
	/* 가운데 정렬 */
	margin: 0 auto;
/* 	overflow: hidden; */
	white-space: nowrap;
	margin-top: 15px;
	
}




.attraction-detail-img {
	width: 100%;
	height: 100%;
	border: 1px solid #ccc;
	padding: 5px 5px 20px 5px;
	border-radius: 5px;
}





.attraction-detail-contentCateSpan{
	color:#3997c1;
	font-size: 11px;
}

.attraction-detail-contentCateSpan:hover{
	cursor: pointer;
	font-weight: bolder;
	text-decoration: underline;
}

.attraction-detail-listBackBtn{

	float:right; 
	background:white;
	border-radius: 5px;
	height: 40px;
}

.attraction-detail-listBackBtn:hover{

	cursor: pointer;
	background-color: #c3c3c3;
	text-decoration: underline;
 	font-weight:bolder;
}

</style>

</head>
<body>

<div class="attraction-detail-wrapDiv">

<c:import url="/WEB-INF/views/attraction/categoryBtn.jsp" />



	<div class="attraction-detail-wrapAllDiv" >
	<div style="width:60%; margin:0 auto">
				<h1>${attraction.attraction_title }</h1>
			
	</div>
	
	<div class="attraction-detail-imgMainDiv">
			<div class="attraction-detail-imgDiv">
				<img class="attraction-detail-img" src="${attraction.attraction.get(0).attraction_photo }" alt="">
			</div>							 
	</div>
	<div class="attraction-detail-conetentDiv" style="border-top:1px solid #ccc">
				
		<div style="width:60%; margin: 0 auto;">
				<p style="	text-indent: 0.8em;">${attraction.attraction_content }</p>
			
			<br><br>	
				<p>문의 사항 : ${attraction.attraction_tel }</p>
				<p>상세주소 : ${attraction.attraction_addr }</p>
				
		
		<br>
					
			<span class="attraction-detail-contentCateSpan" id="cate1">#${attraction.attraction_category1 }</span>
			&nbsp;&nbsp;
			<span class="attraction-detail-contentCateSpan" id="cate2">#${attraction.attraction_category2 }</span>
		</div>		
		
	</div>


		<div style="border-top:1px solid #ccc">
		<ul class="attraction-detail-vieBtnUl">
		<li class="attraction-detail-viewBtnList" id="attraction-detail-mapViewLi">지도 보여줘	</li>
		<li class="attraction-detail-viewBtnList" id="attraction-detail-showViewLi">근처 공연 보여줘		</li>
		<li class="attraction-detail-viewBtnList" id="attraction-detail-attractionViewLi">다른 볼거리 보여줘		</li>
		</ul>
		
				<br>
				<br>
				<!-- 지도 보는곳 -->
				<div id="attraction-detail-detailmap">
				</div>
				<br>
		</div>
	


	
	<div style="border-top:1px solid #ccc;">
				<div style=" margin:30px 0px 80px 0px;  width:60%; margin:0 auto">
			 <button class="subwayBtn" style="float:left;">가까운 지하철 찾기</button><br><br>
			 		<span class="attraction-detail-subwaySpan"> </span>
			
					<button onclick="history.go(-1)" class="attraction-detail-listBackBtn">목록으로 되돌아가기</button>
				</div>
		</div>
</div>

</div>


<c:import url="/WEB-INF/views/footer.jsp" />
