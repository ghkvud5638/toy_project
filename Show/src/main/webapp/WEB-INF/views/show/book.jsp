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
}}
.bookNext{
	border:0;
	outline: 0;
	cursor: pointer;
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
</script>
</head>
<body>
<h1>BOOK</h1>
<hr>


<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />


<c:set var="start">
	<fmt:formatDate value="${showDetail.show_start }" pattern="yyyy-MM-dd" />
</c:set>
<c:set var="end">
	<fmt:formatDate value="${showDetail.show_end }" pattern="yyyy-MM-dd" />
</c:set>



<input type="hidden" id="start" value="${start }"/>
<input type="hidden" id="end" value="${end }"/>

${showDetail.show_time } 
<div class="choiceDay">
<form action="/show/book2" method="post">
	<button class="bookNext">다음 단계</button><br><br><br>
	<label for="bookingDate">관람일 선택</label><br>
	<input type="text" name="book_date" id="bookingDate" size="12" value="${today}"/><br>
	<input type="hidden" name="show_id" value="${showDetail.show_id }">
</form>
</div>

<img style="width:100px; height: 110px; position: absolute;
    margin: -101px 0px 0px 418px;" class="showImg" src="${showDetail.show_image }">

<table class="bookTable">
	<caption>잔여석</caption>
	<tr>
	</tr>
	<tr>
		<th>r석</th>
		<td>${seatCnt.seatr_cnt }</td>
	</tr>
	<tr>
		<th>s석</th>
		<td>${seatCnt.seats_cnt }</td>
	</tr>
</table>

<img style="width:525px; margin: 25px 0 0 0;" alt="#" src="/resources/images/u.jpg">	


</body>
</html>