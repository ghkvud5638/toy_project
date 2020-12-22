<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/header.jsp" />


<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>

<style>

.form-control{
	font-size: 14px;
}
</style>

<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
	function fnDelete( numb ) {
		alert(numb+"번 누르셨습니다.");
		if(confirm("정말로 탈퇴시키겠습니까?") == true){
			window.location.href = "/admin/memberdel?member_id="+numb;
		}
	}
</script>

<c:import url="/WEB-INF/views/admin/adminheader.jsp" />

<div class="container-fluid">
  <div class="row flex-nowrap">

    <main class="col-sm-6 col-sm-offset-4" role="main">
    
    <div id="form-group">
    
	<div class="row">
    	<div class="col-md-8">

<div class="page-header">
<h1>회원 수정</h1>
</div>



<form action="/admin/memberupdate" method="post">
	<div class="form-group">
		<label for="member_id">아이디</label><br>
		<input readonly="readonly" name="member_id" value="${view.member_id }" />
	</div>
	<div class="form-group">
		<label for="member_name">이름</label>
		<input type="text" id="member_name" name="member_name" value="${view.member_name }" class="form-control"/>
	</div>
	<div class="form-group">
		<label for="nick">닉네임</label>
		<input type="text" id="nick" name="nick" class="form-control" value="${view.nick }"/>
	</div>
	<div class="form-group">
		<label for="member_addr">주소</label>
		<input type="text" id="member_addr" name="member_addr" class="form-control" value="${view.member_addr }"/>
	</div>
	<div class="form-group">
		<label for="member_grade">등급</label>
		<input type="text" id="member_grade" name="member_grade" class="form-control" value="${view.member_grade }"/>
	</div>
		<div class="form-group">
		<label for="point">포인트</label>
		<input type="text" id="point" name="point" class="form-control" value="${view.point }"/>
	</div>

	<div class="text-center">
		<button class="btn btn-primary" id="btnUpdate">수정</button>
		<input type="button" class="btn btn-danger" value="삭제" class="form-control" onclick="fnDelete('${view.member_id }');" />
	</div>
	
</form>

</div>
</div>
</div>

    </main>
  </div>
</div>




<c:import url="/WEB-INF/views/footer.jsp" />

