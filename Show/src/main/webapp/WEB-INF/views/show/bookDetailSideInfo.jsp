<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
		<li>${start } ~ ${end }</li>
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
	</ul>
</div>