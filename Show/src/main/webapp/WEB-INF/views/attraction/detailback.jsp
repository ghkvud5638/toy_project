<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<c:import url="/WEB-INF/views/header.jsp" />

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2839883285d5293951571fa58223465e"></script>


<style type="text/css">	


caption {
float:left;
white-space:nowrap;
}

table tr td {
/* border:1px solid #ccc;  */
}



.attraction-detail-wrap {
	width: 1500px;
	margin: 0 auto;
}

.attraction-detail-table {
	width: 680px;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom:50px;
}

.attraction-detail-img {
	width: 250px;
	height: 300px;
}

.attraction-detail-intro {
	white-space:normal;
	text-indent: 0.5em;
	margin-left: 10px;
}

#attraction-detail-detailmap {
	margin: 0 auto;
	width:680px;
	height:400px; 
}

</style>

</head>
<body>

<div class="attraction-detail-wrap">
<c:import url="/WEB-INF/views/attraction/categoryBtn.jsp" />

<table class="attraction-detail-table">
<caption>
<h1>${attraction.attraction_title }</h1>
</caption>
<tbody style="border-top:1px solid #ccc;">
<tr>
<td rowspan="3" style="width: 275px; height: 350px; border-right: 1px solid #ccc;">
<img class="attraction-detail-img" src="${attraction.attraction_photo }" alt="">
</td>
<td>
<p class="attraction-detail-intro">
${attraction.attraction_content }</p>


</td>
</tr>
</tbody>
<tfoot>
<tr>
<td colspan="2" style="border-top:1px solid #ccc">
<br>
<div id="attraction-detail-detailmap">
</div>
<br>
<span>상세주소 : ${attraction.attraction_addr }</span>

</td>
</tr>
<tr>
<td> </td>
<td>
<div style="float:right;">
<button onclick="history.go(-1)">목록으로 되돌아가기</button>
</div>
</td>
</tr>
</tfoot>

</table>

<script>
		var container = document.getElementById('attraction-detail-detailmap');
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
</div>


<c:import url="/WEB-INF/views/footer.jsp" />
