<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<c:import url="/WEB-INF/views/header.jsp" />


<div id="container">


<h1>회원수정</h1>
<hr>


<form action="/admin/memberupdate" method="post">
	<input readonly="readonly" name="member_id" value="${view.member_id }" />

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
		<input type="reset" id="cancel" class="btn btn-danger" value="취소"/>
	</div>
	
</form>

</div>


<c:import url="/WEB-INF/views/footer.jsp" />
