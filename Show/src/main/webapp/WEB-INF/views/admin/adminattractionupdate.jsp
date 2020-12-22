<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:import url="/WEB-INF/views/header.jsp" />


<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>

<c:import url="/WEB-INF/views/admin/adminheader.jsp" />

<style>

.form-control{
	font-size: 14px;
}

</style>

<script>
	function fnCancel( numb ) {
// 		alert(numb+"번 누르셨습니다.");
		if(confirm("정말로 삭제하시겠습니까?") == true){
			window.location.href = "/admin/attractiondel?attraction_no="+numb;
		}
	}
</script>

<div class="container-fluid">
  <div class="row flex-nowrap">

    <main class="col-12 py-md-3 pl-md-5 bd-content" role="main">
    
    <div class="container">
	
	<div class="row">
    	<div class="col-md-12">
<div class="page-header">
<h1>볼거리 수정</h1>
</div>

<form action="/admin/attractionupdate" method="post">

<c:forEach items="${view }" var="view">
	볼거리 번호<br> 
	<input readonly="readonly" name="attraction_no" value="${view.attraction_no }" />

	<div class="form-group">
		<label for="attracion_photo">이미지 URL</label>
		<input type="text" id="attraction_photo" name="attraction_photo" value="${view.attraction_photo }" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="attractino_title">제목</label>
		<input type="text" id="attraction_title" name="attraction_title" value="${view.attraction_title }" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="attraction_content">내용</label>
<%-- 		<input type="text" id="attraction_content" name="attraction_content" value="${view.attraction_content }" class="form-control"/> --%>
		<textarea rows="5" style="width:100%" id="attraction_content" name="attraction_content">${view.attraction_content }</textarea>
	</div>
	
	<div class="form-group">
		<label for="attraction_tel">전화번호</label>
		<input type="text" id="attraction_tel" name="attraction_tel" value="${view.attraction_tel }" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="attraction_category1">분류1</label>
		<input type="text" id="attraction_category1" name="attraction_category1" value="${view.attraction_category1 }" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="attraction_category2">분류2</label>
		<input type="text" id="attraction_category2" name="attraction_category2" value="${view.attraction_category2 }" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="attraction_area1">지역1</label>
		<input type="text" id="attraction_area1" name="attraction_area1" value="${view.attraction_area1 }" class="form-control"/>
	</div>
	
		<div class="form-group">
		<label for="attraction_area2">지역2</label>
		<input type="text" id="attraction_area2" name="shattraction_area2ow_lat" value="${view.attraction_area2 }" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="attraction_area3">지역3</label>
		<input type="text" id="attraction_area3" name="attraction_area3" value="${view.attraction_area3 }" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="attraction_addr">상세주소</label>
		<input type="text" id="attraction_addr" name="attraction_addr" value="${view.attraction_addr }" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="attraction_latitude">위도</label>
		<input type="text" id="attraction_latitude" name="attraction_latitude" value="${view.attraction_latitude }" class="form-control"/>
	</div>
	
	<div class="form-group">
		<label for="attraction_longitude">경도</label>
		<input type="text" id="attraction_longitude" name="attraction_longitude" value="${view.attraction_longitude }" class="form-control"/>
	</div>
	
	<div class="text-center">
		<button class="btn btn-primary" id="btnUpdate">수정</button>
		<input type="button" class="btn btn-danger" value="삭제" class="form-control" onclick="fnCancel(${view.attraction_no });" />
	</div>
	
	</c:forEach>
	
</form>

		</div>
	</div>
	</div>

    </main>
  </div>
</div>




<c:import url="/WEB-INF/views/footer.jsp" />


