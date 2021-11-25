<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width", initial-scale="1">
	<!-- 웹 페이지와 외부 자원간의 관계를 정의, 주로 스타일시트(CSS)파일 링크에 사용됨. -->
	<link rel="stylesheet" type="text/css" href="../CSS/findid.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<title>아이디찾기</title>
</head>

<body>
	<section class="find-id-form">
		<h1>FIND ID</h1>
		<form action="../findIDAction.jsp" method="post" name="find-id-input">
			<div class="int-area">
				<input type="text" name="userName" id="name" autocomplete="off" required>
				<label for="name">USER NAME</label>
			</div>
			<div class="int-area">
				<input type="email" name="userEmail" id="email" autocomplete="off" required>
				<label for="email">USER EMAIL</label>
			</div>
			<div class="btn-area">
				<button type="submit" style="font-family:'Jua', sans-serif;" onClick="id_search()">아이디 찾기</button>
			</div>
		</form>
		<div class="caption">
			<a href="../main.jsp">홈&nbsp; |</a>
			<a href="signup.jsp">&nbsp;회원가입&nbsp; |</a>
			<a href="login.jsp">&nbsp;로그인&nbsp; |</a>
			<a href="findPW.jsp">&nbsp;비밀번호 찾기</a>
		</div>
	</section>

<script>
	let name = $('#name');
	let email = $('#email');
	let btn = $('#btn');

	$(btn).on('click', function(){
		if($(name).val() == ""){
			$(name).next('label').addClass('warning');
			setTimeout(function(){
				$('label').removeClass('warning');
			},1500);
		}
		else if($(email).val() == ""){
			$(email).next('label').addClass('warning');
			setTimeout(function(){
				$('label').removeClass('warning');
			},1500);
		}
	});
</script>
</body>
</html>
