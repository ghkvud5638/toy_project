<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/header.jsp" />


<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#book").on("click",function(){

		console.log("here")
		var url = "/show/book?show_id="+${showDetail.show_id};
        var name = "popup test";
        var option = "width = 560, height = 500, top = 100, left = 200, location = no"
        window.open(url, name, option);	
    
	})
})
</script>
</head>
<body>
<h1>detail</h1>

<img style="width:400px; height: 500px;" class="showListImg" src="${showDetail.show_image }">

<table border="1">
	<tr>
		<th>공연 이름</th>
		<td>${showDetail.show_name }</td>
	</tr>
	<tr>
		<th>공연 장소</th>
		<td>${showDetail.show_place }</td>
	</tr>
	<tr>
		<th>공연 기간</th>
		<td><fmt:formatDate value="${showDetail.show_start }" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${showDetail.show_end }" pattern="yyyy-MM-dd" /></td>
	</tr>
	<tr>
		<th>금액</th>
		<td>r석:${showDetail.show_rprice }, s석:${showDetail.show_sprice }</td>
	</tr>
</table>


<button id="book">예약</button>

<c:import url="/WEB-INF/views/footer.jsp" />
			
