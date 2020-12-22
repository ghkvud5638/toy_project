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
<h1>카테고리별</h1>
</div>
		<div class="panel-body">
			<table id="demo-dt-selection" class="table table-striped table-bordered" >
				<thead>
					<tr>
						<th>종류</th>
						<th>인원</th>
						<th>티켓 금액</th>
<!-- 										<th style="width: 10%">금액</th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach var="salesinfo" items="${list }">
					<tr>
						<td>${salesinfo.SHOW_GENRE }</td>
						<td>${salesinfo.TOTAL_C }인</td>
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