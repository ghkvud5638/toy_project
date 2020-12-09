<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/header.jsp" />



<style type="text/css">

</style>

</head>
<body>
<h1>Show List</h1>
<table border="1">
		<tr>
			<th>공연 이름</th>
			<th>공연 장소</th>
			<th>공연 기간</th>
			<th>사진</th>
		</tr>
	<c:forEach var="l" items="${showList }">
		<tr>
			<td>${l.show_name }</td>
			<td>${l.show_place }</td>
			<td><fmt:formatDate value="${l.show_start }" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${l.show_end }" pattern="yyyy-MM-dd" /></td>
			<td>
				<a href="/show/detail?show_id=${l.show_id }">
					<img style="width: 120px; height: 150px;" class="showListImg" src="${l.show_image }">
				</a>
			</td>
			
		</tr>
	</c:forEach>
</table>

<c:import url="/WEB-INF/views/footer.jsp" />

