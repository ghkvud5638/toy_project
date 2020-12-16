<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.f-img{
height:80px;
}
.footer-img{
width:40px;
height:40px;
}
.footer {

   background-color: #2b2b2b;
   height: 290px
}

.footer__in {
   width: 1400px;
   margin: 0 auto;
   color: #999;
   padding-top: 20px;
   position: relative
}

.footer__in__h3 {
   font-size: 18px;
   color: #fff;
   margin-bottom: 20px
}

.foot_img {
   padding-top: 20px;
   margin-bottom: 20px
}

.explore-box {
   position: absolute;
   top: 40px;
   right: 30%
}

.legal-box {
   position: absolute;
   top: 40px;
   right: 35%
}

.follow_us-box {
   position: absolute;
   top: 40px;
   right: 0
}

.sitemap-go-btm
a {
   display: block;
   color: #999;
   padding-left: 5px;
   margin-bottom: 5px
}

.sitemap-go-btm a:hover, .sitemap-go-btm a:focus {
   color: #fff
}

.legal-box
a {
   color: #999;
   display: block;
   font-size: 14px
}

.legal-box a:hover, .legal-box a:focus {
   color: #fff
}

.legal-box
p {
   margin-bottom: 10px
}

.follow_us-box
a {
   margin-left: 5px
}

.foot-copy-box {
   font-size: 14px;
   margin-bottom: 20px;
   line-height: 1.7
}

.foot-copy-box2 {
   font-size: 13px;
   color: #555;
   font-weight: bold
}

@media screen and (min-width:1px) and (max-width:1400px) {
   .footer__in {
      width: auto
   }
   .foot_img {
      padding-left: 5px
   }
   .foot-copy-box {
      padding-left: 5px
   }
   .foot-copy-box2 {
      padding-left: 5px
   }
}

@media screen and (min-width:1001px) and (max-width:1400px) {
   .explore-box {
      position: absolute;
      top: 40px;
      right: 28%
   }
   .legal-box {
      position: absolute;
      top: 40px;
      right: 12%
   }
   .follow_us-box {
      position: absolute;
      top: 40px;
      right: 10px;
      width: 100px;
      text-align: center
   }
   .follow_us-box
a {
      margin-left: 0px;
      margin-bottom: 5px;
      display: inline-block
   }
}

@media screen and (min-width:1px) and (max-width:1000px) {
   .footer {
      height: auto;
      padding-bottom: 10px
   }
   .foot_img {
      width: 100%;

      float: left;
      display: none
   }
   .explore-box {
      position: relative;
      top: 0;
      right: 0;
      float: left;
      width: 30%;
      margin-left: 1%
   }
   .legal-box {
      position: relative;
      top: 0;
      right: 0;
      float: left;
      width: 30%;
      margin-left: 1%
   }
   .follow_us-box {
      position: relative;
      top: 0;
      right: 0;
      float: left;
      width: 30%;
      margin-left: 1%
   }
   .foot-copy-box {
      width: 95%;
      float: left;
      margin-left: 1%;
      margin-top: 30px
   }
   .foot-copy-box2 {
      width: 95%;
      float: left;
      margin-left: 1%
   }
}

@media screen and (min-width:1px) and (max-width:768px) {
   .footer__in__h3 {
      margin-bottom: 10px
   }
   .explore-box {
      width: 47%
   }
   .legal-box {
      width: 45%
   }
   .follow_us-box {
      width: 95%;
      margin-top: 20px
   }
}
</style>
</head>
<body>

<footer class="footer">
      <div class="footer__in float_wrap">
         <p class="foot_img"><img src="/resources/images/m-logo.png" class="f-img" alt=""/></p>

         <div class="legal-box">
            <h3 class="footer__in__h3">Legal</h3>
            <p><a href="/main/use">이용약관</a></p>
            <p class="point"><a href="/main/privacy">개인정보처리방침</a></p>
            <p><a href="/main/emailwar">이메일주소무단수집거부</a></p>

         </div>
         <div class="follow_us-box">
            <h3 class="footer__in__h3">Follow us</h3>
            <a href="#">
               <img class="footer-img" src="http://www.ggac.or.kr/inc/img/renew2019/sns-05.png" alt="문화의전당 카카오톡">
            </a>
            <a href="#">
               <img class="footer-img"  src="http://www.ggac.or.kr/inc/img/renew2019/sns-01.png" alt="문화의전당 블로그">
            </a>
            <a href="#">
               <img class="footer-img"  src="http://www.ggac.or.kr/inc/img/renew2019/sns-02.png" alt="문화의전당 페이스북">
            </a>
            <a href="#">
               <img class="footer-img"  src="http://www.ggac.or.kr/inc/img/renew2019/sns-03.png" alt="문화의전당 인스타그램">
            </a>
            <a href="#">
               <img class="footer-img"  src="http://www.ggac.or.kr/inc/img/renew2019/sns-04.png" alt="문화의전당 유투브">
            </a>
         </div>

         <div class="foot-copy-box">
            <p class="">1688-1111  강남구 테헤란로14길 6 남도빌딩  KH아트센터</p>
            <p class="">대표 : 한지오 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사업자등록번호 : 351-09-17500&nbsp;&nbsp;I&nbsp;&nbsp;인터파크 통신판매업신고 09150호</p>
            <p class="">티켓예매 : 1616-1666&nbsp;&nbsp;I&nbsp;&nbsp;공연문의 : 010-101-0101&nbsp;&nbsp;I&nbsp;&nbsp;대표전화 : 010-111-1111</p>
         </div><!--//foot-copy-box -->
         <div class="foot-copy-box2">
            <p>COPYRIGHT KH ARTS CENTER ALL RIGHTS RESERVED.</p>
         </div>
         



      </div>


   </footer>

</body>
</html>