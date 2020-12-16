<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/views/header.jsp" />

<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- Swiper JS -->
<script src="/resources/swiper-bundle.min.js"></script>
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="/resources/swiper-bundle.min.css">
<!-- Initialize Swiper -->

<style>
.chatBtnWrap{
	width: 75px;
    height: 75px;
    background: linear-gradient(rgb(255, 67, 0) 0%, rgb(255, 67, 0) 50%, rgb(255, 126, 0) 100%) !important;
    border-radius: 50%;
    cursor: pointer;
    transition: all ease-in-out 0.3s;
      transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
    color:white;
    padding: 21px 0 0 13px;
    position: fixed;
    right: 25px;
    bottom: 25px;
    font-size: 25px;
    font-weight: bolder;
 }
 
.chatBtnWrap:hover{
	 transform: scale(1.2);
	 -webkit-transform: scale(1.2);
	 -moz-transform: scale(1.2);
	 -ms-transform: scale(1.2);
	 -o-transform: scale(1.2);
 }
   
.chatRoom{
	z-index:999;
    background: linear-gradient(rgb(255, 67, 0) 0%, rgb(255, 67, 0) 50%, rgb(255, 126, 0) 100%) !important;
	height: 400px;
	width:300px; 
	border-radius: 10px;
	position:fixed;	
	right: 10px;
    bottom: 10px;
    transition: all 0.3s ease-in-out; 
    margin-right: -400px;
}   
.closeBtn{
	color:white;
	padding: 7px 10px 0px 0px;
    float: right;
	cursor: pointer;
	font-size:20px;
}
.closeBtn:hover{
	
}
.chatRoomInside{ /* .chatWrap */
	border-radius: 10px;
    height: 316px;
    width: 269px;
    background-color: white;
	box-shadow: rgba(0, 0, 0, 0.08) 0px 12px 4px 7px, rgba(0, 0, 0, 0.01) 9px 10px 9px 12px;
    margin: 15px 0 0 15px;
	overflow: scroll;    
}
   
   
.chatRoom > span{
    font-weight: bolder;
    font-size: 17px;
    margin: 0 0 0 15px;
}

.sendBtn{
	border: 1px solid skyblue; 
	background-color: #dab051; 
	border-radius:5px;
	padding: 5px;
	cursor: pointer;
}
.sendBtn:hover{
	background-color: #efca78;
}
#messageinput{
    border: none;
    width: 237px;
    height: 36px;
    margin: 3px 0 0 15px;
}

.sns-wrap {
   position: relative;
   background-color: #fff;
   padding: 20px;
   padding-bottom: 10px;
   height: 269px
}

.sns-wrap__title {
   font-size: 15px;
   font-family: 'Noto Sans KR';
   color: #000;
   margin-bottom: 5px;
   letter-spacing: 0.02em
}

.sns-wrap__top {
   position: absolute;
   top: 20px;
   right: 20px
}

.sns-wrap__top
a {
   margin-left: 10px
}

.sns-wrap__in {
   margin-left: -20px
}

.sns-wrap__in__item {
   float: left;
   width: 33.33%;
   margin-bottom: 17px
}

.sns-wrap__in__item
a {
   position: relative;
   display: block;
   margin-left: 20px;
   text-align: center;
   width: 106px
}

.sns-wrap__in__item a
img {
   width: 108px;
   height: 106px
}

.sns-wrap__in__item a:hover, .sns-wrap__in__item a:focus {
   opacity: 0.85
}

.icon-type {
   display: block;
   width: 55px;
   height: 50px;
   background-position: 0 0;
   background-repeat: no-repeat;
   position: absolute;
   top: 0;
   left: 0;
   font-size: 0;
   text-indent: -9999px
}

.icon-type--fb {
   background-image: url("/inc/img/renew2019/type-fb.png")
}

.icon-type--insta {
   background-image: url("/inc/img/renew2019/ico_in.png");
   background-size: 65%
}

.icon-type--kakao {
   background-image: url("/inc/img/renew2019/ico_ka.png");
   background-size: 65%
}

.icon-type--blog {
   background-image: url("/inc/img/renew2019/ico_bl.png");
   background-size: 65%
}

.icon-type--facebook {
   background-image: url("/inc/img/renew2019/ico_fa.png");
   background-size: 65%
}

@media screen and (min-width:1px) and (max-width:1400px) {
}

@media screen and (min-width:1201px) and (max-width:1400px) {
   .sns-wrap__in {
      margin-left: 0;
      margin-top: 17px
   }
   .sns-wrap__top {
      top: 41px
   }
   .sns-wrap__in__item {
      width: 50%
   }
   .sns-wrap__in__item:nth-child(5) {
      display: none
   }
   .sns-wrap__in__item:nth-child(6) {
      display: none
   }
}

@media screen and (min-width:1px) and (max-width:1200px) {
   .youtube-wrap__in
iframe {
      width: 100%;
      height: 230px
   }
}

@media screen and (min-width:769px) and (max-width:1000px) {
}

@media screen and (min-width:1px) and (max-width:768px) {
   .sns-wrap__in {
      margin-left: 0
   }
   .sns-wrap__in__item
a {
      margin: 0 auto
   }
   .page39_list
.page39_list_in {
      float: none;
      margin: 0 auto
   }
}

@media screen and (min-width:481px) and (max-width:768px) {
}

@media screen and (min-width:1px) and (max-width:480px) {
   .sns-wrap__in__item {
      width: 50%
   }
   .sns-wrap__in__item:nth-child(5) {
      display: none
   }
   .sns-wrap__in__item:nth-child(6) {
      display: none
   }
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
   width: 100%;
   margin: auto;
}

.main-middle-view {
   display: flex;
   justify-content: space-between;
   background: #f6f6f6;
}

.main-aside-left {
   margin-top: 100px;
}

.main-aside-right {
   margin-top: 100px;
}

.main-bottom-youtube {
   width: 300px;
   height: 300px;
   background-color: #fff;
}

.main-bottom-board {
   width: 395px;
   float: right;
   margin-bottom: 37px
}

.main-bottom-view {
   display: flex;
   justify-content: space-around;
   background: #f6f6f6;
}

.youtube-title, .board-title {
   font-size: 15px;
   font-family: 'Noto Sans KR';
   color: #000;
   margin-bottom: 5px;
   letter-spacing: 0.02em;
}

/*슬라이더 부분*/
.main-article-middle {
   width: 850px;
   height: 600px;
   margin: 0 auto;
   margin-top: 80px;
   /* 내부 정렬*/
   text-align: center;
   font-size: 15px;
   font-weight: bold;
   padding: 0px;
}

.swiper-container {
   width: 100%;
   height: 100%;
   margin-left: auto;
   margin-right: auto;
}

.swiper-slide {
   text-align: center;
   font-size: 13px;
   background: #f6f6f6;
   width: 200px;
   height: 260px;
   /* Center slide text vertically */
   display: -webkit-box;
   display: -ms-flexbox;
   display: -webkit-flex;
   display: flex;
   -webkit-box-pack: center;
   -ms-flex-pack: center;
   -webkit-justify-content: center;
   justify-content: center;
   -webkit-box-align: center;
   -ms-flex-align: center;
   -webkit-align-items: center;
   align-items: center;
}

.swiper-button-next:after {
   margin-left: 20px;
}

.swiper-button-prev:after {
   margin-right: 20px;
}

.sns-wrap__in__item2 {
   float: left;
   width: 33.33%;
   margin-bottom: 17px
}

.sns-wrap__in__item2
a {
   position: relative;
   display: block;
   margin-left: 20px;
   text-align: center;
   width: 106px
}

.sns-wrap__in__item2 a
img {
   width: 108px;
   height: 106px
}

.sns-wrap__in__item2 a:hover, .sns-wrap__in__item2 a:focus {
   opacity: 0.85
}

@media screen and (min-width:1201px) and (max-width:1400px) {
   .sns-wrap__in__item2 {
      width: 50%
   }
   .sns-wrap__in__item:nth-child(2) {
      display: none
   }
   .sns-wrap__in__item:nth-child(3) {
      display: none
   }
}

@media screen and (min-width:1px) and (max-width:768px) {
   .sns-wrap__in__item2
a {
      margin: 0 auto
   }
}

@media screen and (min-width:1px) and (max-width:480px) {
   .sns-wrap__in__item2 {
      width: 50%
   }
}
.icon-type--insta{background-image:url("http://www.ggac.or.kr//inc/img/renew2019/ico_in.png");background-size:65%}
.icon-type--blog{background-image:url("http://www.ggac.or.kr//inc/img/renew2019/ico_bl.png");background-size:65%}
.icon-type--facebook{background-image:url("http://www.ggac.or.kr//inc/img/renew2019/ico_fa.png");background-size:65%}
.icon-type--kakao{background-image:url("http://www.ggac.or.kr//inc/img/renew2019/ico_ka.png");background-size:65%}
</style>

<script type="text/javascript">
$(document).ready(function(){
	
	
// 	console.log($(".chatRoomInside").children("#askShow").length)


	
	$(".chatRoomInside").load("/main/askBtn")
	

	
	
	$("#chatBtn").click(function(){
		console.log("here")
		var marginRight = $(".chatRoom").css("margin-right");
		console.log(marginRight)
		 
		if (marginRight==='-400px') {
			setTimeout(function(){
				$(".chatRoom").css("margin-right","10px")
			},100)
		}else{
			setTimeout(function(){
				$(".chatRoom").css("margin-right","-400px")			
			},100)
		}
		
	})
	
	
	$(".closeBtn").click(function(){
		setTimeout(function(){
			$(".chatRoom").css("margin-right","-400px")
		},100)
	})
	
})
</script>

<div class="container-caroucel">

   <div id="myCarousel" class="carousel slide" data-rede="carousel">
      <!-- 하단 동그라미 -->
      <ol class="carousel-indicators">
         <li data-target="#myCarousel" data-slide-to="1"></li>
         <li data-target="#myCarousel" data-slide-to="2"></li>
         <li data-target="#myCarousel" data-slide-to="3"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
         <div class="item active">
            <img src="http://www.ggac.or.kr/_File/mainBanner/1606294670_0.jpg"
               alt="1" width="460" height="345">
         </div>
         <div class="item">
            <img src="http://www.ggac.or.kr/_File/mainBanner/1606288709_0.png"
               alt="2" width="460" height="345">
         </div>
         <div class="item">
            <img src="http://www.ggac.or.kr/_File/mainBanner/1604552925_0.png"
               alt="3" width="460" height="345">
         </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button"
         data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
         aria-hidden="true"></span> <span class="sr-only">Previous</span>
      </a> <a class="right carousel-control" href="#myCarousel" role="button"
         data-slide="next"> <span
         class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
         <span class="sr-only">Next</span>
      </a>
   </div>
</div>
<!-- 캐러셀 컨테이너 끝 -->

<!-- 중단 배치 -->

<div class="main-middle-view">
   <div class="main-aside-left">
      <h1>이 달의 공연</h1>
      <a href="/show/showsearchview?show_id=${list[7].show_id }"> <img
         src="${list[7].show_image }" width="200" height="500">
         <p>${list[7].show_name }</p>
         <p>${list[7].show_cast }</p>
      </a>
   </div>
   <div class="main-article-middle">
      <div class="swiper-container">
         <div class="swiper-wrapper">
            <c:forEach items="${list }" var="s">
               <div class="swiper-slide" id="show-list-cover">
                  <a href="/show/showsearchview?show_id=${s.show_id }">
                     <div class="show-list-img" id="show-list-img">
                        <img src="${s.show_image }" width="200" height="200" />
                     </div>

                     <div>
                        <div class="show-list-showname" id="show-list-showname">${s.show_name }</div>
                     </div>

                     <div>
                        <div>${s.show_cast }</div>
                     </div>

                     <div>
                        <div>${s.show_place }</div>
                     </div>
               </div>
               </a>
            </c:forEach>

         </div>

         <div class="swiper-pagination"></div>
         <!-- Add Arrows -->
         <div class="swiper-button-next"></div>
         <div class="swiper-button-prev"></div>
      </div>
   </div>

   <div class="main-aside-right">
<!--       <a href="#"> <img src="/resources/view.PNG" width="200" -->
<!--          height="600"> -->
<!--       </a> -->
      <div class="chatBtnWrap" id="chatBtn">
			문의
		</div>
		
		<div class="chatRoom">
			<strong class="closeBtn">X</strong>
			<span>무엇을 도와드릴까요?</span>
			
			<div class="chatRoomInside">
<!-- 				<div class="chatRoomInsideBtn"> -->
<!-- 					<button id="askShow">공연 문의</button> -->
<!-- 					<button id="askBook">예매 문의</button> -->
<!-- 					<button id="askEtc">기타 문의</button> -->
<!-- 				</div> -->
			</div>
			<div class="sendArea">
				<input type="text" id="messageinput"/>
				<button type="button" class="sendBtn" onclick="send();">전송</button>
			</div>
		</div>

   </div>
</div>
<script>
   /*     var swiper = new Swiper('.swiper-container', {
    slidesPerView: 3,
    slidesPerColumn: 2,
    spaceBetween: 30,
    pagination: {
    el: '.swiper-pagination',
    clickable: true,
    },
    }); */
   var swiper = new Swiper('.swiper-container', {
      slidesPerView : 3,
      slidesPerColumn : 2,
      spaceBetween : 30,
      pagination : {
         el : '.swiper-pagination',
         clickable : true,
      },
      navigation : {
         nextEl : '.swiper-button-next',
         prevEl : '.swiper-button-prev',
      },
   });
</script>

<div class="main-bottom-view">

   <div class="main-bottom-youtube">
      <h3 class="youtube-title">
         <a href="https://www.youtube.com" target="_blank">YOUTUBE</a>
      </h3>
      <div>
         <iframe width="260" height="230"
            src="https://www.youtube.com/embed/J3lQ7LlgXo0" frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen></iframe>
      </div>
   </div>
   <div class="main-bottom-board">
      <article class="sns-wrap">
         <h3 class="sns-wrap__title">
            <a href="http://www.ggac.or.kr/?p=39">SNS</a>
         </h3>
         <div class="sns-wrap__top">

            <a href="http://pf.kakao.com/_LdYjC" target="_blank"> <img
               src="http://www.ggac.or.kr/inc/img/renew2019/sns-kao-go3.png"
               onmouseover="this.src='http://www.ggac.or.kr/inc/img/renew2019/sns-kao-go3.png'"
               onmouseout="this.src='http://www.ggac.or.kr/inc/img/renew2019/sns-kao-go3.png'"
               alt="카카오톡플러스 친구추가" title="카카오톡플러스 친구추가">
            </a> <a href="https://www.facebook.com/ggac.official/" target="_blank">
               <img src="http://www.ggac.or.kr/inc/img/renew2019/sns-fb-go3.png"
               onmouseover="this.src='http://www.ggac.or.kr/inc/img/renew2019/sns-fb-go3.png'"
               onmouseout="this.src='http://www.ggac.or.kr/inc/img/renew2019/sns-fb-go3.png'"
               alt="페이스북 좋아요" title="페이스북 좋아요">
            </a> <a href="https://www.instagram.com/ggac_official/" target="_blank">
               <img
               src="http://www.ggac.or.kr/inc/img/renew2019/sns-insta-go3.png"
               onmouseover="this.src='http://www.ggac.or.kr/inc/img/renew2019/sns-insta-go3.png'"
               onmouseout="this.src='http://www.ggac.or.kr/inc/img/renew2019/sns-insta-go3.png'"
               alt="인스타그램 팔로우" title="인스타그램 팔로우">
            </a> <a href="https://blog.naver.com/ggarts" target="_blank"> <img
               src="http://www.ggac.or.kr/inc/img/renew2019/sns-blog-go3.png"
               onmouseover="this.src='http://www.ggac.or.kr/inc/img/renew2019/sns-blog-go3.png'"
               onmouseout="this.src='http://www.ggac.or.kr/inc/img/renew2019/sns-blog-go3.png'"
               alt="네이버블로그 팔로우" title="네이버블로그 이웃추가">
            </a>

         </div>
         <div class="sns-wrap__in float_wrap">
            <div id="instafeed">
               <div class="sns-wrap__in__item instagram_item0">
                  <a href="#"><span class="icon-type icon-type--insta">인스타그램</span><img
                     src="https://scontent-ssn1-1.cdninstagram.com/v/t51.29350-15/129751445_293660758733253_4853872751885351389_n.jpg?_nc_cat=100&amp;ccb=2&amp;_nc_sid=8ae9d6&amp;_nc_ohc=azfbBi3ulQAAX-i43pV&amp;_nc_ht=scontent-ssn1-1.cdninstagram.com&amp;oh=8e346af37ca4d2e76e8105341739b585&amp;oe=5FF603F5"
                     alt="인스타그램"></a>
               </div>
               <div class="sns-wrap__in__item instagram_item1">
                  <a href="#"><span
                     class="icon-type icon-type--insta">인스타그램</span><img
                     src="https://scontent-ssn1-1.cdninstagram.com/v/t51.29350-15/129719701_668743493799796_1821020333099685218_n.jpg?_nc_cat=107&amp;ccb=2&amp;_nc_sid=8ae9d6&amp;_nc_ohc=1-18SSnbf3QAX8fenTM&amp;_nc_ht=scontent-ssn1-1.cdninstagram.com&amp;oh=19e2677e3bb8cc9e065df8723a62f3e6&amp;oe=5FF7020A"
                     alt="인스타그램"></a>
               </div>
               <div class="sns-wrap__in__item instagram_item2">
                  <a href="#"><span
                     class="icon-type icon-type--insta">인스타그램</span><img
                     src="https://scontent-ssn1-1.cdninstagram.com/v/t51.29350-15/129104566_207149687518959_7582989176200167191_n.jpg?_nc_cat=103&amp;ccb=2&amp;_nc_sid=8ae9d6&amp;_nc_ohc=FdmIcmNeFCAAX9aOJNE&amp;_nc_ht=scontent-ssn1-1.cdninstagram.com&amp;oh=74ce9ea70162a5d6c458c4408f9c3c15&amp;oe=5FF42219"
                     alt="인스타그램"></a>
               </div>
            </div>
            <div id="facebookfeed"></div>


            <div class="main_sns2">

               <div class="sns-wrap__in__item2">
                  <a href="#"> <span class="icon-type icon-type--blog"></span> <img
                     src="http://www.ggac.or.kr/inc/img/renew2019/snsf-2.jpg"
                     alt="블로그" />
                  </a>
               </div>

               <div class="sns-wrap__in__item2">
                  <a href="#"> <span class="icon-type icon-type--facebook"></span>
                     <img src="http://www.ggac.or.kr/inc/img/renew2019/snsf-2.jpg"
                     alt="페이스북" />
                  </a>
               </div>

               <div class="sns-wrap__in__item2">
                  <a href="#"> <span class="icon-type icon-type--kakao"></span>
                     <img src="http://www.ggac.or.kr/inc/img/renew2019/snsk-2.jpg"
                     alt="카카오" />
                  </a>
               </div>

            </div>


         </div>
      </article>
   </div>
</div>


<c:import url="/WEB-INF/views/footer.jsp" />