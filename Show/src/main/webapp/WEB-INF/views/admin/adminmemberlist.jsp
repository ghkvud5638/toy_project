<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:import url="/WEB-INF/views/header.jsp" />


<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>

<c:import url="/WEB-INF/views/admin/adminheader.jsp" />

<div class="container-fluid">
  <div class="row flex-nowrap">

    <main class="col-12 py-md-3 pl-md-5 bd-content" role="main">
    
    <div class="container">
	
	<div class="row">
    	<div class="col-md-12">
<div class="page-header">
<h1>회원관리</h1>
</div>
						
<form action="/admin/memberlist" method="get">						
						<div class="col-md-5" style="float: right;">

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
										<th>아이디</th>
										<th>이름</th>
										<th>생년월일</th>
										<th>성별</th>
										<th>주소</th>
										<th>닉네임</th>
										<th>회원등급</th>
										<th>포인트</th>
										<th>회원수정</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="userinfo" items="${list }">
									<tr>
										<td>${userinfo.member_id }</td>
										<td>${userinfo.member_name }</td>
<%-- 										<td><fmt:formatDate value="${userinfo.birth }" pattern="yyyy-MM-dd" /></td> --%>
										<td>${userinfo.birth }</td>
										<td>${userinfo.gender }</td>
										<td>${userinfo.member_addr }</td>
										<td>${userinfo.nick }</td>
										<td>${userinfo.member_grade }</td>
										<td>${userinfo.point }</td>
										<td>
											<a href="/admin/memberupdate?member_id=${userinfo.member_id }"><button id="editBtn">수정</button></a>
										</td>
									</tr>
									</c:forEach>

								</tbody>
							</table>
							<span class="pull-left">total : ${paging.totalCount }</span>
							<div class="clearfix"></div>
							<jsp:include page="/WEB-INF/views/util/adminmemberpaging.jsp" />
						</div>
					</div>
				</div>
			</div>


    </main>
  </div>
</div>




<c:import url="/WEB-INF/views/footer.jsp" />


