<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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

	var oneclickChk = false
	
	$('.attraction-list-mapViewBtn').on('click',function() {
		console.log("클릭")
		console.log($(this).val())

		if(oneclickChk == false){
		oneclickChk = true
		$.ajax({
			type: "get" //요청 메소드
			, url: "/attraction/map" //요청 URL
			, data: { attraction_id: $(this).val()
					   , area : "${area}"
					   , boardType : "${boardType}"} //전달 파라미터
			, dataType: "html" //응답받은 데이터의 형식
			, success: function( res ) {
				console.log("성공")
				
				console.log(res)
				$(document.body).append(res);
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
				boardType = "boardType=image&"
			} else {
				boardType = "boardType=" + boardType + "&"
				
			}
			
			location.href= "/attraction/list?"+boardType+area+cate+"="+cateName+"&curPage=1";

		})
	
	

		
});

</script>

	<div class="attraction-list-listDiv" style="width:100%">
		<c:forEach items="${list }" var="b" varStatus="sb">
			<c:choose>
				<c:when test="${area eq 'all' }">
					<c:set var="loc" value="/attraction/detail?boardType=${boardType }&attraction_id=${b.attraction_id }" />
				</c:when>
				<c:otherwise>
					<c:set var="loc" value="/attraction/detail?boardType=${boardType }&area=${area }&attraction_id=${b.attraction_id }" />
				</c:otherwise>
			</c:choose>
		
				<ul class="attraction-list-listTable" style="margin:0 auto; border:3px solid #ccc; border-radius:10px; margin-top: 20px; margin-bottom:20px;" >
							<li class="attraction-list-listIntroTd" style="margin-left: 0px; width:75%; display:inline-block; padding:0px;">		
								<p class="attraction-list-listIntroTitleP" style="margin-top:10px; font-size:20px; width:100%;">${b.attraction_title }</p>
								<div class="attraction-list-listIntroDiv" style="width:90%">
									${b.attraction_content }
								</div>
								<br>
								<p style="font-size: 10px;">
								<span class="attraction-detail-contentCateSpan" id="cate1${sb.index}">#${b.attraction_category1 }</span>
								&nbsp;&nbsp;
								<span class="attraction-detail-contentCateSpan" id="cate2${sb.index}">#${b.attraction_category2 }</span>
						
								</p>
							
								<p class="attraction-list-listIntroNearbyP" style="width:100%;margin-right:50px;">
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
									<button class="attraction-list-mapViewBtn" value="${b.attraction_id }" >지도 보기</button>
									<button class="attraction-list-detailViewBtn" onclick="location.href='<c:out value="${loc }"/>'">상세보기</button>
								</p>
							</li>
								<li class="attarction-list-listIntroImgTd" style="float:right; display:inline-block; width:20%; height:190px; padding:15px 0px 0px 0px;"><a href="<c:out value="${loc }"/>">
								<img class="attraction-list-listIntroImg" src="${b.attraction.get(0).attraction_photo }" alt="" 
								style="	width: 80%;	height: 100%;"></a>
						
						</li>
				</ul>
		
		</c:forEach>
	
			</div>