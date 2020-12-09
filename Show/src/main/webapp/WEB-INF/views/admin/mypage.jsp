<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>마이페이지</h1>
<hr>

아이디 ${info.adminid }<br>
<%-- 패스워드 ${info.pw }<br> --%>
<%-- 이메일 ${info.email }<br> --%>
<%-- 전화번호 ${info.phone }<br><br> --%>

<a href="/admin/memberlist"><button>회원정보보기</button></a><br><br>

<a href="/admin/showlist"><button>공연리스트보기</button></a>

<a href="/admin/main"><button>메인</button></a>

</body>
</html>
