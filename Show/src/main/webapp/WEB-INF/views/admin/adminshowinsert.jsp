<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/header.jsp" />


<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>

<c:import url="/WEB-INF/views/admin/adminheader.jsp" />

<div class="container-fluid">
  <div class="row flex-nowrap">
    <main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
    
    <div id="container">

	<div class="row">
    	<div class="col-md-12">

<div class="page-header">
<h1>공연 등록</h1>
</div>


<form action="/admin/showinsert" method="post">
	<div class="form-group">
		<label for="show_id">공연ID</label>
		<input type="text" id="show_id" name="show_id" class="form-control" />
	</div>
	<div class="form-group">
		<label for="show_division">구분</label>
		<input type="text" id="show_division" name="show_division" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="show_genre">장르</label>
		<input type="text" id="show_genre" name="show_genre" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="show_place">장소</label>
		<input type="text" id="show_place" name="show_place" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="show_name">이름</label>
		<input type="text" id="show_name" name="show_name" class="form-control"/>
	</div>
	
	
	<div class="form-group">
		<label for="show_start">시작날짜 (RR/MM/DD)</label>
		<input type="text" id="show_start" name="show_start" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="show_end">종료날짜 (RR/MM/DD)</label>
		<input type="text" id="show_end" name="show_end" class="form-control"/>
	</div>

	
	<div class="form-group">
		<label for="show_rprice">R석 가격</label>
		<input type="text" id="show_rprice" name="show_rprice" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="show_sprice">S석 가격</label>
		<input type="text" id="show_sprice" name="show_sprice" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="show_time">상영시간</label>
		<input type="text" id="show_time" name="show_time" class="form-control"/>
	</div>
	
		<div class="form-group">
		<label for="show_lat">경도</label>
		<input type="text" id="show_lat" name="show_lat" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="show_len">위도</label>
		<input type="text" id="show_len" name="show_len" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="show_call">전화번호</label>
		<input type="text" id="show_call" name="show_call" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="show_image">이미지URL</label>
		<input type="text" id="show_image" name="show_image" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="show_cast">출연진</label>
		<input type="text" id="show_cast" name="show_cast" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="show_age">연령제한</label>
		<input type="text" id="show_age" name="show_age" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="show_host">주최</label>
		<input type="text" id="show_host" name="show_host" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="show_sub">주관</label>
		<input type="text" id="show_sub" name="show_sub" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="show_addr">주소</label>
		<input type="text" id="show_addr" name="show_addr" class="form-control"/>
	</div>

	<div class="text-center">
		<button class="btn btn-primary" id="btnUpdate">삽입</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소"/>
	</div>
	
</form>

	</div>
</div>

</div>

    </main>
  </div>
</div>




<c:import url="/WEB-INF/views/footer.jsp" />