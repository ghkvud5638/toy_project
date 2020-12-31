<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/header.jsp" />

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
	
	white-space:nowrap;	
	text-overflow: ellipsis;
	overflow: hidden;
}

.result{
	
}
.footer{
    background-color: #2b2b2b;
    /* height: 292px; */
    bottom: 0;
    position: absolute;
    text-align: center;
    width: 100%;
}

</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		$(".btn").on("click", function(e){
			$("#result"+e.target.id).toggle();
			console.log($("#tr"+e.target.id).children().eq(0).text())
			console.log($("#tr"+e.target.id).children().eq(2).text())
			var showId = $("#tr"+e.target.id).children().eq(0).text();
			var bookDate = $("#tr"+e.target.id).children().eq(2).text();
			
			$.ajax({
			       type: "GET",
			       url: "/myPage/bookDetail",
			       data: {show_id:showId, book_date:bookDate},
			       dataType: "html",
// 			       contentType : 'application/json'
			       success : function(res) {
			    	   console.log("ok");
			    	   console.log(res);
			    	   $("#result"+e.target.id).html(res);
			       }
			});
			
			
			
		})
		

		
		
		
	})

</script>


<div class="container">
<h1 class="pull-left">예매 내역</h1>
<div class="clearfix"></div>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%">공연 id</th>
		<th style="width: 15%">공연 제목</th>
		<th style="width: 10%">날짜</th>
		<th style="width: 20%">이미지</th>
		<th style="width: 15%">상세 보기</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${list }" var="l" varStatus="i">
	<tr id="tr${i.count }" class="bookInfoTr">	
		<fmt:parseDate value="${l.book_date}" var="showDate" pattern="yyyy-MM-dd"/>
		<td style="vertical-align: middle;">${l.show_id }</td>
		<td style="vertical-align: middle;">${l.show_name }</td>
		<td style="vertical-align: middle;"><fmt:formatDate value="${showDate}" pattern="yyyy/MM/dd"/></td>
		<td><img src="${l.show_image }" alt="이미지 준비중" style="width: 90px; height: 120px;"/></td>
		<td style="vertical-align: middle;">
			<button class="btn" id="${i.count }">상세 보기</button>
		</td>	
	</tr>
	<tr class="result" id="result${i.count }"></tr>
	</c:forEach>
</tbody>
</table>


<div class="clearfix"></div>


</div>






<c:import url="/WEB-INF/views/footer.jsp" />
