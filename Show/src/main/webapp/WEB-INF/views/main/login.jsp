<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<c:import url="/WEB-INF/views/header.jsp" />
<head>
<style>
#content {
	width: 1100px;
	margin: auto;
	overflow: hidden;
	padding: 0 0 0 0;
	background: #fff;
	min-height: 500px;
	padding-top: 42px;
	padding-bottom: 30px;
}

#container {
	position: relative;
	width: 100%;
	margin: 0 0;
	background: #f6f6f6;
}

.main-login-member {
	font-size: 50px;
	text-shadow: 0 0 10px #666;
	color: #fff;
	margin: 0 auto;
	text-align: center;
	text-transform: capitalize;
	font-family: "맑은 고딕";
	font-style: italic;
}

body {
	font-family: "맑은 고딕";
	font-size: 12px;
}

.main-login-form {
	width: 498px;
	height: 300px;
	border-radius: 25px;
	border: 5px double #999;
	margin: 30px auto;
}

.main-login-form2 {
	width: 380px;
	min-width: 320px;
	height: 200px;
	margin: 60px auto;
	margin-left: 20px;
}

.main-login-form3 {
	float: left;
	/*   background:#f00;  */
}

.main-login-form3 label {
	width: 100px;
	height: 20px;
	/*  display: block; */
	float: left;
}

.main-login-form4 {
	padding: 0px 0px 0px 70px;
}

#main-login-wrap {
	width: 600px;
	height: 500px;
	margin: 0 auto;
}

.main-login-clear {
	clear: both;
}

input[type="submit"] {
	float: left;
	/*  display:block; */
	height: 50px;
	background: #FFBB00;
	border-radius: 5px;
	border: none;
	font-family: "맑은 고딕";
}

input[type="button"] {
	height: 30px;
	background: gray;
	border-radius: 5px;
	/*  width: 140px; */
	font-family: "맑은 고딕";
	margin-top: 10px;
	margin-right: 20px;
}

input[type="checkbox"] {
	margin-top: 20px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container" class="xb">
		<div id="content">
			<form action="/main/login" method="post">
				<div id="main-login-wrap">
					<h1 class="main-login-member">member login</h1>
					<div class="main-login-form">
						<div class="main-login-form2">
							<div class="main-login-form3">
								<label for="user">아이디</label><input type="text" id="member_id" name="member_id">
								<div class="main-login-clear"></div>
								<label for="user">비밀번호</label><input type="password" id="member_pw" name="member_pw" >
							</div>
							<input type="submit" value="로그인하기">
							<div class="main-login-clear"></div>
							<div class="main-login-form4">
								<label><input type="checkbox">아이디저장</label> <label><input
									type="checkbox">보안접속</label>
								<div class="main-login-clear"></div>
								<label><input type="button" value="회원가입"></label> <label><input
									type="button" value="아이디/비밀번호 찾기"></label>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>