<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  <c:import url="/WEB-INF/views/header.jsp" />  
    
<style type="text/css">

html, body {
	width: 100%;
	height: 100%;
	
	margin: 0 auto;
}

#checkboxs{
	
	/* 외부 정렬 */
	width: 1200px;
	margin: 0 auto;
	
	font-size: 12px;
	font-weight: bold;
	
	border: 1px solid #333;
	
	padding: 15px; 

}

.show-list-entire {

	width: 1200px;
/* 	height: 98%; */
	
	/* 외부 정렬 */
 	margin: 0 auto; 
	
	/* 내부 정렬*/ 
  	text-align: center;   
	
	font-size: 15px;
	font-weight: bold;
	
    border: 1px solid #333;    
	
	padding: 20px;
	
	

}

.show-list-cover {
	

	width: 320px;
	height: 550px;
	
 	margin: 0 auto; 
	
	/* 내부 정렬*/ 
  	text-align: left;  
	
 	border: 1px solid #333;  
	
	padding: 10px;
	margin: 10px;
	
 	display: inline-block; 

	vertical-align: bottom;
}
.search-all-back{
background:#f6f6f6;
}

/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@22화평@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
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


</style>

<!-- 화평이@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
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
		location.href="/show/showsearch?year="+$(".year").text(); // year만 있고 month는 null 인 상태에서 검색 가능하도록
	})	
	$(".nextYear").on("click", function(e){
		console.log("beforeYear")
		
		yearNo = Number($(".year").text());
		yearNo+=1;
		$(".year").text(yearNo)
		location.href="/show/showsearch?year="+$(".year").text();
	})
	
	//월 클릭시 조회
	$(".month_no").on("click", function(e){
		console.log(e.target.value)
		location.href="/show/showsearch?year="+$(".year").text()+"&month="+e.target.value;
		
	})
	
	//all 클릭시 조회
	$("#all").on("click", function(e){

		location.href="/show/showsearch?year="+$(".year").text();
		
	})
	
	
	
	
})
</script>

</head>
<body>
<div class="search-all-back">
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
            	</div>	
            </div>
            
        </div>
    </div>
</div>

	<ul class="goods_list" id="goodsList">

		<c:forEach var="l" items="${showList }">
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






<div class="checkboxs" id="checkboxs">
<form action="/show/showlist" method="get">
  
    <div>
  <span>공연 구분</span><br>
  <input type="checkbox" id="showkind" name="showkind" value="기획공연"/>기획공연
  <input type="checkbox"  id="showkind" name="showkind" value="예술단공연"/>예술단공연
  <input type="checkbox" id="showkind" name="showkind" value="대관공연"/>대관공연
  <input type="checkbox"  id="showkind" name="showkind" value="전시"/>전시
  <input type="checkbox" id="showkind" name="showkind" value="기타"/>기타
  </div>
  <hr>
  
  
    <div>
  <span>공연장소</span><br>
  <input type="checkbox" id="showarea" name="showarea" value="대극장" />대극장
  <input type="checkbox"  id="showarea" name="showarea" value="소극장"/>소극장
  <input type="checkbox" id="showarea" name="showarea" value="야외극장"/>야외극장
  <input type="checkbox" id="showarea" name="showarea" value="갤러리"/>갤러리
  <input type="checkbox" id="showarea" name="showarea" value="컨벤션홀"/>컨벤션홀
  <input type="checkbox" id="showarea" name="showarea" value="열린무대"/>열린무대
  
  </div>
  <hr>
  
  
  <div>
  <span>장르</span><br>
  <input type="checkbox" id="showgenre" name="showgenre" value="국악"/>국악
  <input type="checkbox" id="showgenre" name="showgenre" value="클래식"/>클래식
  <input type="checkbox" id="showgenre" name="showgenre" value="오페라"/>오페라
  <input type="checkbox" id="showgenre" name="showgenre" value="발레"/>발레
  <input type="checkbox" id="showgenre" name="showgenre" value="합창"/>합창
  <input type="checkbox" id="showgenre" name="showgenre" value="뮤지컬"/>뮤지컬
  <input type="checkbox" id="showgenre" name="showgenre" value="연극"/>연극
  <input type="checkbox" id="showgenre" name="showgenre" value="행사"/>행사
  <input type="checkbox" id="showgenre" name="showgenre" value="전시"/>전시
  <input type="checkbox" id="showgenre" name="showgenre" value="콘서트"/>콘서트
  <input type="checkbox" id="showgenre" name="showgenre" value="연주회"/>연주회
  </div>
  <hr>
  
  <div>
  공연명 <input type="text" name="search" id="search" /> <input type="submit" id="btn-submit" name="btn-submit" value="검색"/>
  </div>
  
</form>

</div> <br><br>

<div class="show-list-entire" id="show-list-entire">


<c:forEach items="${list }" var="s">
<a href="/show/showsearchview?show_id=${s.show_id }"> 
<div class="show-list-cover" id="show-list-cover">
 	<div class="show-list-img" id="show-list-img"> 
 		<img src="${s.show_image }" width="300" height="400"/>
 	</div> 

	<div>
		<div class="show-list-showname" id="show-list-showname">${s.show_name }</div>
	</div>

	<div>
		<div class="show-list-date" id="show-list-date"><fmt:formatDate value="${s.show_start }" pattern="yyyy-MM-dd"/> ~ </div>
		<div class="show-list-date" id="show-list-date"><fmt:formatDate value="${s.show_end }" pattern="yyyy-MM-dd"/></div>

	</div>
	
	<div>
		<div>${s.show_genre }</div>
	</div>	
	
	<div>
		<div>${s.show_place }</div>
	</div>
</div>
</a>
</c:forEach>



</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/util/showPaging.jsp" />
<%-- <jsp:include page="/WEB-INF/views/util/paging.jsp" /> --%>
<c:import url="/WEB-INF/views/footer.jsp" />


