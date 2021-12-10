<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width", initial-scale="1">
	<!-- 웹 페이지와 외부 자원간의 관계를 정의, 주로 스타일시트(CSS)파일 링크에 사용됨. -->
	<link rel="stylesheet" type="text/css" href="../CSS/login.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<title>로그인</title>

</head>
<body>
	<section class="login-form">
		<h1>LOGIN</h1>
		<form method="post" action="../loginAction.jsp">
			<div class="int-area">
				<input type="text" name="userID" id="id"
				autocomplete="off" required>
				<label for="id">USER ID</label>
			</div>
			<div class="int-area">
				<input type="password" name="userPassword" id="pw"
				autocomplete="off" required>
				<label for="pw">PASSWORD</label>
			</div>
			<div class="btn-area">
				<button type="submit" style="font-family:'Jua', sans-serif;">LOGIN</button> 
			</div>
		</form>
		<div class="caption">
			<a href="../main.jsp">홈&nbsp; |</a>
			<a href="signup.jsp">&nbsp;회원가입&nbsp; |</a>
			<a href="findID.jsp">&nbsp;아이디 찾기&nbsp; |</a>
			<a href="findPW.jsp">&nbsp;비밀번호 찾기</a>
		</div>
	</section>

	<script>
		let id = $('#id');
		let pw = $('#pw');
		let btn = $('#btn');

		$(btn).on('click', function(){
			if($(id).val() == ""){
				$(id).next('label').addClass('warning');
				setTimeout(function(){
					$('label').removeClass('warning');
				},1500);
			}
			else if($(pw).val() == ""){
				$(pw).next('label').addClass('warning');
				setTimeout(function(){
					$('label').removeClass('warning');
				},1500);
			}
		});


	</script>


</body>
</html>
