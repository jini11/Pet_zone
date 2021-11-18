<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- <meta name="viewport" content="width=device-width", initial-scale="1"> -->
	<!-- 웹 페이지와 외부 자원간의 관계를 정의, 주로 스타일시트(CSS)파일 링크에 사용됨. -->
	<link rel="stylesheet" type="text/css" href="../CSS/edit_email.css">
	<script src="../JavaScript/common.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<title>이메일 변경</title>
	
</head>
<body>
	<section class="edit_email-form">
		<h1>EDIT Email</h1>
		<form action="">
			<div class="int-area">
				<input type="email" name="edit_email" id="edit_email" autocomplete="off" required>
				<label for="edit_email">새 이메일</label>
			</div>
			<div class="btn-area">
				<button type="submit" style="font-family:'Jua', sans-serif;">변경하기</button> <!--DB에 해당 고객의 정보가 일치하면 mypage로 넘어가야함-->
			</div>
		</form>

	</section>

	<script>
		let email = $('#email');
		let btn = $('#btn');

		$(btn).on('click', function(){
			if($(email).val() == ""){
				$(email).next('label').addClass('warning');
				setTimeout(function(){
					$('label').removeClass('warning');
				},1500);
			}
			
		});

	</script>


</body>
</html>