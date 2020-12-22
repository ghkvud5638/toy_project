<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/header.jsp" />


<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>

<c:import url="/WEB-INF/views/admin/adminheader.jsp" />

<style>
.goods_list {
/* 	margin-left: 20px; */
	overflow: hidden;
	width: 1050px;
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
	padding: 6px 14px 13px 13px;
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

.btn {
	font-size: 14px;
	margin-left: 80px;
	margin-bottom: 10px
}


</style>

<script type="text/javascript">

</script>


<div class="container">
  <div class="row flex-nowrap">

    <main class="col-11 py-md-3 pl-md-6" role="main">
    
    <div class="container">
             
<div class="row">
    <div class="col-md-11">
            <h1>공연 리스트</h1>
           
            <hr>
    </div> 
</div>

<div>
    <a href="/admin/showinsert"><input type="button" class="btn btn-primary col-md-1" value="공연등록" class="form-control" onclick="fnbutton();" /></a>
</div>
<div style="float:right;">
	<form action="/admin/showlist" method="get">
		<input type="text" id="searchText" name="searchText" value="">
		<button>검색</button>
	</form>
</div>

	<ul class="goods_list" id="goodsList">
		<c:forEach var="l" items="${showList }">
				<li>
			<a href="/admin/showupdate?show_id=${l.show_id }">
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
	<jsp:include page="/WEB-INF/views/util/adminshowlistpaging.jsp" />
</div>

    </main>
  </div>
</div>

<br>


<c:import url="/WEB-INF/views/footer.jsp" />


