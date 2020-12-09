<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
  <head>
 <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function() {
      $("#update").on("click",function(){
         
         console.log("here")
         var url = "/main/update?member_id="+"${member_id}";
           var name = "popup";
           var option = "width = 560, height = 500, top = 100, left = 200, location = no"
           window.open(url, name, option);   
       
      })

   });
 
    
 </script>
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  
  <style type="text/css">
.main-header-menu-top-background{
 background:#2b2b2b;
}

.main-header-menu-top-img{
  width: 65px;
  height: 80px;
}
.main-header-menu-top{
  display: flex;
  list-style-type: none;
  align-items: center;
  margin: 0;
  padding: 0;
 
}
.main-header-menu-top-li a{
  text-decoration: none;
  font-size: 10px; 
  
}
/* 방문하지 않은 링크 */
.main-header-menu-top-li a:link{
  color: white;
}
/* 방문한 링크 */
.main-header-menu-top-li a:visited{
  color: white;
}
/* 링크를 활성화 할 때 */
.main-header-menu-top-li a:active{
  color: white;
}
.main-header-menu-top-li{
  padding: 9px;
}

.main-header-menu-top-li a:hover{
  border-bottom: 2px solid black;
}
.main-header-menu-top-li:nth-child(4){
  margin-left:500px;
}
.main-header-menu-top-li:nth-child(5){
  margin-left:550px;
}



.main-header-menu-bar .main-header-menu-bar-li a:hover {            
color: red;                   
background-color: #4d4d4d;    
}
.main-header-menu-bar-background{
 background:#2b2b2b;
}
.main-header-menu-bar{
  display: flex;
  justify-content:space-around;
  list-style-type: none;
  align-items: center;
  margin: 0;
  padding: 0;
}
.main-header-menu-bar-li a{
  text-decoration: none;
  font-size: 14px; 
  
}
/* 방문하지 않은 링크 */
.main-header-menu-bar-li a:link{
  color: white;
}
/* 방문한 링크 */
.main-header-menu-bar-li a:visited{
  color: white;
}
/* 링크를 활성화 할 때 */
.main-header-menu-bar-li a:active{
  color: white;
}
.main-header-menu-bar-li{
  padding: 16px;
}

.main-header-menu-bar-li a:hover{
  border-bottom: 2px solid black;
}

</style>
 </head>
    
 <body>
 <div class="main-header-menu-top-background">
      <ul class="main-header-menu-top">
         <li class="main-header-menu-top-li"><a href="/main/main">처음으로</a></li>
         <c:choose>
            <c:when test="${empty isLogin }">
         <li class="main-header-menu-top-li"><a href="/main/login" id="login">로그인</a></li>
            <li class="main-header-menu-top-li"><a href="/join/joinbefore">회원가입</a></li>
         </c:when>
         <c:when test="${isLogin eq true}">
         <li class="main-header-menu-top-li"><a href="/main/logout">로그아웃</a></li>
         <li class="main-header-menu-top-li"><a href='javascript:void(0)' id="update">정보수정</a></li>
         </c:when>
         </c:choose>
         <li class="main-header-menu-top-li"><a href="/main/main"><img class="main-header-menu-top-img"
               src="/resources/images/m-logo.png"></a></li>
         <li class="main-header-menu-top-li">
            <form class="form-inline my-2 my-md-0">
               <input class="form-control" type="text" placeholder="내용을 입력하세요.">
            </form>
         </li>
      </ul>
</div>
<div class="main-header-menu-bar-background">
      <ul class="main-header-menu-bar">
         <li class="main-header-menu-bar-li"><a href="/main/main">홈</a></li>
         <li class="main-header-menu-bar-li"><a href="/show/showsearch">공연</a></li>
         <li class="main-header-menu-bar-li"><a href="/attraction/list">볼거리</a></li>
         <li class="main-header-menu-bar-li"><a href="/myPage/bookList">MY</a></li>
         <c:if test="${member_spot eq '관리자' }">
         <li class="main-header-menu-bar-li"><a href="/admin/login">관리자</a></li>
         </c:if>
      </ul>
</div>
 </body>
</html>