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

	var	attraction_no = $(this).attr('id')
	var whereList = ${whereList}
	removeChk = true;
	$.ajax({
				type: "GET" //요청 메소드
				, url: "/attraction/navList" //요청 URL
				, data: {
							"attraction_no" : attraction_no
							,"delete" : true
							,"insert" : false
							, "whereList" : whereList
						} //전달 파라미터
				, dataType: "html" //응답받은 데이터의 형식
				, success: function( res ) {
					console.log("성공")
					$("#Nav-navList-WrapListDiv" + attraction_no).css("transition", "all 0.5s ease-in-out")

					 $("#Nav-navList-WrapListDiv" + attraction_no).css("height", "0");
					 $("#Nav-navList-WrapListDiv" + attraction_no).css("opacity", "0");
				
							$('#removeLoadMore').trigger("click");
				

					setTimeout(function() {
					$("#Nav-navList-WrapListDiv" + attraction_no).remove();	
						
					}, 500);

				}
				, error: function() {
					console.log("실패")
				}
				
			})	
		

		
		
});
	
// 	if(${!empty paging.totalPage}){
// 		if(pageno > ${paging.totalPage}){
// 			console.log("이제안할래")
// 			alert("끝났어")
		
// 		}else{
// 		$('.main-sideMenu-listViewDiv').scroll(()=> {
// 			if($('.main-sideMenu-listViewDiv').prop('scrollHeight') -
// 				($('.main-sideMenu-listViewDiv').innerHeight() + $('.main-sideMenu-listViewDiv').scrollTop()) <= 5 )
// 				{
// 				alert("끝");
// // 				$('.sese').append("끝끝끝<br>")
// 				console.log("끝")
// 				$('#load').trigger("click");
// 				}
// 			console.log($('.nav').height())
// 			console.log($('.main-sideMenu-listViewDiv').innerHeight())
// 			console.log($('.main-sideMenu-listViewDiv').prop('scrollHeight'))
// 		});	
			
// 		}
			
// 		}
	

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
		<div class="Nav-navList-WrapListDiv" id="Nav-navList-WrapListDiv${b.attraction_no }" >
			<span class="Nav-attraction-list${paging.curPage }" id=${b.attraction_no } style="margin-right:3px;">
			<i class="fas fa-times"></i>
			</span>
			<br>
				<div class="Nav-navList-ListImg">
					<div style="width:35%; height:100%; float:left;">
<!-- 							<img src="data:image/jpeg;base64,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" -->
							<img src="${b.attraction.get(0).attraction_photo }"
							 style="width:100%; height:65%; padding:4px 4px 10px 4px; border:1px solid black; position:relative; border-radius:3px;">
							<p class="Nav-navList-listP" style="width:80%; margin-top:3px; margin-left:5px; font-weight:bolder; text-align:center; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">
							<a href="/attraction/detail?attraction_no=${b.attraction_no }">보러가기</a>
							</p>
					</div>
					<div style="width:65%; height:90%; float:left; white-space:nowrap; overflow:hidden;">
<!-- 					 overflow-y:hidden; overflow-x:visible;  -->
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