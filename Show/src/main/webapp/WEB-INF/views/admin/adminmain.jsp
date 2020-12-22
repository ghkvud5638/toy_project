<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:import url="/WEB-INF/views/header.jsp" />


<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>

<c:import url="/WEB-INF/views/admin/adminheader.jsp" />

<div class="container-fluid">
  <div class="row flex-nowrap">

    <main class="col-12 py-md-3 pl-md-5 bd-content" role="main">
    
    <div class="container">
	
	<div class="row">
    	<div class="col-md-12">
<div class="page-header">
<h1>관리자 메인</h1>
</div>

	<div id="container" class="effect aside-float aside-bright mainnav-lg">

		<div class="boxed">

			<div id="content-container">
				

				<div id="page-content">
					
					
					<div class="row">

						<div class="col-sm-6 col-md-4" style="width: 25%;">
							<a href="/admin/salesdate" class="m-ho big-ho">
								<div class="panel panel-info panel-colorful">
									<div class="panel-body text-center">
										<p class="text-uppercase mar-btm text-sm" style="font-size: 18px;">이번년도 매출</p>
										<i class="fa fa-dollar fa-5x"></i>
										<hr>
										<p class="h2 text-thin">
											<c:forEach var="total" items="${total }">
												<fmt:formatNumber value="${total.TOTAL }" type="number" maxFractionDigits="3"/>
											</c:forEach>
										원
										</p>
										<small><span class="text-semibold">전일 
										

												<c:forEach var="yday" items="${yday }">
													<c:if test="${empty(yday.TOTAL) }">
														0
													</c:if>
													<fmt:formatNumber value="${yday.TOTAL }" type="number" maxFractionDigits="3"/>
												</c:forEach>
										
										</span>원</small>
									</div>
								</div>
							</a>
						</div>
					</div>
					
					<div class="row">
						<div class="col-lg-6">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title" style="font-size: 20px;">날짜별 매출</h3>
									<hr>
								</div>
								<div class="panel-body">
									<table id="demo-dt-selection" class="table table-striped table-bordered" >
											<thead>
												<tr>
													<th>날짜</th>
													<th>매출</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="days" items="${days }" end="5">
												<tr>
													<td>${days.PAYMENT_DATE }</td>
													<td><fmt:formatNumber value="${days.TOTAL_M }" type="number" maxFractionDigits="3"/>원</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>    
									
								<div id="morris-line-day" style="height:212px"></div>
					
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="panel">
								<div class="panel-heading">
									<h2 class="panel-title" style="font-size: 20px;">장르별 매출</h2>
									<hr>
								</div>
								<div class="panel-body">
										<table id="demo-dt-selection" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>장르</th>
												<th>매출</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="genre" items="${genre }" end="5">
											<tr>
												<td>${genre.SHOW_GENRE }</td>
												<td><fmt:formatNumber value="${genre.TOTAL_P }" type="number" maxFractionDigits="3"/>원</td>
											</tr>
											</c:forEach>
										</tbody>
									</table> 
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>


	</div>



		</div>
	</div>
	</div>


    </main>
  </div>
</div>




<c:import url="/WEB-INF/views/footer.jsp" />