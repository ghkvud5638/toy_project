<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<c:import url="/WEB-INF/views/header.jsp" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.join-complete-wrapper {
	text-align: center; 
	padding: 100px;
}

html,.join-complete-wrapper{
  height:100%;
}
.join-complete-wrapper{
  text-align:center;
}
.join-complete-wrapper:before{
  content:'';
  height:100%;
  display:inline-block;
  vertical-align:middle;
}
.join-main-button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
.join-main-button:hover{
  background:#fff;
  color:#1AAB8A;
}
.join-main-button:before,.join-main-button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
.join-main-button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.join-main-button:hover:before,.join-main-button:hover:after{
  width:100%;
  transition:800ms ease all;
}

</style>
</head>
<body>

<div class="join-complete-wrapper">
<h2>회원가입이 완료되었습니다</h2>

<br>
<div class="join-main-button-wrap">
  		<a href="http://localhost:8088/main/main" class="join-main-button">메인으로</a>
	</div>
<!-- <a href="http://localhost:8088/main/main">메인으로</a> -->
</div>
<br>
<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>