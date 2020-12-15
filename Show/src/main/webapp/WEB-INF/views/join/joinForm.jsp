<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<c:import url="/WEB-INF/views/header.jsp" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<style type="text/css">



body {
 	font-family: 'Noto Sans KR', sans-serif;
/* font-family: 'Noto Serif KR', serif; */
 }
 
#join_wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
}
 
.form-group {
    margin: 15px;
}

.reg_button {
    text-align: center;
}
</style>
<script type="text/javascript"src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
//공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	// 비밀번호 정규식
	var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/; 
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	//생년월일
// 	var birthJ = /^[0-9]{8}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대전화 검사 정규식
	var phoneJ = /[0-9]{11}$/;
	
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#member_id").blur(function() {
		var member_id = $('#member_id').val();
		$.ajax({
			url : '/join/idCheck?member_id='+member_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else{
						$('#id_check').text('사용가능합니다 :D)');
						$('#id_check').css('color', 'red');

// 						if(idJ.test(member_id)){
// 							// 0 : 아이디 길이 / 문자열 검사
// 							$("#id_check").text("");
// 							$("#reg_submit").attr("disabled", false);
				
// 						} else if(member_id == ""){
							
// 							$('#id_check').text('아이디를 입력해주세요 :)');
// 							$('#id_check').css('color', 'red');
// 							$("#reg_submit").attr("disabled", true);				
							
// 						} else {
							
// 							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
// 							$('#id_check').css('color', 'red');
// 							$("#reg_submit").attr("disabled", true);
// 						}
						
					}
				}, error : function() {
						console.log("실패");
						$('#id_check').text("실패!");
						$('#id_check').css('color', 'red');
				}
			});
		});
		
			
// 	//아이디 정규식 검사
// 	$('#member_id').blur(function(){
		
// 		if(idJ.test($('#member_id').val())) {
// 			$('#id_check').text('');
// 		}else {
// 			$('#id_check').text('숫자와 소문자 조합한 4자리 이상의 아이디를 입력해주세요');
// 			$('#id_check').css('color','red');
// 		}
// 	});
	

	
	//비밀번호 유효성 검사
	$('#user_pw').blur(function(){
	//정규식 맞을때
		if(pwJ.test($('#user_pw').val())) {
			console.log('true');
			$('#pw_under').text('');
	//틀릴때
		}else {
			console.log('false');
			$('#pw_under').text('최소 하나의 문자,숫자 및 하나의 특수 문자');
			$('#pw_under').css('color','red');
		}
	});
	
	//비밀번호 확인
	$('#user_pw_check').blur(function() {
		//정규식 맞을때
		if($('#user_pw').val() != $(this).val()) {
			console.log('false');
			$('#pwchk_under').text('비밀번호가 서로 일치하지 않습니다');
			$('#pwchk_under').css('color','red');
	//틀릴때
		}else {
			console.log('true');
			$('#pwchk_under').text('');
		}
	});
	
	//이름확인
	$("#user_name").blur(function() {
		if (nameJ.test($(this).val())) {
				console.log(nameJ.test($(this).val()));
				$("#name_check").text('');
		} else {
			$('#name_check').text('이름을 다시 확인해주세요');
			$('#name_check').css('color', 'red');
		}
	});
	
	//생일 확인
// 	$("#user_birth").blur(function() {
// 		if (birthJ.test($(this).val())) {
// 			$("#birth_check").text('');
// 		} else {
// 			$('#birth_check').text('생년월일을 다시 확인해주세요');
// 			$('#birth_check').css('color', 'red');
// 		}
// 	});
	
	//이메일
	$("#email").blur(function() {
		if (mailJ.test($(this).val())) {
				$("#email").text('');
		} else {
			$('#email_check').text('이메일을 다시 확인해주세요');
			$('#email_check').css('color', 'red');
		}
	});
	
	//휴대전화
	$("#user_phone").blur(function() {
		if (phoneJ.test($(this).val())) {
				$("#phone_check").text('');
		} else {
			$('#phone_check').text('번호를 다시 확인해주세요');
			$('#phone_check').css('color', 'red');
		}
	});
	
	//birthJ.test($('#user_birth').val()) == false ||
// 	//정규식이 모두 맞을 때 완료창으로 넘어가기
	$('#reg_submit').click(function(){
		if(idJ.test($('#member_id').val()) == false || pwJ.test($('#user_pw').val()) == false || $('#user_pw').val() != $('#user_pw_check').val() || nameJ.test($('#user_name').val()) == false ||  mailJ.test($('#email').val()) == false || phoneJ.test($('#user_phone').val()) == false){
	    	alert('형식에 맞게 필수로 작성하셔야 합니다');
	    	return false;
	    	} else{
			return true;
		}
	});
	
// 	function frmsubmit() {
// 		if(idJ.test($('#member_id').val()) == false || pwJ.test($('#user_pw').val()) == false || $('#user_pw').val() != $('#user_pw_check').val() || nameJ.test($('#user_name').val()) == false || birthJ.test($('#user_birth').val()) == false || mailJ.test($('#user_email').val()) == false || phoneJ.test($('#user_phone').val()) == false){
// 	    	if($('#member_id').val()) = ""  || $('#user_pw').val()) = ""  || $($('#user_pw_check').val() = "" || $('#user_name').val()) = "" || $('#user_birth').val()) = "" || $('#user_email').val()) = "" || $('#user_phone').val()) = ""){
// 		    	alert('모두 필수로 작성하셔야 합니다');
// 		    	return false;
// 	    	} else {
// 	    		alert('형식에 맞게 작성하셔야 합니다');
// 	    		return false;
// 	    	}
// 		}else{
// 			return true;
// 		}
// 	}
	
	
	})
</script>


</head>
<body>

<div id="join_wrapper">
<form method="POST" action="/join/joinForm" onsubmit="return frmsubmit();">
<div class="form-group"><br>
	<h2>회원가입</h2>
</div>
			<!-- 아이디 -->
			 <div class="form-group">
				<label for="user_id">아이디</label><br>
					<input type="text" class="form-control" id="member_id" name="member_id" placeholder="ID" >
				<div class="check_font" id="id_check"></div>
			</div>
			
			<!-- <div class="form-group">
				<label for="user_id">아이디</label><br>
					<input type="text" class="form-control" id="user_id" name="member_id" placeholder="ID" required onkeydown="inputIdChk()">
						<a href="/member/IdCheckForm.jsp" rel="modal:open" onclick="openIdChk()"><button type="button">중복확인</button></a>
	                       <input type="hidden" name="idDuplication" id="idDuplication" value="idUncheck" >
						
			</div><br> -->
			<!-- 비밀번호 -->
			<div class="form-group">
				<label for="user_pw">비밀번호</label><br>
					<input type="password" class="form-control" id="user_pw" name="member_pw" placeholder="PASSWORD" >
				<div class="check_font" id="pw_under"></div>
			</div>
			<!-- 비밀번호 재확인 -->
			<div class="form-group">
				<label for="user_pw_check">비밀번호 확인</label><br>
					<input type="password" class="form-control" id="user_pw_check" name="user_pw2" placeholder="Confirm Password" >
				<div class="check_font" id="pwchk_under"></div>
			</div>
			<!-- 이름 -->
			<div class="form-group">
				<label for="user_name">이름</label><br>
					<input type="text" class="form-control" id="user_name" name="member_name" placeholder="Name" required>
				<div class="check_font" id="name_check"></div>
			</div>
			<!-- 생년월일 -->
			<div class="form-group required">
				<label for="user_birth">생년월일</label><br>
					<input type="text" class="form-control" id="user_birth" name="birth" placeholder="ex) 940212" required>
				<div class="check_font" id="birth_check"></div>
			</div>
			<!-- 성별 -->
			<div class="form-group required">
				<label for="gender">성별</label><br>
					<input type="radio" name="gender" value="남" checked style="width: 13px; height: 13px; margin: 10px;">남
                    <input type="radio" name="gender" value="여" style="width: 13px; height: 13px; margin: 10px;">여
				<div class="check_font" id="gender_check"></div>
			</div>
			
			<!-- 주소 -->
			<div class="form-group required">
			<label for="user_addr">주소</label><br>
			<input type="text" id="sample4_postcode" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="member_addr">
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소"><br>
						
						<label for="phone" class="fly">상세 주소</label><br>
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소">
						<input type="text" id="sample4_extraAddress" placeholder="참고항목"><br><br>
		
						
						
						
			</div>
			<!-- 본인확인 이메일 -->
			<div class="form-group">
				<label for="email">이메일</label><br>
					<input type="text" class="form-control" name="email" id="email" placeholder="E-mail" required>
					<!-- <input type="text" style="margin-top: 5px;"class="email_form" name="email_confirm" id="email_confirm" placeholder="인증번호를 입력해주세요!" required>
						<button type="button" class="btn btn-outline-danger btn-sm px-3" onclick="confirm_email()">
							<i class="fa fa-envelope"></i>&nbsp;인증
						</button>&nbsp;
						<button type="button" class="btn btn-outline-info btn-sm px-3">
							<i class="fa fa-envelope"></i>&nbsp;확인
						</button>&nbsp; -->
					<div class="check_font" id="email_check"></div>
			</div>
			<!-- 휴대전화 -->
			<div class="form-group">
				<label for="user_phone">휴대전화 ('-' 없이 번호만 입력해주세요)</label><br>
				<input type="text" class="form-control" id="user_phone" name="user_phone" placeholder="Phone Number" required>
				<div class="check_font" id="phone_check"></div>
			</div>
			
			<!-- 닉네임 -->
			<div class="form-group">
				<label for="user_nick">닉네임</label><br>
				<input type="text" class="form-control" id="user_nick" name="nick" placeholder="닉네임을 입력해주세요" required>
				<div class="check_font" id="nick_check"></div>
			</div>
			<div class="form-group">
				<label for="member_spot">코드</label><br>
				<input type="text" class="form-control" id="member_spot" name="member_spot" placeholder="관리자 코드를 입력해주세요." required>
				<div class="check_font" id="member_spot"></div>
			</div><br>
			<div class="reg_button">
				<a class="btn btn-danger px-3" href="http://localhost:8088/main/main">
					<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
				</a>&emsp;&emsp;
<!-- 				<button class="btn btn-danger px-3" name="가입하기" id="reg_submit" > -->
<!-- 					<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기 -->
<!-- 				</button> -->
				<i class="fa fa-heart pr-2" aria-hidden="true">
					<input type="submit" name="reg_submit" id="reg_submit" value="가입하기" class="btn btn-danger px-3"/>
				</i>
			</div><br>
			
			
		</form>
</div>		
		<!-- DAUM 우편번호 API -->

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
</script>

<!-- DAUM 우편번호 API 종료 -->
<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>