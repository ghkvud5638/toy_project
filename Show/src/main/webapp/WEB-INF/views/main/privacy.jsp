<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<c:import url="/WEB-INF/views/header.jsp" />
<head>
<style>
#container {
    position: relative;
    width: 100%;
    margin: 0 0;
    background: #f6f6f6;
}
h3 {
    clear: both;
    color: #222;
    font-family: "NotoSans Bold";
    height: 28px;
    font-size: 24px;
    letter-spacing: -0.03em;
    margin-bottom: 10px;
    margin-left:36px;
}
.list thead th {
    text-align: center;
    font-weight: normal;
    border-bottom: 1px solid #8e8e8c;
    background: #f2f2f2 url(../img/board/board_line.gif) no-repeat right;
    padding: 18px 0;
    color: #666;
    font-size: 13px;
}
.list td {
    text-align: center;
    padding: 18px 0;
    letter-spacing: 0px;
    border-bottom: 1px solid #d8d8d8;
    border-right: 1px solid #d8d8d8;
    vertical-align: middle;
    line-height: 22px;
    font-size: 14px;
}
dl, ul, ol, li {
    list-style: none;
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
</style>
</head>
<!-- container -->
<body>
<div id="container" class="xb">
	<div id="container_in">

		<h2 class="hidden">본문영역</h2>
		<!-- content -->
		<div id="content">

			<hr />
			<div class="content_in">


				<h3>개인정보처리방침</h3>
				<div class="using">
					<ul>
						<li class="gray_box">KH아트센터는 개인정보 보호법 제30조에 따라 정보주체의 개인정보를
							보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을
							수립·공개합니다.</li>
					</ul>
					<ul>
						<li class="strong">제1조(개인정보의 처리목적)</li>
						<li>① KH아트센터는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적
							이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는
							등 필요한 조치를 이행할 예정입니다.</li>
						<li>
							<ol>
								<li>1. 홈페이지 회원 가입 및 관리</li>
								<li class="pd_l14">회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증,
									회원자격 유지·관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 만 14세 미만 아동의
									개인정보 처리시 법정대리인의 동의여부 확인, 각종 고지·통지, 고충처리 등을 목적으로 개인정보를 처리합니다.</li>
							</ol>
						</li>
						<li class="pd_b10">② KH아트센터가 개인정보 보호법 제32조에 따라 등록·공개하는
							개인정보파일의 처리목적은 다음과 같습니다.</li>
						<li>
							<ol>
								<li>
									<table class="list">
										<caption>개인정보파일 처리목적표 - 순번, 개인정보파일의 명칭, 운영근거/처리목적,
											개인정보파일에 기록되는 개인정보의 항목, 보유기간</caption>
										<colgroup>
											<col style="width: 10%;" />
											<col style="width: 15%;" />
											<col style="width: 35%;" />
											<col style="width: 20%;" />
											<col style="width: 20%;" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">순번</th>
												<th scope="col">개인정보파일의 명칭</th>
												<th scope="col">운영근거/처리목적</th>
												<th scope="col">개인정보파일에 기록되는<br />개인정보의 항목
												</th>
												<th scope="col" class="r_none">보유기간</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>회원DB</td>
												<td>KH아트센터 이용약관</td>
												<td>아이디, 성명, 비밀번호, 전화번호</td>
												<td class="r_none">회원 탈퇴시까지 보유</td>
											</tr>
										</tbody>
									</table>
								</li>
								<li>※ 기타 KH아트센터의 개인정보파일 등록사항 공개는 <a
									href="http://www.privacy.go.kr/" target="_blank">행정안전부
										개인정보보호 종합지원 포털(www.privacy.go.kr)</a><br />→ 민원마당 → 개인정보의 열람 등 요구
									→ 개인정보파일 목록검색 메뉴를 활용해주시기 바랍니다.
								</li>
							</ol>
						</li>
					</ul>
					<ul>
						<li class="strong">제2조(개인정보의 처리 및 보유기간)</li>
						<li class="pd_b10">① KH아트센터는 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터
							개인정보를 수집시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.</li>
						<li>② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.</li>
						<li>
							<ol>
								<li>1. 홈페이지 회원 가입 및 관리 : 홈페이지 탈퇴시 까지 다만, 다음의 사유에 해당하는 경우에는
									해당 사유 종료시까지</li>
								<li class="pd_l14">1) 관계 법령 위반에 따른 수사·조사 등이 진행중인 경우에는 해당
									수사·조사 종료시까지</li>
								<li class="pd_l14">2) 홈페이지 이용에 따른 채권·채무관계 잔존시에는 해당 채권·채무관계
									정산시까지</li>
								<li>2. 민원사무 처리 : 민원처리 종료 후 3년</li>
							</ol>
						</li>
					</ul>
					<ul>
						<li class="strong">제3조(개인정보의 제3자 제공)</li>
						<li class="pd_b10">① KH아트센터는 정보주체의 개인정보를 제1조(개인정보의 처리 목적)에서
							명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조에 해당하는 경우에만
							개인정보를 제3자에게 제공합니다.</li>
						<li>② KH아트센터는 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.</li>
						<li>
							<ol>
								<li>- 개인정보를 제공받는 자 : <(주)인터파크></li>
								<li>- 제공받는 자의 개인정보 이용목적 : <인터넷 공연 예매 결제 시, 아트플러스 및 교육 프로그램
										결제 시></li>
								<li>- 제공하는 개인정보 항목 : <아이디 , 성명, 생년월일, 결제일, 결제금액></li>
								<li>- 제공받는 자의 보유·이용기간 : <홈페이지 탈퇴 시 까지> 또는 <해당 서비스 종료
										시까지></li>
							</ol>
						</li>
					</ul>
					<ul>
						<li class="strong">제4조(개인정보처리의 위탁)</li>
						<li>① KH아트센터는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.</li>
						<li>
							<ol>
								<li>1. 수탁기관 : ㈜인터파크</li>
								<li class="pd_l14">- 대상고객 : 유료 및 무료회원</li>
								<li class="pd_l14">- 위탁업무내용 : 티켓예매, 현장매표소 발권, 고객불만처리 등</li>
								<li class="pd_l14">- 위탁기간 : 개인정보 보유 기간</li>
							</ol>
						</li>
						<li class="pd_b10">② KH아트센터는 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무
							수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에
							관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</li>
						<li>③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록
							하겠습니다.</li>
					</ul>
					<ul>
						<li class="strong">제5조(정보주체와 법정대리인의 권리․ 의무 및 행사방법)</li>
						<li class="pd_b10">① 정보주체는 KH아트센터에 대해 언제든지 개인정보 열람․정정․삭제․처리정지
							요구 등의 권리를 행사할 수 있습니다.</li>
						<li class="pd_b10">② 제1항에 따른 권리 행사는 KH아트센터에 대해 개인정보 보호법 시행령
							제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며, KH아트센터는 이에 대해
							지체없이 조치하겠습니다.</li>
						<li class="pd_b10">③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등
							대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야
							합니다.</li>
						<li class="pd_b10">④ 개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제5항,
							제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.</li>
						<li class="pd_b10">⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집
							대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</li>
						<li>⑥ KH아트센터는 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등
							요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.</li>
					</ul>
					<ul>
						<li class="strong">제6조(처리하는 개인정보 항목)</li>
						<li>KH아트센터는 다음의 개인정보 항목을 처리하고 있습니다.</li>
						<li>
							<ol>
								<li>1. 홈페이지 회원 가입 및 관리</li>
								<li class="pd_l14">- 필수항목 : 아이디, 이름, 비밀번호, 이메일, 생년월일, 전화번호,
									휴대전화번호, 주소, 가입일</li>
								<li class="pd_l14">- 선택항목 : 좋아하는 장르, 이메일 수신 여부, SMS 수신여부</li>
								<li>2. 민원사무 처리</li>
								<li class="pd_l14">- 필수항목 : 아이디, 성명, 전화번호, 주소</li>
								<li class="pd_l14">- 선택항목 : 이메일주소</li>
								<li>3. 인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다.</li>
								<li class="pd_l14">- IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록, 불량
									이용기록 등</li>
							</ol>
						</li>
					</ul>
					<ul>
						<li class="strong">제7조(개인정보의 파기)</li>
						<li class="pd_b10">① KH아트센터는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가
							불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.</li>
						<li class="pd_b10">② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이
							달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보(또는
							개인정보파일)을 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.</li>
						<li>③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.</li>
						<li>
							<ol>
								<li>1. 파기절차</li>
								<li class="pd_l14">KH아트센터는 파기하여야 하는 개인정보(또는 개인정보파일)에 대해
									개인정보 파기계획을 수립하여 파기합니다. KH아트센터는 파기 사유가 발생한 개인정보(또는 개인정보파일)을
									선정하고, KH아트센터는 개인정보 보호책임자의 승인을 받아 개인정보(또는 개인정보파일)을 파기합니다.</li>
								<li>2. 파기방법</li>
								<li class="pd_l14">KH아트센터는 전자적 파일 형태로 기록․저장된 개인정보는 기록을 재생할
									수 없도록 파기하며, 종이 문서에 기록․저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.</li>
							</ol>
						</li>
					</ul>
					<ul>
						<li class="strong">제8조(개인정보의 안전성 확보조치)</li>
						<li>① KH아트센터는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.</li>
						<li>
							<ol>
								<li>1. 관리적 조치 : 내부관리계획 수립·시행, 정기적 직원 교육 등</li>
								<li>2. 기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정보 등의
									암호화, 보안프로그램 설치</li>
								<li>3. 물리적 조치 : 전산실(IDC), 자료보관실 등의 접근통제</li>
							</ol>
						</li>
					</ul>
					<ul>
						<li class="strong">제9조(개인정보 자동 수집 장치의 설치∙운영 및 거부에 관한 사항)</li>
						<li>① KH아트센터는 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는
							‘쿠기(cookie)’를 사용합니다.</li>
						<li>② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의
							정보이며 이용자의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.</li>
						<li>
							<ol>
								<li>가. 쿠키의 사용목적: 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기
									검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.</li>
								<li>나. 쿠키의 설치∙운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을
									통해 쿠키 저장을 거부 할 수 있습니다.</li>
								<li>다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.</li>
							</ol>
						</li>
					</ul>
					<ul>
						<li class="strong">제10조(개인정보 보호책임자)</li>
						<li>① KH아트센터는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의
							불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.</li>
						<li>
							<ol>
								<li>▶ 개인정보 보호책임자</li>
								<li class="pd_l14">담당자 : KH아트센터 사장</li>
								<li class="pd_b5 pd_l14">연락처 / E-mail : 031-230-3236 / <a
									href="mailto:webmaster@ggac.or.kr">webmaster@ggac.or.kr</a></li>
								<li>▶ 개인정보 보호 담당부서</li>
								<li class="pd_l14">부서명 : 안전시설팀</li>
								<li class="pd_l14">담당자 : 안전시설팀장</li>
								<li class="pd_l14">연락처 / E-mail : 031-230-3236 / <a
									href="mailto:webmaster@ggac.or.kr">webmaster@ggac.or.kr</a></li>
							</ol>
						</li>
						<li>② 정보주체께서는 KH아트센터의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련
							문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호채임자 및 담당부서로 문의하실 수 있습니다. KH아트센터는
							정보주체의 문의에 대해 지체없이 답변 및 처리해드릴 것입니다.</li>
					</ul>
					<ul>
						<li class="strong">제11조(개인정보 열람청구)</li>
						<li>① 정보주체는 개인정보 보호법 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다.
							KH아트센터는 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.</li>
						<li>
							<ol>
								<li>▶ 개인정보 열람청구 접수/처리부서</li>
								<li class="pd_l14">부서명 : 경영기획팀</li>
								<li class="pd_l14">담당자 : 정보공개 담당자</li>
								<li class="pd_l14">연락처 / E-mail : 031-230-3234 / <a
									href="mailto:yong@ggac.or.kr">yong@ggac.or.kr</a></li>
							</ol>
						</li>
						<li>② 정보주체께서는 제1항의 열람청구 접수·처리부서 이외에 행정안전부의 <a
							href="http://www.privacy.go.kr/">개인정보보호 종합지원 포털
								웹사이트(www.privacy.go.kr)</a>를 통하여서도 개인정보 열람청구를 하실 수 있습니다.
						</li>
						<li>
							<ol>
								<li>▶ 행정안전부 개인정보보호 종합지원 포털 → 민원마당 → 개인정보 열람등 요구 (공공아이핀을 통한
									실명인증 필요)</li>
							</ol>
						</li>
					</ul>
					<ul>
						<li class="strong">제12조(권익침해 구제방법)</li>
						<li>정보주체는 아래의 기관에 대해 개인정보 침해에 대한 피해구제, 상담 등을 문의하실 수 있습니다.(아래의
							기관은 KH아트센터과는 별개의 기관으로서, KH아트센터의 자체적인 개인정보 불만처리, 피해구제 결과에 만족하지
							못하시거나 보다 자세한 도움이 필요하시면 문의하여 주시기 바랍니다)</li>
						<li>
							<ol>
								<li>▶ 개인정보 침해신고센터 (한국인터넷진흥원 운영)</li>
								<li class="pd_l14">- 소관업무 : 개인정보 침해사실 신고, 상담 신청</li>
								<li class="pd_l14">- 홈페이지 : <a
									href="http://privacy.kisa.or.kr/">privacy.kisa.or.kr</a></li>
								<li class="pd_l14">- 전화 : (국번없이) 118</li>
								<li class="pd_b5 pd_l14">- 주소 : (58324) 전남 나주시 진흥길 9(빛가람동
									301-2) 3층 개인정보침해신고센터</li>
								<li>▶ 개인정보 분쟁조정위원회</li>
								<li class="pd_l14">- 소관업무 : 개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결)</li>
								<li class="pd_l14">- 홈페이지 : <a
									href="http://www.kopico.go.kr/">www.kopico.go.kr</a>
								</li>
								<li class="pd_l14">- 전화 : (국번없이) 1833-6972</li>
								<li class="pd_b5 pd_l14">- 주소 : (03171)서울특별시 종로구 세종대로 209
									정부서울청사 4층</li>
								<li>▶ 대검찰청 사이버범죄수사단 : 02-3480-3573 (<a
									href="http://www.spo.go.kr">www.spo.go.kr</a>)
								</li>
								<li>▶ 경찰청 사이버안전국 : 182 (<a
									href="http://cyberbureau.police.go.kr">http://cyberbureau.police.go.kr</a>)
								</li>
							</ol>
						</li>
					</ul>
					<ul>
						<li class="strong">제13조(개인정보 처리방침 변경)</li>
						<li>① 이 개인정보 처리방침은 2020. 04부터 적용됩니다.</li>
						<li>② 이전의 개인정보 처리방침은 아래에서 확인하실 수 있습니다.</li>
						<li class="pd_l14">- <a href="/?p=229">2011. 12. 02. ~
								2020. 04. 적용(클릭)</a></li>
					</ul>
				</div>

			</div>
		</div>
	</div>

</div>
<!-- content_in:end -->




<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>