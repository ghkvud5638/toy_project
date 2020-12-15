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
	
	$('.attraction-map-closeBtn').click(function(){
		console.log("클릭")
		close();
		
		
	});

});


</script>
<style type="text/css">

.attraction-map-closeBtn {

	margin-top: 20px;
	float:right;
	width:60px;
	height:30px;
	background-color:white;
	border-radius: 3px;
}

.attraction-map-closeBtn:hover {

	cursor: pointer;
	background-color: #c3c3c3;
	text-decoration: underline;
 	font-weight:bolder;
}

</style>

</head>
<body>
<div style="width:500px;">
<div id="attraction-map-detail" style="width:500px; height:400px;">
</div>

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


<button class="attraction-map-closeBtn">닫기</button>
</div>
</body>
</html>