<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    

    
  
<c:set var="start">
	<fmt:formatDate value="${showDetail.show_start }" pattern="yyyy-MM-dd" />
</c:set>
<c:set var="end">
	<fmt:formatDate value="${showDetail.show_end }" pattern="yyyy-MM-dd" />
</c:set>


<img id="showDetailSideImg" style="width: 140px;
    height: 175px;
/*     position: absolute; */
    margin:-303px 55px 0px 495px;" class="showImg" src="${showDetail.show_image }">

<div id="showDetailWrap">
	<ul class="showDetail">
		<li><span>제목  | </span></li>
		<li>${showDetail.show_name }</li>
	</ul>
	<ul class="showDetail">
		<li><span>날짜  | </span></li>
		<li>${start } ~ </li>
	</ul>
	<ul class="showDetail">
		<li><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
		<li>${end }</li>
	</ul>	
	<ul class="showDetail">
		<li><span>시간  | </span></li>
		<li>${showDetail.show_time }</li>
	</ul>
	<ul class="showDetail">
		<li><span>연령  | </span></li>
		<li>${showDetail.show_age }</li>
	</ul>
	<ul class="showDetail">
		<li><span>포인트 | </span></li>
		<li>${member.point }</li>
		<li id="point"></li>
	</ul>
	<ul class="showDetail">
		<li><strong>총 금액  </strong>|</li>
		<li><div id="totalPrice"></div></li>
	</ul>
</div>
