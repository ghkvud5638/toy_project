<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:import url="/WEB-INF/views/header.jsp" />
<c:import url="/WEB-INF/views/attraction/attractionNavMainMenu.jsp" />
<c:import url="/WEB-INF/views/attraction/categoryBtn.jsp" />


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2839883285d5293951571fa58223465e"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
	
$(document).ready(function(){
		
		var attno = ${attraction.attraction_id}
	
// 		console.log($('#attraction-detail-contentId').innerHTML)
// 		console.log("${attraction.attraction_content }")
// 		console.log(`${attraction.attraction_content }`.split(". "))
		var nanum = `${attraction.attraction_content }`.split(". ")
		

		$(nanum).each (function(index, item){
// 			alert(item.last)
			console.log(item)
			console.log(index)
			if(nanum.length-1 == index){
			$('#attraction-detail-contentId').append(item)
				
			} else{
			$('#attraction-detail-contentId').append("<p>" + item + ".</p>")
				
			}
			
		})

		var mapchk = false
		, showchk = false
		, attractionchk = false
		, closechk = 3;

		$('.subwayBtn').click(function(){
			var no = document.location.href.split("?")
			var no2 = document.location.href.split("attraction_id=")
			console.log(no)
			console.log(no2[1])

			$.ajax({
				type: "GET" //요청 메소드
				, url: "/attraction/subway" //요청 URL
				, data: { "attraction_id" : no2[1] } //전달 파라미터
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
						
				$.ajax({
					type: "GET" //요청 메소드
					, url: loc //요청 URL
					, data: {
								"attraction_id" : attno,
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
						$("#attraction-detail-detailmap").css("background-color", "")
						$("#attraction-detail-detailmap").css("opacity", "1")
						$("#attraction-detail-detailmap").html(res);

	                	},520);
					
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
			, chkurl2 = document.location.href.indexOf("boardType")
			, area = ""
			, cate = $(this).attr('id')
			, cateName = document.getElementById($(this).attr('id')).innerHTML
			, boardType = "";
		
			cateName = cateName.substr(1)

			if(chkurl !== -1){
				var areasplit = document.location.href.split("area=")
				, idx = areasplit[1].indexOf("&")
				, area = areasplit[1].substring(0, idx);
				
				area = "area=" + area +"&"
				
			}
			
			if(chkurl2 !== -1){
				var boardTypesplit = document.location.href.split("boardType=")
				, idx = boardTypesplit[1].indexOf("&")
				, boardType = boardTypesplit[1].substring(0, idx)
				
				boardType = "boardType=" + boardType + "&"
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
			location.href= "/attraction/list?"+boardType+area+cate+"="+cateName+"&curPage=1";

		})
		
		
		var scrapChk = ${scrapChk}
		var loginChk = "${user_Id}"
		var timeChk = 1
		console.log(loginChk)
		$('.attraction-detail-scrapSpan').click(function(){
			if(loginChk === "visitor"){
				alert("로그인해야만 가능합니다")
				return;
			}
				var delChk = false;
				var insChk = false;
				var scrapText = "<i class='far fa-bookmark'></i>"
				var scrapText2 = "스크랩취소했습니다"
			if(scrapChk){
				 delChk = true;
				 scrapChk = false;
				
			} else {
				insChk = true;
				 scrapChk = true;
				 scrapText = "<i class='fas fa-bookmark'></i>"
				var scrapText2 = "스크랩했습니다"

			}
// 				clearTimeout(scrapTimer)
				
				$('#attraction-alim-Wrap').css("transition", "")
				$('#attraction-alim-Wrap').css("width", "0px")
				console.log("작동한다")

				console.log(timeChk)		

			$.ajax({
					type: "GET" //요청 메소드
					, url: "/attraction/navList" //요청 URL
					, data: {
								"attraction_id" : attno
								,"delete" : delChk
								,"insert" : insChk
								, "whereList" : 3			
								} //전달 파라미터
					, dataType: "html" //응답받은 데이터의 형식
					, success: function( res ) {
						console.log("성공")
						timeChk++
					console.log(timeChk)		

						$(".attraction-detail-scrapSpan").html(scrapText);
						$('#Nav-sideMenu-attractionList').trigger("click");
						 
						$('.attraction-alim-scrapSpan').text(scrapText2)
						$('#attraction-alim-Wrap').css("transition", "all 0.5s ease-in-out")
						$('#attraction-alim-Wrap').css("width", "500px")

					
						var scrapTimer = setTimeout(function(){
						if(timeChk > 1){
							--timeChk
							console.log(timeChk)		
							if(timeChk == 1){
								$('#attraction-alim-Wrap').css("width", "0px")

							}
			 				return;
						}

							$('#attraction-alim-Wrap').css("width", "0px")
							
						}, 5000)

					
					}
					, error: function() {
						console.log("실패")
					}
					
				})
			
		})
		
		
		$("#attraction-alim-cancleBtn").click(function(){
			$(".attraction-detail-scrapSpan").trigger("click")
		})
		
		$("#attraction-alim-closeBtn").click(function(){
				$('#attraction-alim-Wrap').css("width", "0px")
				clearTimeout(scrapTimer)
				timeChk = 1
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
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	float:left;
	font-family: 'Nanum Pen Script', cursive;
	font-size: 22px;
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


/* Div CSS */

.attraction-detail-wrapDiv {
	width: 1500px;
	margin: 0 auto;
	border-radius: 5px;
	background-color: white;
	margin-top: 200px;
	
}

.attraction-detail-wrapAllDiv {
	width: 80%;
	margin: 0 auto;
	margin-bottom:50px;
	bakcground-color: white;
	position: relative;

}
.attraction-detail-conetentDiv {
 	font-family: 'Noto Sans KR', sans-serif;
	white-space:normal; 
 	font-size: 19px;
	padding: 10px;
	vertical-align: top;
	overflow: hidden;
}

#attraction-detail-detailmap {
	margin: 0 auto;
 	transition: all 0.5s ease-in-out; 
	 width:0px; 
	 height:0px;
	border-radius:5px;
	margin-top:40px;
}

#attraction-alim-Wrap {
	position:fixed;
	 width:0px;
	 height:200px;
	 right:0%;
	 bottom:5%;
	 background-color: rgba(222, 220, 220, 0.8);
	 border:1px solid #ccc;	 
	border-top-left-radius: 9px;
	border-bottom-left-radius: 9px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	z-index: 999;
}

.attraction-alim-scrapBtn{
	background-color: white;
	width: 100px;
	height: 30px;
	margin-left: 30px;
	border-radius:5px;
}
.attraction-alim-scrapBtn:hover {
	background-color: #c3c3c3;
	
}

.attraction-detail-imgMainDiv {
	border-top:1px solid #ccc;
	width: 1040px;
	height: 500px;
	position: relative;
	margin: 0 auto;
/* 	overflow: hidden; */
	white-space: nowrap;
	
	
}
.attraction-detail-imgDiv {
	width: 60%;
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
	border: 5px solid black;
	border-radius: 5px;
}





.attraction-detail-contentCateSpan{
	color:#3997c1;
	font-size: 16px;
	font-family: 'Nanum Pen Script', cursive;
 	
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
	width: 100px;
}

.attraction-detail-listBackBtn:hover{

	cursor: pointer;
	background-color: #c3c3c3;
	text-decoration: underline;
 	font-weight:bolder;
}

P { 
	line-height: 1.5em;
}

.attraction-detail-scrapSpan {
	float:right; 
	font-size:50px;
	z-index:999;
	margin-right: 100px;
	
/* 	position:absolute;  */

}
.attraction-detail-scrapSpan:hover {
	
/* 	text-decoration: underline; */
/* 	font-weight: bolder; */
	cursor: pointer;
	transform: scale(1.1);
  -webkit-transform: scale(1.1);
  -moz-transform: scale(1.1);
  -ms-transform: scale(1.1);
  -o-transform: scale(1.1);

}

</style>

</head>
<body>

<div class="attraction-detail-wrapDiv">



	<div class="attraction-detail-wrapAllDiv" >
		<span class="attraction-detail-scrapSpan">
			<c:if test="${scrapChk eq false }">
				<i class="far fa-bookmark"></i>
			</c:if>
			<c:if test="${scrapChk eq true }">
				<i class="fas fa-bookmark"></i>
			</c:if>
		</span>	
	<div style="width:1000px; margin:0 auto">
		<h1 style="font-family: 'HANGANG', cursive; font-size: 53px;">${attraction.attraction_title }</h1>
	</div>
		
	
	<div class="attraction-detail-imgMainDiv">
			<div class="attraction-detail-imgDiv">
				<img class="attraction-detail-img" src="${attraction.attraction.get(0).attraction_photo }" alt="">
			</div>							 
	</div>
	<div class="attraction-detail-conetentDiv">
				
		<div style="width:85%; margin: 0 auto;">
				<div id="attraction-detail-contentId" style="text-indent: 0.6em;">
<%-- 				${attraction.attraction_content } --%>
				</div>
			
			<br><br>	
				
				<p style="font-size: 14px;  font-family: 'Noto Sans KR', sans-serif;"><i class="fas fa-phone-alt"></i>)문의사항 : ${attraction.attraction_tel }</p>
				<p style="font-size: 13px;  font-family: 'Noto Sans KR', sans-serif;"><i class="fas fa-map-marked-alt"></i>)상세주소 : ${attraction.attraction_addr }</p>
				
		
		<br>
					
			<span class="attraction-detail-contentCateSpan" id="cate1">#${attraction.attraction_category1 }</span>
			&nbsp;&nbsp;
			<span class="attraction-detail-contentCateSpan" id="cate2">#${attraction.attraction_category2 }</span>
<br>
		<div style="float:right">
		
		<button class="attraction-detail-listBackBtn">목록</button>
		</div>
		</div>		
	</div>

		<div>
		<ul class="attraction-detail-vieBtnUl">
		<li class="attraction-detail-viewBtnList" id="attraction-detail-mapViewLi">지도 보기	</li>
		<li class="attraction-detail-viewBtnList" id="attraction-detail-showViewLi">근처 공연 보기		</li>
		<li class="attraction-detail-viewBtnList" id="attraction-detail-attractionViewLi">근처 다른 볼거리 보기		</li>
		</ul>
		
				<br>
				<br>
				<!-- 지도 보는곳 -->
				<div id="attraction-detail-detailmap">
				</div>
				<br>
		</div>
	

	
	
</div>

</div>
		<div id="attraction-alim-Wrap">
			<div class="attraction-alim-wrapDiv">
					<div style="width:20%; height:70%; float:left; margin-top:20px; margin-left:10px; position:relative; background-color:white;">
							<img src="${attraction.attraction.get(0).attraction_photo  }"
							 style="width:100px; height:120px; padding:4px 4px 10px 4px; border:1px solid black; border-radius:3px;">
					</div>
						<div style="float:left; width:70%; height:80%; margin-top:10px; margin-left:15px;">
							<p style="font-family: 'HANGANG', cursive;width:100%; font-size:20px; font-weight:bolder; overflow: hidden; white-space: nowrap;">${attraction.attraction_title }</p>
							<span style="font-size:20px; overflow: hidden; white-space: nowrap;">${user_Id }님</span><br>
							<span class="attraction-alim-scrapSpan" style="font-size:20px; overflow: hidden; white-space: nowrap;"></span><br><br><br>
							<button class="attraction-alim-scrapBtn" id="attraction-alim-cancleBtn">취소</button>
							<button class="attraction-alim-scrapBtn" id="attraction-alim-closeBtn">닫기</button>
					</div>
			</div>
		</div>


<c:import url="/WEB-INF/views/footer.jsp" />
