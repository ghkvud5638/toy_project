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
		var i = ${paging.curPage }	
		, removeChk = false
		, listNo = 0
		, loadMoreChk = false
	

	
	
	
	
	$('.Nav-attraction-list${paging.curPage }').on("click", function(){

	var	attraction_id = $(this).attr('id')
	var whereList = ${whereList}
	removeChk = true;
	$.ajax({
				type: "GET" //요청 메소드
				, url: "/attraction/navList" //요청 URL
				, data: {
							"attraction_id" : attraction_id
							,"delete" : true
							,"insert" : false
							, "whereList" : whereList
						} //전달 파라미터
				, dataType: "html" //응답받은 데이터의 형식
				, success: function( res ) {
					console.log("성공")
					$("#Nav-navList-WrapListDiv" + attraction_id).css("transition", "all 0.5s ease-in-out")

					 $("#Nav-navList-WrapListDiv" + attraction_id).css("height", "0");
					 $("#Nav-navList-WrapListDiv" + attraction_id).css("opacity", "0");
				
							$('#removeLoadMore').trigger("click");
				

					setTimeout(function() {
					$("#Nav-navList-WrapListDiv" + attraction_id).remove();	
						
					}, 500);

				}
				, error: function() {
					console.log("실패")
				}
			})	
	});
	

})



</script>

<style type="text/css">




.Nav-attraction-list${paging.curPage } {
	
	float:right;	

}

.Nav-attraction-list${paging.curPage }:hover {
	
/* 	text-decoration: underline; */
	cursor: pointer;
/* 	font-weight: bolder;	 */
		transform: scale(1.2);
	  -webkit-transform: scale(1.2);
	  -moz-transform: scale(1.2);
	  -ms-transform: scale(1.2);
	  -o-transform: scale(1.2);

}

.Nav-navList-WrapListDiv{

	width:90%;
	height:170px;
	border-top:1px solid #ccc;
	margin:0 auto;
	overflow:hidden;
}

.Nav-navList-ListContent{

	width:95%;
	height:100%;
	margin:0 auto;

}

.Nav-navList-ListImg {

	height:100%;
/* 	overflow-x:scroll; */
/* 	overflow-y:visible; */

}

.Nav-navList-listP, .Nav-navList-listSpan {
	line-height: 1em;
	width: 100%;
	white-space:nowrap;
	overflow:hidden;
	text-overflow: ellipsis;
	 padding-top:2px; 
}

.Nav-navList-listSpan {

	display:inline-block;
	width:40%;
	font-size: 10px;
	line-height: 1em;

}

</style>

</head>
<body>

	<div class="Nav-navList-WrapDiv" style="width:100%; height:85%; ">
	<input type="hidden" value="${paging.totalCount }" id="total">
	<c:forEach items="${list }" var="b" varStatus="sb">
		<div class="Nav-navList-WrapListDiv" id="Nav-navList-WrapListDiv${b.attraction_id }" >
			<span class="Nav-attraction-list${paging.curPage }" id=${b.attraction_id } style="margin-right:3px;">
			<i class="fas fa-times"></i>
			</span>
			<br>
				<div class="Nav-navList-ListImg">
					<div style="width:35%; height:100%; float:left;">
							<img src="${b.attraction.get(0).attraction_photo }"
							 style="width:100%; height:65%; padding:4px 4px 10px 4px; border:1px solid black; position:relative; border-radius:3px;">
							<p class="Nav-navList-listP" style="width:80%; margin-top:3px; margin-left:5px; font-weight:bolder; text-align:center; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">
							<a href="/attraction/detail?attraction_id=${b.attraction_id }">보러가기</a>
							</p>
					</div>
					<div style="width:65%; height:90%; float:left; white-space:nowrap; overflow:hidden;">
						<div style="margin-left: 18px; height:90%;">
							<p class="Nav-navList-listP" style="width:80%; margin-left:5px; font-weight:bolder; font-family: 'HANGANG', cursive;">${b.attraction_title }</p>
							<p class="Nav-navList-listP" style="font-family: 'HANGANG', cursive;"> ${b.attraction_content }</p>
							<p class="Nav-navList-listP" style="margin-top:24px; font-family: 'Nanum Pen Script', cursive; color:#3997c1;"> 
							#${b.attraction_category1 } 
										&nbsp;&nbsp;
							#${b.attraction_category2 }</p>
							<span class="Nav-navList-listSpan" style="width:100%; font-size: 12px;"> 가까운 공연, 지하철
							</span>
							<br>
							<c:choose>
							 <c:when test="${empty showName.get(sb.index).getShow().get(0).getShow_name() }">
								<span class="Nav-navList-listSpan" style="width:20px;">
									없음
								</span>
							 </c:when>
							 <c:otherwise>
							<span class="Nav-navList-listSpan">
								 ${showName.get(sb.index).getShow().get(0).getShow_name() }
							</span>
							 </c:otherwise>
							</c:choose>
							,
							<span class="Nav-navList-listSpan">
								 ${subwayName[sb.index] }<c:if test="${subwayName[sb.index ] ne '없음'}">역
								
							</c:if>
						
							</span>

						</div>
					</div>
				</div>
		</div>
	</c:forEach>

	</div>
	
</body>
</html>