<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/header.jsp" />


<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>

<c:import url="/WEB-INF/views/admin/adminheader.jsp" />

<div class="container-fluid">
  <div class="row flex-nowrap">
    <div class="col-3 bd-sidebar">
      <ul class="nav">
        <li><h2><a href="/admin/salesdate">날짜별</a></h2></li>
        <li><h2><a href="/admin/salescategory">카테고리별</a></h2></li>
        <li><h2><a href="/admin/salesplace">장소별</a></h2></li>
      </ul>
      <br>
    </div>
    <main class="col-9 py-md-3 pl-md-5 bd-content" role="main">

<div class="container">
             
	<div class="row">
    	<div class="col-md-12">
<div class="page-header">
<h1>날짜별</h1>
</div>

<form action="/admin/salesdate" method="post">						
	<div class="col-md-4" style="float: right;">
	
	<select id="book_year" name="book_year">
	<c:forEach var="paymentdate" items="${booklist }">
		<option value="${paymentdate.payment_date }">${paymentdate.payment_date }</option>
	</c:forEach>
	</select>

	<select id="book_month" name="book_month">
		<option value="">선택안함</option>
		<option value="01">1월</option>
		<option value="02">2월</option>
		<option value="03">3월</option>
		<option value="04">4월</option>
		<option value="05">5월</option>
		<option value="06">6월</option>
		<option value="07">7월</option>
		<option value="08">8월</option>
		<option value="09">9월</option>
		<option value="10">10월</option>
		<option value="11">11월</option>
		<option value="12">12월</option>
	</select>
	<button>검색</button>
	
	</div>
</form>
		<div class="panel-body">
			<table id="demo-dt-selection" class="table table-striped table-bordered" >
				<thead>
					<tr>
						<th>날짜</th>
						<th>티켓 판매량</th>
						<th>금액</th>
<!-- 										<th style="width: 10%">금액</th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach var="salesinfo" items="${list }">
					<tr>
						<td>${salesinfo.PAYMENT_DATE }</td>
						<td>${salesinfo.TOTAL_C }</td>
						<td><fmt:formatNumber value="${salesinfo.TOTAL_P }" type="number" maxFractionDigits="3"/>원</td>
					</tr>
					</c:forEach>

				</tbody>
			</table>    
    	</div>
	</div>
</div>

</div>


    </main>
  </div>
</div>


<c:import url="/WEB-INF/views/footer.jsp" />