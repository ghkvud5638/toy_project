<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/header.jsp" />
<c:import url="/WEB-INF/views/attraction/attractionNavMainMenu.jsp" />

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2839883285d5293951571fa58223465e&libraries=services"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	

	

	function getParam(sname) {

	    var params = location.search.substr(location.search.indexOf("?") + 1);

	    var sval = "";

	    params = params.split("&");

	    for (var i = 0; i < params.length; i++) {

	        temp = params[i].split("=");

	        if ([temp[0]] == sname) { sval = temp[1]; }

	    }

	    return sval;

	}
	
	
	console.log(location.search.split("boardType") );
	console.log("갯파라미터 테스트 " + getParam("boardType"))
	console.log("갯파라미터 테스트 " + getParam("curPage"))
	console.log("갯파라미터 테스트 " + getParam("order"))

	if(getParam("boardType") == "board"){
		$('.attraction-list-listTable:not(:first-child)').css("border-top", "1px solid #ccc")

	}
	
	
// 		$('.attraction-list-wrapDiv').css("opacity", "0")
	
// 			$('.attraction-list-wrapDiv').css("display", "")
// 		setTimeout(function() {
// 		}, 10);

// 	setTimeout(function() {
// 		$('.attraction-list-wrapDiv').css("opacity", "1")
// 		$('.attraction-list-wrapDiv').css("transition", "all 1s ease-in-out")
// 		$('body').css("transition", "all 1s ease-in-out")
// 		$('attraction-list-wrapDiv').css("background-color", "gray")



// 	}, 500);
	var oneclickChk = false
	$("#cate1").val("${cate1}").attr("selected", "selected")
	$("#cate2").val("${cate2}").attr("selected", "selected")
	
	$('.attraction-list-mapViewBtn').on('click',function() {
		console.log("클릭")
		console.log($(this).val())

		if(oneclickChk == false){
		oneclickChk = true
		$.ajax({
			type: "get" //요청 메소드
			, url: "/attraction/map" //요청 URL
			, data: { attraction_no: $(this).val()
					   , area : "${area}"} //전달 파라미터
			, dataType: "html" //응답받은 데이터의 형식
			, success: function( res ) {
				console.log("성공")
				
				console.log(res)
				$(document.body).append(res);
// 				 $('html, body').addClass('hidden');
				setTimeout(function() {
					oneclickChk = false
					
				}, 1000);

			}
			, error: function() {
				console.log("실패")
			}
			
		})	
			
		} else {
			
		}
		
	})
	
		
	$('.attraction-list-searchBtn').on('click',function() {
		console.log("클릭")
	
		var ca1 = $("select[name=category1]").val()
		, ca2 = $("select[name=category2]").val()
		, se = $("#search").val()
		, ar = "${area}"
		, boardType = getParam("boardType")

		console.log(ca1)
		console.log(ca2)
		console.log(se)
		console.log(ar)
		
// 		if(se == ""){
// 			alert("검색어를 입력해주세요")			
// 		} else {
			if( ca1 == "all"){
				ca1 = ""
			} else {
				ca1 = "cate1=" + ca1 + "&"
			}
			if( ca2 == "all" ) {
				ca2 = ""
			} else {
				ca2 = "cate2=" + ca2 + "&"
			}
			if(ar == "all"){
				ar = "";
			} else {
				ar = "area="+ar+"&"
			}
			if(se == "") {
				se = ""
			} else {
				se = "search=" + se + "&"
			}
			if(boardType == ""){
				boardType = "boardType=image&"
			} else {
				boardType = "boardType=" + boardType + "&"
				
			}
			
// 			$('.attraction-list-wrapDiv').css("opacity", "0")
// 			setTimeout(function() {
				location.href= "/attraction/list?"+ar+ca1+ca2+se+boardType+"curPage=1";
				
// 			}, 1000);
				
			
// 		} 
		
	})
	
	$('.attraction-detail-contentCateSpan').click(function(){
		
		
			console.log("클릭");
			
			
			
			var chkurl = document.location.href.indexOf("area")
			, cate = $(this).attr('id')
			, cateName = document.getElementById($(this).attr('id')).innerHTML
			, area = ""
			, boardType = getParam("boardType");
		
			cateName = cateName.substr(1)
			cate = cate.substr(0, 5);
		
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

			if(boardType == ""){
				boardType = "&boardType=image&"
			} else {
				boardType = "&boardType=" + boardType + "&"
				
			}
			
			location.href= "/attraction/list?"+area+cate+"="+cateName+boardType+"curPage=1";

		})
	
	$('.attraction-list-listArraySpan').on('click', function(){
		console.log(document.getElementById($(this).attr('id')).innerHTML)
		var arrayName = document.getElementById($(this).attr('id')).innerHTML
		, chkurl = document.location.href.indexOf("order")
		, boardType = getParam("boardType")
		, boardTypeName = "boardType=" + boardType + "&"
		var curPage = getParam("curPage")
		if(curPage == "") {
			curPage = 1
		}

		
		arrayName = arrayName.replace(/(\s*)/g,"")

		console.log(chkurl)
		
	
		
			
			if(chkurl !== -1){
				arrayName = arrayName.replace(/(\s*)/g,"")
	
				var areasplit = document.location.href.split("?")
					, idx = areasplit[1].indexOf("&order")
					
				console.log(areasplit[1])
				console.log(idx)
				areasplit = areasplit[1].substring(0, idx) + '&'
				console.log(areasplit)
				
			} else {
				
				arrayName = arrayName.replace(/(\s*)/g,"")

				var areasplit = document.location.href.split("?")
					, idx = areasplit[1].indexOf("&curPage")
					
				console.log(areasplit[1])
				console.log(idx)
	
				areasplit = areasplit[1].substring(0, idx) + '&'
				console.log(areasplit)
	
			} 
	
	
			if(arrayName == '이름순(A-Z)'){
				areasplit = areasplit + 'order=name&'
			
			} else if(arrayName == '이름순(Z-A)') {
				areasplit = areasplit + 'order=nameR&'
			} else if(arrayName == '카테고리1순') {
				areasplit = areasplit + 'order=cate1&'
			} else if(arrayName == '카테고리1역순') {
				areasplit = areasplit + 'order=cate1R&'
			} else if(arrayName == '카테고리2순') {
				areasplit = areasplit + 'order=cate2&'
			} else if (arrayName == '카테고리2역순') {
				areasplit = areasplit + 'order=cate2R&'
			} else { }
		
// 			if ( $(this).attr('id') == 'attraction-list-boardType' ){
// 				console.log("보드타입바꾸자")
// 				boardTypeName = document.getElementById($(this).attr('id')).innerHTML
			
// 				alert(boardTypeName)
				
// 				boardTypeName = boardTypeName.replace(/(\s*)/g,"")
				
// 				alert(boardTypeName)
					areasplit = areasplit.replace("boardType=image&","")
					areasplit = areasplit.replace("boardType=board&","")
					if(boardType == ""){
						boardType="image"
					}
				areasplit = areasplit + "boardType=" + boardType + "&"
				
				if (arrayName == '게시판형'){
					areasplit = areasplit.replace("boardType=image&","boardType=board&")
					curPage = 1
					
				} else if(arrayName == '이미지형') {
					areasplit = areasplit.replace("boardType=board&","boardType=image&")
					curPage = 1
				}
				
// 				alert(boardTypeName)
		
// 			} 
			
// 				alert(arrayName)
// 				alert(areasplit)
			
			location.href= "/attraction/list?"+areasplit+"curPage="+curPage;
		
				console.log(arrayName);
		
		
	})	
		
		
});

</script>

<style type="text/css">

body {
 	background-color: gray; 

/* background-color:rgba (0,0,0,0); */
/* 	opacity: 0; */
}


table, tr, td {
/* 	table-layout: fixed; */
/*  border:1px solid #ccc;  */

}


/* Div CSS */

	.test {
			postion: absoulute;
			background-color: gray;
			width: 1800px;
			min-width: 1000px;
			height: 100%;
			margin: 0 auto
	}

	/* 전모든 요소 Div */
	.attraction-list-wrapDiv {
		postion: absoulute;
/*  		min-width: 100%;  */
  		width: 80%;
		height: 100%;
		top: 0;
		left: 0;
		margin: 0 auto;
		background-color: white;
		border: 1px solid #ccc;
		border-radius: 5px;
/* 		padding: 0px 100px; */
/* 		margin: 0px 100px 0px 100px; */
	
	}
	
	/* 검색 요소들 Div */
	.attraction-list-searchDiv {
	 	float: right; 
	 	margin-right: 100px;
	}
	
	/* 리스트 목록들 Div */
	.attraction-list-wrapdetailDiv {
		postion: absoulute;
		width: 90%;
		height: 100%;
		top: 0;
		left: 0;
	 	margin: 0 auto;
	 	margin-top: 30px;
		border-top: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
		
	
	}
	
	
	/* 리스트 Div */
	.attraction-list-listDiv {
		width: 40%;
		display:inline-block;
		margin:0 auto;
		postion: absoulute;
		
	
	}
	
	/* 리스트 안 내용(Content) Div */
	.attraction-list-listIntroDiv {
		width:50%;
		text-indent: 0.5em;
	/* 	white-space: nowrap; */
		word-wrap: break-word;
	 	text-overflow:ellipsis; 
		overflow: hidden;
		width:200px;
		height: 70px;
		display:-webkit-box;
		line-height: 1.1em;
		height: 3.1em;
		font-size: 13px;
		-webkit-line-clamp:3;
		-webkit-box-orient:vertical;
	
	}
	

/* 테이블 CSS */
	
	/* 리스트 테이블(모든 내용 들어감) */
	.attraction-list-listTable {
		postion: absoulute;
		width: 80%;
	 	margin: 30px 0px 30px 200px; 
	
	}
	
	/* 이미지 담는 td */
	.attarction-list-listIntroImgTd {
		padding: 20px;
		width:190px;
	}
	
	
	/* 리스트의 사진을 제외한 모든 내용 */
	.attraction-list-listIntroTd {
		margin-left: 50px;
		
	}
	

/* 이미지 CSS */

	/* 볼거리 사진 */	
	.attraction-list-listIntroImg {
		width: 100%;
		height: 200px;
		transition: all 0.3s ease-in-out;
		border: 1px solid #ccc;
		padding: 5px 5px 15px 5px;
		border-radius: 5px;
		
	}
	
	/* 사진에 마우스 올리면 작동 */
	.attraction-list-listIntroImg:hover {
		transform: scale(1.1);
	  -webkit-transform: scale(1.1);
	  -moz-transform: scale(1.1);
	  -ms-transform: scale(1.1);
	  -o-transform: scale(1.1);
	  cursor:pointer;
	}
	

	


/* 셀렉트 CSS */	

	/* 검색하기 위한 카테고리들 */
	.attraction-list-searchSelectOption {
		width: 120px;
		height: 30px;
		background-color: white;
		border-radius: 3px;
		cursor:pointer;
	
	}

/* 인풋 CSS */
	
	/* 검색 하기 위해 입력하는 글자창 */
	.attraction-list-searchInput {
		width: 300px;
		height: 30px;
		background-color: white;
		border-radius: 3px;
	
	}

/* 버튼 CSS */

	/* 지도 보기, 상세 보기 버튼 */
	.attraction-list-mapViewBtn, .attraction-list-detailViewBtn {
		position: relative;
		width: 100px;
		height: 30px;
 		background-color: white;
		border-radius: 3px;
	
	}
	
	/* 검색 버튼 */
	.attraction-list-searchBtn {
		position: relative;
		width: 70px;
		height: 30px;
		background-color: white;
		border-radius: 3px;
	
	}
	
	/* 지도 보기, 상세 보기, 검색 버튼 위에 마우스 올리면 작동 */
	.attraction-list-mapViewBtn:hover, .attraction-list-detailViewBtn:hover, .attraction-list-searchBtn:hover {
		cursor: pointer;
		background-color: #c3c3c3;
		text-decoration: underline;
	 	font-weight:bolder;
	
	}
	
/* P, SPAN CSS */	

	/* 리스트 제목 */
	.attraction-list-listIntroTitleP {
		font-weight:bolder;
		width:200px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}

	/* 근처 장소 내용 담는 P */
	.attraction-list-listIntroNearbyP {
		 font-size:7px;
		 width:200px;
		 white-space: nowrap;
		 overflow: hidden;
		 text-overflow: ellipsis;
		 
	}
	
	.attraction-detail-contentCateSpan{
	color: #3997c1;
	}

	.attraction-detail-contentCateSpan:hover, .attraction-list-listArraySpan:hover{
	cursor: pointer;
	font-weight: bolder;
	text-decoration: underline;
	}
	
	

</style>

<div class="test">
<div class="attraction-list-wrapDiv">

	<c:import url="/WEB-INF/views/attraction/categoryBtn.jsp" />


<div class="attraction-list-searchDiv">
		<select class="attraction-list-searchSelectOption" name="category1" id="cate1">
			<option value="all">전체</option>
			<option value="structure">건축/조형물</option>
			<option value="culture">문화시설</option>
			<option value="tourSpot1">산업관광지</option>
			<option value="tourSpot2">역사관광지</option>
		</select>
		
		<select class="attraction-list-searchSelectOption" name="category2" id="cate2">
			<option value="all">전체</option>
			<option value="tower">기념탑/전망대</option>
			<option value="structure">유명건축물/건물</option>
			<option value="etc">기타</option>
		</select>
		
		<input type="text" class="attraction-list-searchInput" id="search" placeholder="검색어를 입력해주세요(없어도 뭐 검색은 돼요)" value="${search }">
		<button class="attraction-list-searchBtn">검색</button>
	
	</div>
	<br>
	<div style="float:left; margin-left:120px;">
 
	<span class="attraction-list-listArraySpan" id="attraction-list-boardType">
	<c:if test='${boardType eq "image" }'>
		게시판형
		</c:if>
		<c:if test='${boardType eq "board" }'>
		이미지형
		</c:if>
	</span>
	/
	<span class="attraction-list-listArraySpan" id="attraction-list-listArrayName">
		<c:if test='${order eq "nameR" || order eq "" || order ne "name" }'>
		이름순(A-Z)
		</c:if>
		<c:if test='${order eq "name" }'>
		이름순(Z-A)
		</c:if>
	</span>
	/
	<span class="attraction-list-listArraySpan" id="attraction-list-listArrayCate1">
		<c:if test='${order eq "cate1R" || order eq "" || order ne "cate1" }'>
		카테고리1순
		</c:if>
		<c:if test='${order eq "cate1" }'>
		카테고리1역순
		</c:if>
	</span>
	/
	<span class="attraction-list-listArraySpan" id="attraction-list-listArrayCate2">
		<c:if test='${order eq "cate2R"  || order eq "" || order ne "cate2" }'>
		카테고리2순
		</c:if>
		<c:if test='${order eq "cate2" }'>
		카테고리2역순
		</c:if>
	</span>
	</div>
	<div class="attraction-list-wrapdetailDiv">
	
	<!-- 목록 없으면 나오는 창 제거해두 무방 -->
	<c:if test="${empty list }">
		<c:if test='${boardType eq "image" }'>
		<c:set var="sbsb">
							https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe_FK2zUGMRGrp2bH_pasITFMIZSpj2n7vcQ&usqp=CAU
							,
							https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgGG8r_u8efwqhybLb5tYl2hnpIl8qDQI7AQ&usqp=CAU			
							,
		  					https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWZHUbfeA9QtGXLmig9PRv_eCGIETj9hKxgQ&usqp=CAU
			  				, 
			  				https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsVLPdd047XeBOwCf1sPCNLjq5n1-J8DrFvA&usqp=CAU
		  </c:set>
		</c:if>
		<c:if test='${boardType eq "board" }'>
					<c:set var="sbsb">
			https://i.pinimg.com/originals/67/96/78/6796787f18c94baab28e706830c87d74.gif
				</c:set>
		
		</c:if>
		<c:forEach items="${sbsb }" var="b" varStatus="sb">
			<div class="attraction-list-listDiv">
				<table class="attraction-list-listTable" >
					<tbody>
						<tr>
							<td class="attarction-list-listIntroImgTd"><a href="/attraction/list?curPage=1">
								<img class="attraction-list-listIntroImg" src="${b }" alt=""></a></td>
							<td class="attraction-list-listIntroTd">
								<p class="attraction-list-listIntroTitleP">목록이 없습니다</p>
								<div class="attraction-list-listIntroDiv">
										다시 찾아주세요
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		
		</c:forEach>
	</c:if>
	<!-- 목록 없으면 나오는 창 여기까지 -->
	
		<c:if test='${boardType eq "image" }'>
	
	
		<c:forEach items="${list }" var="b" varStatus="sb">
			<c:choose>
				<c:when test="${area eq 'all' }">
					<c:set var="loc" value="/attraction/detail?attraction_no=${b.attraction_no }" />
				</c:when>
				<c:otherwise>
					<c:set var="loc" value="/attraction/detail?area=${area }&attraction_no=${b.attraction_no }" />
				</c:otherwise>
			</c:choose>
		
			<div class="attraction-list-listDiv">
				<table class="attraction-list-listTable" >
					<tbody>
						<tr>
							<td class="attarction-list-listIntroImgTd"><a href="<c:out value="${loc }"/>">
								<img class="attraction-list-listIntroImg" src="${b.attraction.get(0).attraction_photo }" alt=""></a></td>
							<td class="attraction-list-listIntroTd">		
								<p class="attraction-list-listIntroTitleP">${b.attraction_title }</p>
								<div class="attraction-list-listIntroDiv">
									${b.attraction_content }
								</div>
								<br>
								<p style="font-size: 10px;">
								<span class="attraction-detail-contentCateSpan" id="cate1${sb.index}">#${b.attraction_category1 }</span>
								&nbsp;&nbsp;
								<span class="attraction-detail-contentCateSpan" id="cate2${sb.index}">#${b.attraction_category2 }</span>
						
								</p>
								<p class="attraction-list-listIntroNearbyP">
								<c:choose>
									<c:when test="${empty showName.get(sb.index).getShow().get(0).getShow_name() }">
										공연이 근처에 업써요ㅠㅜ
									</c:when>
									<c:otherwise>
										근처 공연 : 
										<a href="/show/detail?show_id=${showName.get(sb.index).getShow().get(0).getShow_id() }">
										${showName.get(sb.index).getShow().get(0).getShow_name() }
										</a> 
									</c:otherwise>
								</c:choose>
									<br>
								<c:choose>
									<c:when test="${subwayName[sb.index ] eq '없음'}">
										역이 근처에 업써요ㅠㅜ
									</c:when>
									<c:otherwise>
										가까운 역 : ${subwayName[sb.index] }역
									</c:otherwise>
								</c:choose>
								</p>
								<p>
									<button class="attraction-list-mapViewBtn" value="${b.attraction_no }" >지도 보기</button>
									<button class="attraction-list-detailViewBtn" onclick="location.href='<c:out value="${loc }"/>'">상세보기</button>
							
								</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		
		</c:forEach>
	</c:if>
	
		<c:if test='${boardType eq "board" }'>
			<div class="attraction-list-listDiv" style="width:100%">
		<c:forEach items="${list }" var="b" varStatus="sb">
			<c:choose>
				<c:when test="${area eq 'all' }">
					<c:set var="loc" value="/attraction/detail?attraction_no=${b.attraction_no }" />
				</c:when>
				<c:otherwise>
					<c:set var="loc" value="/attraction/detail?area=${area }&attraction_no=${b.attraction_no }" />
				</c:otherwise>
			</c:choose>
		
				<table class="attraction-list-listTable" style="margin:0 auto;" >
					<tbody>
						<tr>
							<td class="attarction-list-listIntroImgTd" style="height:190px"><a href="<c:out value="${loc }"/>">
								<img class="attraction-list-listIntroImg" src="${b.attraction.get(0).attraction_photo }" alt="" 
								style="	width: 80%;	height: 100%;"></a></td>
							<td class="attraction-list-listIntroTd">		
								<p class="attraction-list-listIntroTitleP">${b.attraction_title }</p>
								<div class="attraction-list-listIntroDiv" style="width:90%">
									${b.attraction_content }
								</div>
								<br>
								<p style="font-size: 10px;">
								<span class="attraction-detail-contentCateSpan" id="cate1${sb.index}">#${b.attraction_category1 }</span>
								&nbsp;&nbsp;
								<span class="attraction-detail-contentCateSpan" id="cate2${sb.index}">#${b.attraction_category2 }</span>
						
								</p>
								</td>
								<td>
								<p class="attraction-list-listIntroNearbyP" style="width:130px; margin-right:50px;">
								<c:choose>
									<c:when test="${empty showName.get(sb.index).getShow().get(0).getShow_name() }">
										공연이 근처에 업써요ㅠㅜ
									</c:when>
									<c:otherwise>
										근처 공연 : 
										<a href="/show/detail?show_id=${showName.get(sb.index).getShow().get(0).getShow_id() }">
										${showName.get(sb.index).getShow().get(0).getShow_name() }
										</a> 
									</c:otherwise>
								</c:choose>
									<br>
								<c:choose>
									<c:when test="${subwayName[sb.index ] eq '없음'}">
										역이 근처에 업써요ㅠㅜ
									</c:when>
									<c:otherwise>
										가까운 역 : ${subwayName[sb.index] }역
									</c:otherwise>
								</c:choose>
								</p>
								</td>
								<td>
								<p>
									<button class="attraction-list-mapViewBtn" value="${b.attraction_no }" >지도 보기</button>
								</p>
								<p>
									<button class="attraction-list-detailViewBtn" onclick="location.href='<c:out value="${loc }"/>'">상세보기</button>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
		
		</c:forEach>
	
			</div>
			</c:if>

	</div>
	

	<jsp:include page="/WEB-INF/views/util/attractionPaging.jsp" />

</div>

</div>

<c:import url="/WEB-INF/views/footer.jsp" />
