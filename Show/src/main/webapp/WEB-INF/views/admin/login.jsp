<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/views/header.jsp" />

<style type="text/css">

.admin_login_title {
	text-align: center;
}


.center-block() {
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.container {
	width: 720px;
	.center-block();
}

.vertical-center {
  min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
  min-height: 65vh; /* These two lines are counted as one :-)       */

  display: flex;
  align-items: center;
  background-color: #EEEEEE;
}

</style>

<div class="vertical-center">
	<div class="container">
		<form action="/admin/login" method="post" class="form-horizontal">
		
			<div class="form-group">
			<p class="admin_login_title">관리자 로그인</p>
				<label class="col-xs-3 control-label" for="id">아이디 : </label>
				<div class="col-xs-6">
					<input type="text" class="form-control" id="adminid" name="adminid" placeholder="관리자 로그인" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-3 control-label" for="pw">패스워드 : </label>
				<div class="col-xs-6">
					<input type="password" class="form-control" id="adminpw" name="adminpw" placeholder="패스워드" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-xs-offset-5">
					<button class="btn btn-primary col-xs-3">로그인</button>
				</div>
			</div>
		</form>
	</div>
</div>

<c:import url="/WEB-INF/views/footer.jsp" />

