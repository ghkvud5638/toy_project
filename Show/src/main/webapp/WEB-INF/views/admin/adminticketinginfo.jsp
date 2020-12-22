<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/header.jsp" />


<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>

<script>
	function fnCancel( numb ) {
		//alert(numb+"번 누르셨습니다.");
		if(confirm("정말로 취소하시겠습니까?") == true){
			window.location.href = "/admin/ticketingcancel?book_id="+numb;
		}
	}
</script>

<c:import url="/WEB-INF/views/admin/adminheader.jsp" />

<div class="container-fluid">
  <div class="row flex-nowrap">

    <main class="col-12 py-md-3 pl-md-5 bd-content" role="main">
    
    <div class="container">
             
	<div class="row">
    	<div class="col-md-12">
<div class="page-header">
<h1>예매 관리</h1>
</div>

<div style="float:right;">
	<form action="/admin/ticketinginfo" method="get">
		<input type="text" id="searchText" name="searchText" value="">
		<button>아이디검색</button>
	</form>
</div>

		<div>
			<table id="demo-dt-selection" class="table table-striped table-bordered" >
				<thead>
					<tr>
						<th>아이디</th>
						<th>공연이름</th>
						<th>공연날짜</th>
						<th>구매날짜</th>
						<th>좌석등급</th>
						<th>좌석위치</th>
						<th>금액</th>
						<th>공연장</th>
						<th>결제여부</th>
						<th>예매취소</th>
<!-- 										<th style="width: 10%">금액</th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ticketinginfo" items="${list }">
					<tr>
<%-- 					<input type="hidden" value="${ticketinginfo.BOOK_ID }" /> --%>
						<td>${ticketinginfo.MEMBER_ID }</td>
						<td>${ticketinginfo.SHOW_NAME }</td>
						<td><fmt:formatDate value="${ticketinginfo.BOOK_DATE }" pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${ticketinginfo.PAYMENT_DATE }" pattern="yyyy-MM-dd" /></td>
						<td>${ticketinginfo.SEAT_GRADE }</td>
						<td>${ticketinginfo.SEAT_NUM }</td>
						<td><fmt:formatNumber value="${ticketinginfo.SEAT_PRICE }" type="number" maxFractionDigits="3"/></td>
						<td>${ticketinginfo.SHOW_PLACE }</td>
						<td>${ticketinginfo.STATUS }</td>
						<td>
							<!--
							<a href="/admin/ticketingcancel?book_id=${ticketinginfo.BOOK_ID }"><button>예매취소</button></a>
							-->
							<button onclick="fnCancel(${ticketinginfo.BOOK_ID });">예매취소</button>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<span class="pull-left">total : ${paging.totalCount }</span>
			<jsp:include page="/WEB-INF/views/util/adminattractionlistpaging.jsp" />
			 </div>   
	</div>
</div>
</div>
    </main>
  </div>
</div>




<c:import url="/WEB-INF/views/footer.jsp" />