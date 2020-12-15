<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
			<p class="foot_img"><img src="/inc/img/renew2020/footer-img.png" alt=""/></p>

			<div class="legal-box">
				<h3 class="footer__in__h3">Legal</h3>
				<p><a href="/main/use">이용약관</a></p>
				<p class="point"><a href="/main/privacy">개인정보처리방침</a></p>
				<p><a href="/main/emailwar">이메일주소무단수집거부</a></p>

			</div>
			<div class="follow_us-box">
				<h3 class="footer__in__h3">Follow us</h3>
				<a href="#">
					<img class="footer-img" src="https://pht.qoo-static.com/KwGCiEolNEeR9Q4RFOnDtb8Pvqs3LNiQEdE07wMCnoULO3yLUprHbGGLBYNEt8k7WJY=w512" alt="문화의전당 카카오톡">
				</a>
				<a href="#">
					<img class="footer-img"  src="https://www.apkmirror.com/wp-content/uploads/2020/04/5e9033f90fef8.png" alt="문화의전당 블로그">
				</a>
				<a href="#">
					<img class="footer-img"  src="https://img.khan.co.kr/news/2020/07/07/2020070701000784500060231.jpg" alt="문화의전당 페이스북">
				</a>
				<a href="#">
					<img class="footer-img"  src="data:image/jpeg;base64,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" alt="문화의전당 인스타그램">
				</a>
				<a href="#">
					<img class="footer-img"  src="https://yt3.ggpht.com/ytc/AAUvwnjkjfwolT7enHlIsv2kSn17Ei6Vte8cKIuvVIUtug=s900-c-k-c0x00ffffff-no-rj" alt="문화의전당 유투브">
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