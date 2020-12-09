<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		
$('.attraction-detail-showTable').not('#listNot').on('click', function() {
	console.log("클릭이동")
	console.log($(this).attr('id'))
	
	var chkurl = document.location.href.indexOf("area")
		, area = "";
	
	if(chkurl !== -1){
		var areasplit = document.location.href.split("area=")
		, idx = areasplit[1].indexOf("&")
		, area = areasplit[1].substring(0, idx);
		
		area = "area=" + area +"&"
		
	}
	
	if(${chkNumber} == 1){
	   location.href= "/show/detail?show_id="+$(this).attr('id');		
	} else {
	   location.href= "/attraction/detail?"+area+"attraction_no="+$(this).attr('id');		
		
	}
	
	
})
})
</script>

<style type="text/css">
.attraction-detail-showListWrap {
	width: 1250px;
	/* 	기준점 */
	position: relative;
	/* 가운데 정렬 */
	margin: 0 auto;
/* 	overflow: hidden; */
	white-space: nowrap;
	
}

.attraction-detail-showNameDiv {
	width:80%;
	height: 10%;
	margin: 0 auto;
 	overflow:hidden;	 
	white-space:nowrap;
	text-overflow: ellipsis;
	padding-top: 5px;
	
}
.attraction-detail-showListMain {
	text-align: center;
	padding: 20px 0px 20px 0px;
	

}

.attraction-detail-showList {
	width: 20%;
	display: inline-block;
	margin: 0 auto;
/* 	position: absolute; */
/* 	transition: all 0.3s ease-in-out; */
	
}

.attraction-detail-showList:first-child {
	margin-left: 20px;
}

.attraction-detail-showTable {
	width: 190px;
	height: 280px;	
	transition: all 0.6s ease-in-out;
	border: 1px solid #ccc;
	border-radius: 5px;
	
	 

}

.attraction-detail-showImg {
	width: 100%;
	height: 90%;
	border: 1px solid #ccc;
	padding: 5px 5px 15px 5px;
	background-color: black;
	border-top-left-radius: 5px;	
	border-top-right-radius: 5px;	
	
}

.attraction-detail-showTable:hover:not(#listNot) {
	transform: scale(1.1);
  -webkit-transform: scale(1.1);
  -moz-transform: scale(1.1);
  -ms-transform: scale(1.1);
  -o-transform: scale(1.1);
  cursor:pointer;
  font-weight: bolder;
  text-decoration: underline;
  
}
#listNot:hover {
	transform: scale(0.9);
  -webkit-transform: scale(0.9);
  -moz-transform: scale(0.9);
  -ms-transform: scale(0.9);
  -o-transform: scale(0.9);
  cursor:pointer;
  font-weight: bolder;
  text-decoration: underline;
  
}


}

</style>


</head>
<body>
		<div>
		<c:choose>
			<c:when test="${chkNumber eq 1 }">
				
				
				<c:choose>
					<c:when test="${empty show.show }">
									<div class="attraction-detail-showTable" id="listNot" style="margin: 0 auto;" >
<!-- 										<img class="attraction-detail-showImg" src="https://i.imgur.com/ZLIvOOPb.jpg" alt=""> -->
										<img class="attraction-detail-showImg" src="http://rgo4.com/files/attach/images/411209/502/271/015/6c57aeccb03f8e2553b00bc5dab63a38.jpeg" alt="">
										<div class="attraction-detail-showNameDiv">
											<span>주변에 공연ㄴ이 업서요ㅜㅜ;</span>
										</div>
									</div>
					
					</c:when>
					<c:otherwise>				
					<div class="attraction-detail-showListWrap">
						<ul  class="attraction-detail-showListMain">
							
							
									<c:forEach items="${show.show }" var="b" varStatus="sb">
									
									<li class="attraction-detail-showList">
									<div class="attraction-detail-showTable" id="${b.show_id }" >
										<img class="attraction-detail-showImg" src="${b.show_image }" alt="">
										<div class="attraction-detail-showNameDiv">
											<span>${b.show_name }</span>
										</div>
									</div>
								</li>
							</c:forEach>
													<jsp:include page="/WEB-INF/views/util/attractionPaging.jsp" />
						
						</ul>
					</div>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
					<c:choose>
					<c:when test="${empty attraction }">
									<div class="attraction-detail-showTable" id="listNot" style="margin: 0 auto;" >
										<img class="attraction-detail-showImg" src="data:image/jpeg;base64,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" alt="">
										<div class="attraction-detail-showNameDiv">
											<span>주변에 볼게 업서요ㅜㅜ;</span>
										</div>
									</div>
					
					</c:when>
					<c:otherwise>				
					<div class="attraction-detail-showListWrap">
						<ul  class="attraction-detail-showListMain">
							
							
							<c:forEach items="${attraction }" var="b" varStatus="sb">
								<li class="attraction-detail-showList">
									<div class="attraction-detail-showTable" id="${b.attraction_no }" >
										<img class="attraction-detail-showImg" src="${b.attraction.get(0).attraction_photo}" alt="">
										<div class="attraction-detail-showNameDiv">
											<span>${b.attraction_title }</span>
										</div>
									</div>
								</li>
							</c:forEach>
						
							<jsp:include page="/WEB-INF/views/util/attractionPaging.jsp" />
						</ul>
						
					</div>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	
			</div>
</body>
</html>