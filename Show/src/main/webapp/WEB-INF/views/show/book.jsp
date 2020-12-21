<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">
/* *{ */
/* 	margin: 0; */
/* } */

*{
	margin: 0;
}

.choiceDay{
    margin: 30px 0 0 0px;
}

.showImg{
	float: right;	
}
.bookTable{
	margin: -70px 0 0 254px;
    table-layout: fixed;
    width: 100px;
}
.bookNext{
	border:0;
	outline: 0;
	cursor: pointer;
	position: absolute;
    margin: 0px 0 0px 438px;
    /* float: right; */
    bottom: 25px;
    padding: 8px 65px 8px 65px;
    background-color: #ff6633;
    opacity: .9;
    border-radius: 5px;
}
.showDetail > li {
 	list-style: none;
 	display: inline-block;
}

#showDetailWrap{
	
    float: right;
    margin: -106px 15px 1px 0px;
}
#choiceDate{
	font-weight: bolder;
}

#bookingDate{
	margin: -18px 0 0 0px;
}

#bookHeaderWrap{
/* 	position: absolute; */
	background-color: #2b2b2b;
	padding: 20px 0 20px 0px;
	margin:0;
}


#bookHeader{
	color:white;
}

#wrap{
    padding: 12px;
}

</style>




<script type="text/javascript">
$(document).ready(function(){
	var start = $("#start").val()
	var end = $("#end").val()
	console.log(start)
	console.log(end)
	
	
	
	
	
	$(function(){
	    $("#bookingDate").datepicker({
    	  changeYear:true,
    	  changeMonth:true, 
          showOn: "both",
//           buttonImage: "/images/calendar.png",
          buttonImageOnly: false,
          buttonText: "날짜 선택",
          minDate: new Date(start),
          maxDate: new Date(end), 
          dateFormat: "yy/mm/dd",
          dayNamesMin: ['일','월', '화', '수', '목', '금', '토' ],
          monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
	    });
	
// 	    $("#bookingDate").val($.datepicker.formatDate('yyyy/MM/dd', new Date()));

	});
})
function chkForm(){
	console.log($("#today").val())
	console.log($("#bookingDate").val())
	
	var t = new Date($("#today").val())
	var b = new Date($("#bookingDate").val())
	var expirationCnt = (b-t)/1000/60/60/24;
	
	if (t > b) {
		alert("잘못된 날짜 선택입니다.")
		return false;	
	}else{
		if (expirationCnt<=3) {
			alert("입금 기한은 공연날짜로 부터 3일전 까지 입니다. 입금 기한이 지났습니다.")
			return false;
		}
		
		return true;
	} 
}



</script>
</head>
<body>

<div id="bookHeaderWrap">
	<h2 id="bookHeader">KH아트센터 티켓예매 - 날짜</h2>
</div>
<hr>


<div id="wrap">
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />


<c:set var="start">
	<fmt:formatDate value="${showDetail.show_start }" pattern="yyyy-MM-dd" />
</c:set>
<c:set var="end">
	<fmt:formatDate value="${showDetail.show_end }" pattern="yyyy-MM-dd" />
</c:set>


<input type="hidden" id="today" value="${today }">
<input type="hidden" id="start" value="${start }"/>
<input type="hidden" id="end" value="${end }"/>

<label id="choiceDate">관람일 선택</label><br>
<div class="choiceDay">
<form action="/show/book2" method="post" onsubmit="return chkForm()">
<%-- 	<input type="text" name="book_date" id="bookingDate" size="12" value="${today}"/><br> --%>
	<div id="bookingDate"><input type="hidden" name="book_date" id="bookingDate" size="12" value="${today}"/></div>
	
	<input type="hidden" name="show_id" value="${showDetail.show_id }">
	<button class="bookNext">다음 단계</button><br><br><br>
</form>
</div>

 <c:import url="/WEB-INF/views/show/bookDetailSideInfo.jsp" /> 

<%-- <img style="width: 140px; height: 175px; position: absolute; margin: -303px 0px 0px 453px;" class="showImg" src="${showDetail.show_image }"> --%>

<!-- <div id="showDetailWrap"> -->
<!-- 	<ul class="showDetail"> -->
<!-- 		<li><span>제목  | </span></li> -->
<%-- 		<li>${showDetail.show_name }</li> --%>
<!-- 	</ul> -->
<!-- 	<ul class="showDetail"> -->
<!-- 		<li><span>날짜  | </span></li> -->
<%-- 		<li>${start } ~ ${end }</li> --%>
<!-- 	</ul> -->
<!-- 	<ul class="showDetail"> -->
<!-- 		<li><span>시간  | </span></li> -->
<%-- 		<li>${showDetail.show_time }</li> --%>
<!-- 	</ul> -->
<!-- 	<ul class="showDetail"> -->
<!-- 		<li><span>연령  | </span></li> -->
<%-- 		<li>${showDetail.show_age }</li> --%>
<!-- 	</ul> -->
<!-- 	<ul class="showDetail"> -->
<!-- 		<li><span>포인트 | </span></li> -->
<%-- 		<li>${member.point }</li> --%>
<!-- 	</ul> -->
<!-- </div> -->



<img style="width: 410px; height:190px; margin:-51px 0 0 0;" alt="#" src="/resources/images/u.jpg">	

</div>
</body>
</html>