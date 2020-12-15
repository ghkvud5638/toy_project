<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/header.jsp" />
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>



<style type="text/css">
.goods_list {
	margin-left: 20px;
	overflow: hidden;
}

.goods_list li {
	float: left;
	position: relative;
	overflow: hidden;
	width: 234px;
	height: 384px;
	padding-bottom: 3px;
	margin: 0 0 15px 18px;
	color: #777;
	background: no-repeat 0 bottom;
	border-radius: 2px 2px 0 0;
	box-shadow:2px 2px 2px rgba(0,0,0,0.2);
}

.goods_list li a {
	display: block;
}

.goods_list li p {
	height: 285px;
}

.goods_list li img {
	width: 234px;
	height: 285px;
}

.goods_list li .list_info {
	padding: 14px 14px 13px 13px;
	height: 70px;
	background: #fff;
	border: 1px solid white;
	border-radius: 0 0 2px 2px;
	-webkit-border-radius: 0 0 2px 2px;
	-moz-border-radius: 0 0 2px 2px;
	-o-border-radius: 0 0 2px 2px;
}

.goods_list li strong {
	color: #222;
	font-size: 16px;
	letter-spacing: -1px;
	display: block;
	margin-bottom: 6px;
}

.goods_list li strong span {
	color: #319f00;
}

.goods_list li .list_info dl {
	padding-left: 1px;
}

.goods_list li dt {
	display: block;
	visibility: hidden;
	overflow: hidden;
	position: absolute;
	top: -1000em;
	left: 0;
}

.goods_list li dd {
	overflow: hidden;
	height: 22px;
	text-overflow: ellipsis;
	word-break: keep-all;
	white-space: nowrap;
	line-height: 22px;
	color: #767676;
}

.elp {
	display: block;
	overflow: hidden;
	width: 100%;
	white-space: nowrap;
	text-overflow: ellipsis;
}


.schedule{
	position: absolute;
	clear: both;
	float: left;
	left: 21%;
    margin: -45px 0 0 0px;
}
	
}
.month{
	float: left;
}
.select-month-ul{
	list-style: none;
	display: inline-block;
	
}
.select-month-ul > li{
	float: left;
}
.month_no{
	padding: 0px 10px 0px 10px;
	font-size: 20px;
	border: 1px solid #ccc;
	cursor: pointer;
}

.month_no:hover{
	background-color: #ff6633;
	opacity: .9;
}
.yearWrap{
    position: absolute;
	margin: 7px 0 0 -119px;    
	font-size: 20px;
}

.year{
    padding: 0 15px 0 15px;
}

.beforeYear{
	cursor: pointer;
	color: #ff6633;
}

.nextYear{
	cursor: pointer;
	color: #ff6633;
}

.clicked{
	background-color: #ff6633;
}

.attraction-detail-viewBtnList{

}


.attraction-detail-viewBtnList:hover{
	cursor: pointer;
/* 	background-color: #c3c3c3; */
/* 	text-decoration: underline; */
/*  	font-weight:bolder; */
	 	
}
#attraction-detail-detailmap {
	margin: 0 auto;
 	transition: all 0.5s ease-in-out; 
	width: 973px;
 	height:0px;
	border-radius:5px;
}
#selectBoxSearchArea{
	padding: 25px;
}











#wrapper {
  width:150px;
  height:150px;
/*   background: green; */
/*   box-shadow: 0 1px 15px rgba(0,0,0,.8); */
  position:absolute;
  margin: -110px 0 0 725px;
}

#line-wrapper {
  cursor:pointer;
  width:56px;
  height:35px;
  position:relative;
  top:52.5px;
  left:47px;
}

/* 추가된 부분 */
.init {
  animation:none !important;
}

.line {
  background:#ff6633;
  margin-top:6px;
  margin-bottom:6px;
  width:56px;
  height:7px; 
  border-radius:2px;
  box-shadow:0 1px 3px rgba(0,0,0,.5);
  position:relative;
}

.line-top {
  animation:line-top .5s forwards ease-out,
            line-top-rotate .3s .5s forwards ease-out;
}

/* 추가된 부분 */
.top-reverse {
  animation:line-top-rotate-reverse .3s forwards ease-out,
            line-top-reverse .5s .3s forwards ease-out;
}

.line-mid {
  animation:line-mid .5s forwards ease-out;
}

/* 추가된 부분 */
.mid-reverse {
  animation:line-mid-invisible .3s forwards ease-out, 
            line-mid-reverse .5s .3s forwards ease-out;
}

.line-bot {
  animation:line-bot .5s forwards ease-out,
            line-bot-rotate .3s .5s forwards ease-out;
}

/* 추가된 부분 */
.bot-reverse {
  animation:line-bot-rotate-reverse .3s forwards ease-out,
            line-bot-reverse .5s .3s forwards ease-out;
}

@keyframes line-top {
  0% {transform:translateY(0px)}
  100% {transform:translateY(13px)}
}

/* 추가된 부분 */
@keyframes line-top-reverse {
  0% {transform:translateY(13px)}
  100% {transform:translateY(0px)}
}

@keyframes line-top-rotate {
  0% {transform:translateY(13px) rotateZ(0deg)}
  100% {transform:translateY(13px) rotateZ(45deg)}
}

/* 추가된 부분 */
@keyframes line-top-rotate-reverse {
  0% {transform:translateY(13px) rotateZ(45deg)}
  100% {transform:translateY(13px) rotateZ(0deg)}
}

@keyframes line-mid {
  0% {transform:scale(1)}
  100% {transform:scale(0)}
}

/* 추가된 부분 */
@keyframes line-mid-reverse {
  0% {transform:scale(0)}
  100% {transform:scale(1)}
}

@keyframes line-mid-invisible {
  0% {transform:scale(0)}
  100% {transform:scale(0)}
}

@keyframes line-bot {
  0% {transform:translateY(0px)}
  100% {transform:translateY(-13px)}
}

/* 추가된 부분 */
@keyframes line-bot-reverse {
  0% {transform:translateY(-13px)}
  100% {transform:translateY(0px)}
}

@keyframes line-bot-rotate {
  0% {transform:translateY(-13px) rotateZ(0deg)}
  100% {transform:translateY(-13px) rotateZ(135deg)}
}

/* 추가된 부분 */
@keyframes line-bot-rotate-reverse {
  0% {transform:translateY(-13px) rotateZ(135deg)}
  100% {transform:translateY(-13px) rotateZ(0deg)}
}





</style>


<script type="text/javascript">
$(document).ready(function(){
	
	//클릭된 월 색 변경
	console.log($("#hiddenMonth").val())
	if ($("#hiddenMonth").val() !="") {
		var hn = $("#hiddenMonth").val();
		$("#monthNum"+hn).addClass("clicked");
	}
	
	//선택된 연도 화면에 써줌
	var thisYear = new Date().getFullYear();
	console.log(thisYear)
	if ($(".year").text()=="") {
		$(".year").text(thisYear)
	}else{ 
		$(".year").text(${paging.year})
	}
	
	//연도 +, -
	var yearNo = 0;
	$(".beforeYear").on("click", function(e){
		console.log("beforeYear")
		yearNo = Number($(".year").text());
		yearNo-=1;
		$(".year").text(yearNo)
		location.href="/show/list?year="+$(".year").text(); // year만 있고 month는 null 인 상태에서 검색 가능하도록
	})	
	$(".nextYear").on("click", function(e){
		console.log("beforeYear")
		
		yearNo = Number($(".year").text());
		yearNo+=1;
		$(".year").text(yearNo)
		location.href="/show/list?year="+$(".year").text();
	})
	
	//월 클릭시 조회
	$(".month_no").on("click", function(e){
		console.log(e.target.value)
		location.href="/show/list?year="+$(".year").text()+"&month="+e.target.value;
		
	})
	
	//all 클릭시 조회
	$("#all").on("click", function(e){

		location.href="/show/list?year="+$(".year").text();
		
	})
	
	
	
	$('.attraction-detail-viewBtnList').click(function(){
		console.log("here")
// 		$("#attraction-detail-detailmap").toggle();
		
		var height = $("#attraction-detail-detailmap").height();
		
		console.log(height)
		
		if (height === 0) {
			console.log("길이가 0이다, 펼쳐주자")
			$("#attraction-detail-detailmap").css("background-color", "#ffceb0")
			setTimeout(function(){
				$("#attraction-detail-detailmap").css("height", "300px")	
			},151);
			setTimeout(function(){
	    		$("#attraction-detail-detailmap").load("/show/selectBoxSearch");
			},351)		
		}else{
			console.log("펼쳐저있다, 접어주자")	
			setTimeout(function(){
				$("#attraction-detail-detailmap").css("height", "0px")	
			},151);
			setTimeout(function(){
	    		$("#selectBoxSearchArea").empty();
			},451)
			
			
		}
		
		
		
		
		
		
	})

	
	$('#line-wrapper').click(function(){
  /* 추가된 부분 */
  $('.line').removeClass('init');
  $('#line-top').toggleClass('line-top').toggleClass('top-reverse');
  $('#line-mid').toggleClass('line-mid').toggleClass('mid-reverse');
  $('#line-bot').toggleClass('line-bot').toggleClass('bot-reverse');
})
	
	
})
</script>

<input type="hidden" id="hiddenMonth" value="${paging.month }"/>

<c:set value="<%=new java.util.Date()%>" var="nowBefore"/>
<c:set var="now"><fmt:formatDate value="${nowBefore}" pattern="yyyy-MM-dd" /></c:set> 


<div class="container">
             
<div class="row">
    <div class="col-md-12">
         
        <div class="page-header">
            
            <h2>공연 일정</h2>
            <div class="schedule">
            	<div class="month">
            		<ul class="select-month-ul">
            			<li class="yearWrap"><strong class="beforeYear">&lt;</strong><strong class="year">${paging.year}</strong><strong class="nextYear">&gt;</strong></li> 
            			<li class="month_no" id="all">All</li>
            			<c:forEach begin="1" end="12" var="i">
	            				<li id="monthNum${i}" class="month_no li${i}" value="${i }">${i}월</li>	      
            			</c:forEach>            			
            		</ul>
            		
<!--             		<button class="attraction-detail-viewBtnList" id="attraction-detail-mapViewLi">검색</button> -->
            		
            		<div id="wrapper">
					  <div id="line-wrapper" class="attraction-detail-viewBtnList">
					    <div id="line-top" class="line init top-reverse"></div>
					    <div id="line-mid" class="line init mid-reverse"></div>
					    <div id="line-bot" class="line init bot-reverse"></div>
					  </div>
					</div>
            	
            	</div>	
            </div>
            
            <div id="attraction-detail-detailmap">
            </div>
            
        </div>
    </div>
</div>

	<ul class="goods_list" id="goodsList">

		<c:forEach var="l" items="${list }">
		<c:set var="endDate"><fmt:formatDate value="${l.show_end}" pattern="yyyy-MM-dd" /></c:set>
		<li>
			<a href="/show/detail?show_id=${l.show_id }">
			<c:if test="${now > endDate }">
				<img src="/resources/images/finish.png" style="position:absolute; opacity: .7; width: 234px; height: 285px;" />	
			</c:if>
				<p><img src="${l.show_image }" /></p>
				<div class="list_info">
					<strong class="elp" id="elp">${l.show_name }</strong>
					<dl>
						<dt>기간</dt>
						<dd><fmt:formatDate value="${l.show_start }" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${l.show_end }" pattern="yyyy-MM-dd" /></dd>
						<dt>장소</dt>
						<dd>${l.show_place }</dd>
					</dl>
				</div>
			</a>
		</li>
		</c:forEach>
	</ul>









<jsp:include page="/WEB-INF/views/util/showPaging.jsp" />
</div>
<c:import url="/WEB-INF/views/footer.jsp" />

