<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- <meta name="viewport" content="width=device-width", initial-scale="1"> -->
	<!-- 웹 페이지와 외부 자원간의 관계를 정의, 주로 스타일시트(CSS)파일 링크에 사용됨. -->
	<link rel="stylesheet" type="text/css" href="../CSS/edit_pw.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<title>비밀번호 변경</title>
</head>
<body>
	<section class="edit_pw-form">
		<h1>EDIT PW</h1>
		<form action="">
			<div class="int-area">
				<input type="password" name="pw" id="pw" autocomplete="off" required>
				<label for="pw">현재 비밀번호</label>
			</div>
			<div class="int-area">
				<input type="password" name="edit_pw" id="edit_pw" autocomplete="off" required>
				<label for="edit_pw">새 비밀번호</label>
			</div>
      <div class="int-area">
				<input type="password" name="edit_pw2" id="edit_pw2" autocomplete="off" required>
				<label for="edit_pw2">새 비밀번호 확인</label>
			</div>
			<div class="btn-area">
				<button type="submit" style="font-family:'Jua', sans-serif;">변경하기</button> <!--DB에 해당 고객의 정보가 일치하면 mypage로 넘어가야함-->
			</div>
		</form>

	</section>

	<script>
		let pw = $('#pw');
    	let edit_pw = $('#edit_pw');
    	let edit_pw2 = $('#edit_pw2');
		let btn = $('#btn');

		$(btn).on('click', function(){
			if($(pw).val() == ""){
				$(pw).next('label').addClass('warning');
				setTimeout(function(){
					$('label').removeClass('warning');
				},1500);
			}
			else if($(edit_pw).val() == ""){
				$(edit_pw).next('label').addClass('warning');
				setTimeout(function(){
					$('label').removeClass('warning');
				},1500);
			}
     		 else if($(edit_pw2).val() == ""){
				$(edit_pw2).next('label').addClass('warning');
				setTimeout(function(){
					$('label').removeClass('warning');
				},1500);
			}
		});

	</script>


</body>
</html>