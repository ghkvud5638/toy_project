<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>로그인 메인</h1>
<hr>


<c:if test="${empty login }"> <%-- 로그인 실패 --%>
<a href="/admin/login"><button>로그인</button></a>
</c:if>

<c:if test="${login }"> <%-- 로그인 성공 --%>
<a href="/admin/mypage"><button>마이페이지</button></a>
<a href="/admin/logout"><button>로그아웃</button></a>
</c:if>



</body>
</html>
