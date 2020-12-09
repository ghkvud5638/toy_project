<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<c:import url="/WEB-INF/views/header.jsp" />
<head>
<style>
dl, ul, ol, li {
    list-style: none;
}
h3 {
    clear: both;
    color: #222;
    font-family: "NotoSans Bold";
    height: 28px;
    font-size: 24px;
    letter-spacing: -0.03em;
    margin-bottom: 10px;
    margin-left:20px
}
img{
	margin-left:25px;
}
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 5px;
}
.using .gray_box {
    padding: 10px 10px 10px 10px;
    border: 1px solid #dddddd;
    background: #fff;
}
.using .strong {
    font-weight: 600;
    padding-bottom: 10px;
}
.using ul li {
    line-height: 20px;
    padding: 0 0 0 10px;
}
.gray_box li {
    color: #444;
}
#content {
    width: 1100px;
    margin: auto;
    overflow: hidden;
    padding: 0 0 0 0;
    background: #fff;
    min-height: 500px;
    padding-top: 42px;
    padding-bottom: 30px;
}
#container {
    position: relative;
    width: 100%;
    margin: 0 0;
    background: #f6f6f6;
}  
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- container -->
	<div id="container" class="xb">
		<div id="container_in">

			<h2 class="hidden">본문영역</h2>
			<!-- content -->
			<div id="content">

				<hr />
				<div class="content_in">


					<h3>이메일주소무단수집거부</h3>
					<div class="email">
						<img src="/resources/email_war.gif"
							alt="무차별적으로 보내지는 메일을 차단하기위해  KH아트센터 산하의 모든 웹사이트에서 게시된 이메일 주소를 이메일 수집프로그램이나 그 밖의 기술 장치를 이용하여 '무단으로 수집되는 것을 거부' 하며, 이를 위반할 경우 정보통신망 법에 의해 형사 처벌됨을 유념하시기 바랍니다." />
					</div>
					<br>
					<div class="using">
						<div class="gray_box">
							<ul>
								<li class="strong">제50조의 2(전자우편주소의 무단 수집행위 등 금지)</li>
								<li>① 누구든지 인터넷 홈페이지 운영자 또는 관리자의 사전 동의 없이 인터넷 홈페이지에서 자동으로
									전자우편주소를 수집하는 프로그램이나 그 밖의 기술적 장치를 이용하여 전자우편주소를 수집하여서는 아니 된다.</li>
								<li>② 누구든지 제1항을 위반하여 수집된 전자우편주소를 판매·유통하여서는 아니 된다.</li>
								<li class="pd_b10">③ 누구든지 제1항과 제2항에 따라 수집·판매 및 유통이 금지된
									전자우편주소임을 알면서 이를 정보 전송에 이용하여서는아니 된다.</li>
								<li>정보통신망 이용촉진 및 정보보호 등에 관한 법률 [일부개정 2011.4.5 법률 제10560호
									시행일 2011.7.6]</li>
							</ul>
						</div>
					</div>



				</div>
				<!-- content_in:end -->

			</div>
			<!-- //content:end -->
		</div>
	</div>
	<c:import url="/WEB-INF/views/footer.jsp" />
	
</body>
</html>