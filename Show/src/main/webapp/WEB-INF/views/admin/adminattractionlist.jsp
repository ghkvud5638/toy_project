<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>볼거리 리스트</h1>
</div>

<div>
    <a href="/admin/attractioninsert"><input type="button" class="btn btn-primary col-md-1" value="볼거리 등록" class="form-control" onclick="fnbutton();" /></a>
</div>
<div style="float:right;">
	<form action="/admin/attractionlist" method="get">
		<input type="text" id="searchText" name="searchText" value="">
		<button>검색</button>
	</form>
</div>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th>번호</th>
<!-- 		<th>테스트</th> -->
		<th>분류1</th>
		<th>분류2</th>
		<th>제목</th>
	</tr>
</thead>
<tbody>
		<c:forEach items="${attraclist }" var="att">
	<tr>
		<td>${att.attraction_no }</td>
<%-- 		<td>${att.attraction_photo }</td> --%>
		<td>${att.attraction_category1 }</td>
		<td>${att.attraction_category2 }</td>
<%-- 		<td>${att.attraction_title }</td> --%>
		<td><a href="/admin/attractionupdate?attraction_no=${att.attraction_no }">${att.attraction_title }</a></td>
	</tr>
</c:forEach>
</tbody>
</table>
	<span class="pull-left">total : ${paging.totalCount }</span>
	<div class="clearfix"></div>
	<jsp:include page="/WEB-INF/views/util/adminattractionlistpaging.jsp" />

	</div>
	</div>
	</div>
    </main>
  </div>
</div>

<c:import url="/WEB-INF/views/footer.jsp" />