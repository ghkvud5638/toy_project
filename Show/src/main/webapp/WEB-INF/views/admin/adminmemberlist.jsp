<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<c:import url="/WEB-INF/views/header.jsp" />

<script type="text/javascript">
// $(document).ready(function() {

// 	$("#editBtn").click(function() {
// 		location.href="/board/update?member_id="+$("#search").val();
// 	});
// })
</script>

	<div id="container" class="effect aside-float aside-bright mainnav-lg">

		<div class="boxed">

			<div id="content-container">
				
				<div id="page-title">
					<h1 class="page-header text-overflow">회원 목록</h1>
				</div>

				<ol class="breadcrumb">
					<li><a href="/admin/main">홈</a></li>
					<li><a href="/admin/memberlist">회원 관리</a></li>
					<li class="active">회원 목록</li>
				</ol>

				<div id="page-content">
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">회원 목록</h3>
						</div>
						
<form action="/admin/memberlist" method="get">						
						<div class="col-md-4" style="float: right;">

	<select id="search" name="search">
		<option value="member_name">이름</option>
		<option value="member_id">아이디</option>
		<option value="nick">닉네임</option>
	</select>
	<input type="text" id="searchText" name="searchText" value="">
	<button>검색</button>
</div>
</form>
						<div class="panel-body">
							<table id="demo-dt-selection" class="table table-striped table-bordered" >
								<thead>
									<tr>
										<th style="width: 5%">아이디</th>
										<th style="width: 5%">이름</th>
										<th style="width: 5%">생년월일</th>
										<th style="width: 5%">성별</th>
										<th style="width: 30%">주소</th>
										<th style="width: 10%">닉네임</th>
										<th style="width: 10%">회원등급</th>
										<th style="width: 10%">포인트</th>
										<th style="width: 10%">회원수정</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="userinfo" items="${list }">
									<tr>
										<td>${userinfo.member_id }</td>
										<td>${userinfo.member_name }</td>
										<td>${userinfo.birth }</td>
										<td>${userinfo.gender }</td>
										<td>${userinfo.member_addr }</td>
										<td>${userinfo.nick }</td>
										<td>${userinfo.member_grade }</td>
										<td>${userinfo.point }</td>
										
										<td>
<%-- 										<c:if test="${adminid eq view.writerId }"> --%>
											<a href="/admin/memberupdate?member_id=${userinfo.member_id }"><button id="editBtn">수정</button></a>
<%-- 										</c:if> --%>
										
										
										</td>
									</tr>
									</c:forEach>

								</tbody>
							</table>
							<span class="pull-left">total : ${paging.totalCount }</span>
							<jsp:include page="/WEB-INF/views/util/adminmemberpaging.jsp" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


<c:import url="/WEB-INF/views/footer.jsp" />

