<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/views/header.jsp" />

<script type="text/javascript">
$(document).ready(function(){
	setTimeout(function(){
		alert("메인 페이지로 이동");
		location.href = "/main/main";
	},3000)
	
	
	var i = 3;
	setInterval(function(){
		$("#time").text(--i);
	},1000)
	
})
</script>



<div class="container">

<h1 style="color:red;">에러 게시판</h1>
<hr>
게시판은 로그인 후 이용할 수 있습니다<br>
<span id="time">3</span>초 후 메인 페이지로 이동
</div>


<c:import url="/WEB-INF/views/footer.jsp" />