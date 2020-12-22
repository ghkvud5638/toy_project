<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
  <head>
 <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
 <!-- 글자 모양 스크립트 --> 
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  

 <script type="text/javascript">
 
 
 $(document).ready(function() {
    
   
    if( '${member_spot }' ==  '관리자'){
       $('.main-header-menu-bar-li:nth-child(1)').css("left","0%");
       $('.main-header-menu-bar-li:nth-child(2)').css("left","20%");
       $('.main-header-menu-bar-li:nth-child(3)').css("left","40%");
       $('.main-header-menu-bar-li:nth-child(4)').css("left","60%");
       $('.main-header-menu-bar-li:nth-child(5)').css("left","80%");
       $('.main-header-menu-bar-li').css("width","20%");
      } else {
       $('.main-header-menu-bar-li:nth-child(1)').css("left","0%");
       $('.main-header-menu-bar-li:nth-child(2)').css("left","25%");
       $('.main-header-menu-bar-li:nth-child(3)').css("left","50%");
       $('.main-header-menu-bar-li:nth-child(4)').css("left","75%");
       $('.main-header-menu-bar-li').css("width","25%");
         
      }
    
    var locChk = location.pathname.split("/")
//     alert(locChk[1])
   var cssNo = 0;
    if(locChk[1] == 'main'){
       cssNo = 1

    }
    if(locChk[1] == 'show'){
       cssNo = 2

    }
    if(locChk[1] == 'attraction'){
       cssNo = 3

    }
    if(locChk[1] == 'myPage'){
       cssNo = 4

    }
    if(locChk[1] == 'admin'){
       cssNo = 5

    }
//        $('.main-header-menu-bar-li:nth-child('+cssNo+')').css("background-color","#393e3e");
       $('.main-header-menu-bar-li:nth-child('+cssNo+')').css("color","#ff6633");
//        $('.main-header-menu-bar-li:nth-child('+cssNo+')').css("opacity",".8");
//        $('.main-header-menu-bar-li:nth-child('+cssNo+')').css("border-bottom","10px solid #ccc");
    
      $("#update").on("click",function(){
         
         console.log("here")
         var url = "/main/update?member_id="+"${member_id}";
           var name = "popup";
           var option = "width = 560, height = 500, top = 100, left = 200, location = no"
           window.open(url, name, option);   
       
      })
      
      $("#allimBtn").on("click",function(){
         console.log("here")
         $("#allimSpaceWrap").load("/allim/list");
         $("#allimSpaceWrap").toggle();
      })
      
      connectWs();
   });
 
 
 
 function connectWs(){
      var ws = new WebSocket("ws://localhost:8088/allimSocket");
      ws.onopen = function(event){
        $.ajax({
           url : '/allim/cntIsRead',
         type : 'POST',
         contentType : "application/json",
         dataType: 'json',
         success : function(data) {
            console.log("cnt : "+data)
            if (data != '0') {
               $("#allimCnt").attr("class","allimCntClass")
               $("#allimCnt").text(data)
            }
         }, error : function(err){
            alert(err);
         }
        });
        if(event.data === undefined){
               return;
         }
      };
      
      
      ws.onmessage = function(event){
      }   
      
      ws.onclose = function(event){
          console.log("연결 종료");
      }
      
   } 
 
 $(function() {
       $(window).scroll(function() {
           if ($(this).scrollTop() > 1) {
               $('.ScrollButton').fadeIn();
           } else {
               $('.ScrollButton').fadeOut();
           }
       });
           
       $("#TopButton").click(function() {
           $('html').animate({scrollTop : 0}, 1);
       });
    
       $("#BottomButton").click(function() {
           $('html').animate({scrollTop : ($('#under').offset().top)}, 1);
       });
   });
    
 </script>
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  
<style type="text/css">
@font-face {
	font-family: "HANGANG";
	src: url("/resources/SeoulHangangB.ttf")
}
@font-face {
	font-family: "NAMSAN";
	src: url("/resources/서울남산 장체B.TTF")
}
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



/* .main-header-menu-bar-li:not(:nth-child(1)) {             */

.main-header-menu-bar-li {            
/*    width:20%; */
   position:absolute;
   float:left;
/*    height:150px; */
   text-align: center;
   font-size: 20px;
   color:white;
   font-family: 'HANGANG', cursive;
}

.main-header-menu-bar-li:hover{
   color: rgb(255, 102, 51);                   
/*    text-decoration: underline; */
   background-color: #393e3e .9;
/*    opacity:.6; */
   cursor:pointer;

}
.main-header-menu-bar .main-header-menu-bar-li:hover {            
/*     background-color: #4d4d4d; */
}
.main-header-menu-bar-background{
 background:#2b2b2b;
     height: 30px;
 
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

/*  .main-header-menu-bar-li a:hover{  */
/*    color: red;                    */
/*    text-decoration: underline; */
   

/* /*   border-bottom: 2px solid black; */
/* }  */

#allimBtn{
   cursor: pointer;
}
.allimCntClass{
    width: 20px;
    height: 20px;
    background-color: red;
    color: white;
    border-radius: 50%;
    margin: 0px 0px -8px 23px;
    padding: 0 0 0 5px;
    
}

.ScrollButton {
  position: fixed;   /* 버튼의 위치 고정 */
  right: 100px;       /* x 위치 입력 */
  cursor: pointer;   /* 호버링 했을 때 커서 모양 변경 */
  z-index: 10;       /* 다른 태그에 가려지지 않게 우선순위 변경 */
  display: none;     /* 스크롤 위치에 상관없이 보이게 하려면 생략 */
}
/* 두 태그에 각각 y 위치 입력 */
#TopButton {
  bottom: 100px;        
}
.aa{
	font-size: 13px;
}
</style>
 </head>
    
 <body>
 <div class="main-header-menu-top-background">
      <ul class="main-header-menu-top">
         <li class="main-header-menu-top-li"><a class="aa" href="/main/main">처음으로</a></li>
         <c:choose>
            <c:when test="${empty login }">
         <li class="main-header-menu-top-li"><a class="aa" href="/main/login" id="login">로그인</a></li>
            <li class="main-header-menu-top-li"><a class="aa" href="/join/joinbefore">회원가입</a></li>
         </c:when>
         <c:when test="${login eq true}">
         <li class="main-header-menu-top-li"><a class="aa" href="/main/logout">로그아웃</a></li>
         <li class="main-header-menu-top-li"><a class="aa" href='javascript:void(0)' id="update">정보수정</a></li>
         </c:when>
         </c:choose>
         <li class="main-header-menu-top-li"><a href="/main/main"><img class="main-header-menu-top-img"
               src="/resources/images/m-logo.png"></a></li>
         <li class="main-header-menu-top-li">
            <form class="form-inline my-2 my-md-0">
               <input class="form-control" type="text" placeholder="내용을 입력하세요.">
            </form>
         </li>
        <c:if test="${login eq true}">
         <li class="main-header-menu-top-li" style="color:white;">
            <div id="allimBtn"><div id="allimCnt"></div>알림</div>   
         </li>
      </c:if>
      </ul>
</div>
      <div id="allimSpaceWrap">
      </div>

<div class="main-header-menu-bar-background">
      <ul class="main-header-menu-bar">
         <li class="main-header-menu-bar-li"  onclick="location.href='/main/main'">홈</li>
         <li class="main-header-menu-bar-li" onclick="location.href='/show/list'">공연</li>
         <li class="main-header-menu-bar-li" onclick="location.href='/attraction/list'">볼거리</li>
         <li class="main-header-menu-bar-li"  onclick="location.href='/myPage/bookList'">My</li>
         <c:if test="${member_spot eq '관리자' }">
         <li class="main-header-menu-bar-li" onclick="location.href='/admin/main'">관리자</li>
         </c:if>
      </ul>
</div>

<span><img src="/resources/images/top1.png" id="TopButton" class="ScrollButton" width="60" height="70"></span>

 </body>
</html>