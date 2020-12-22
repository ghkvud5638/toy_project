<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script> -->

<style>

body {
	font-size: 14px;
}

.navbar {
	margin-bottom: 0px;
}

.navbar-brand {

	padding-top: 15px;
	padding-left: 100px;
}

.bd-navbar {
	position: sticky;
	top: 0;
	z-index: 1071;
	min-height: 4rem;
	box-shadow: 0 0.5rem 1rem rgba(0,0,0,.05), inset 0 -1px 0 rgba(0,0,0,.1);
}
.bd-sidebar {
	padding-top: 20px;
	position: sticky;
	top: 4rem;
	z-index: 1000;
	height: 80vh;
	background: #eee;
	border-right: 1px solid rgba(0,0,0,.1);
	overflow-y: auto;
	min-width: 160px;
	max-width: 220px;
}
.bd-sidebar .nav {
	display: block;
}
.bd-sidebar .nav>li>h2 {
	display: block;
	padding: .25rem 1.5rem;
	text-align: center;
}

.pagination {
   display: inline-flex;
}
</style>


<header class="navbar navbar-expand navbar-dark bg-dark bd-navbar">
  <a class="navbar-brand" href="/admin/main">관리자</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="pl-md-5 nav-item"><a class="nav-link" href="/admin/memberlist">회원관리</a></li>
      <li class="pl-md-5 nav-item"><a class="nav-link" href="/admin/salesdate">매출관리</a></li>
      <li class="pl-md-5 nav-item"><a class="nav-link" href="/admin/ticketinginfo">예매관리</a></li>
      <li class="pl-md-5 nav-item"><a class="nav-link" href="/admin/showlist">공연관리</a></li>
      <li class="pl-md-5 nav-item"><a class="nav-link" href="/admin/attractionlist">볼거리관리</a></li>
    </ul>
  </div>
</header>