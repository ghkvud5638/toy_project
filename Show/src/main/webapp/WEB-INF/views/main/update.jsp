<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
 <script type="text/javascript">
$(document).ready(function() {
	// 비밀번호 정규식
	var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/; 

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
	$('#reg_submit').click(function(){
		if(pwJ.test($('#user_pw').val()) == false || $('#user_pw').val() != $('#user_pw_check').val()){
	    	alert('형식에 맞게 다시 작성해주세요.');
	    	return false;
	    	} else{
	    	alert('수정되었습니다.');
	    	window.close();
			return true;
			}
	});
	$('#back').click(function(){
		window.close();
	});
});

</script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
<style type="text/css">
#join_wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
}
body {
 	font-family: 'Noto Sans KR', sans-serif;
}
.form-group {
    margin: 15px;
}

.reg_button {
    text-align: center;
}
</style>
</head>
<body>
<div id="join_wrapper">
<form method="POST" action="/main/update">
<div class="form-group"><br>
	<h2>정보수정</h2>
</div>
			<!-- 아이디 -->
			 <div class="form-group">
				<label for="user_id">아이디</label><br>
					<input type="text" class="form-control" id="member_id" name="member_id" value=${user.member_id } readonly>
				<div class="check_font" id="id_check"></div>
			</div>
			<!-- 비밀번호 -->
			<div class="form-group">
				<label for="user_pw">비밀번호</label><br>
					<input type="password" class="form-control" id="user_pw" name="member_pw" value=${user.member_pw } >
				<div class="check_font" id="pw_under"></div>
			</div>
			<!-- 비밀번호 재확인 -->
			<div class="form-group">
				<label for="user_pw_check">비밀번호 확인</label><br>
					<input type="password" class="form-control" id="user_pw_check" name="user_pw2" value=${user.member_pw } >
				<div class="check_font" id="pwchk_under"></div>
			</div>
			<!-- 닉네임 -->
			<div class="form-group">
				<label for="user_nick">닉네임</label><br>
				<input type="text" class="form-control" id="user_nick" name="nick" value=${user.nick } required>
				<div class="check_font" id="nick_check"></div>
			</div><br>
						<div class="reg_button">
				<a class="btn btn-danger px-3" id="back">
					<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
				</a>&emsp;&emsp;
				<i class="fa fa-heart pr-2" aria-hidden="true">
					<input type="submit" name="reg_submit" id="reg_submit" value="수정하기" class="btn btn-danger px-3"/>
				</i>
			</div><br>
			
			
		</form>
</div>
</body>
</html>