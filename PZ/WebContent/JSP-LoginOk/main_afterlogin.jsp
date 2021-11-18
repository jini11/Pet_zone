<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- <meta name="viewport" content="width=device-width", initial-scale="1"> -->
	<!-- 웹 페이지와 외부 자원간의 관계를 정의, 주로 스타일시트(CSS)파일 링크에 사용됨. -->
	<link rel="stylesheet" type="text/css" href="../CSS/main.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<title>나도반함(로그인 완료)</title>

</head>


<body onload="afterlogin_showImage()">
	<div>
		<!-- 헤더영역 시작 -->
		<!-- 사이트의 소개나 네비게이션 등을 표시하는 영역 -->
		<header class="header">
			<!-- 네비게이션 영역 시작 -->
			<!-- 사이트의 네비게이션(메뉴) 항목을 표시 -->
			<nav class="nav">
				<a href="main_afterlogin.jsp">
					<img src="../Images/main_logo.png" class="img_logo">  <!--로고 넣을 부분-->
				</a>
				<a href="mypage.jsp">
					<img src="../Images/mypage_logo.png" class="mypage_logo"><!-- 마이페이지 로고 넣을 부분-->
				</a>
			</nav>
			<!-- 네비게이션 영역 끝 -->
		</header>
		<!-- 헤더영역 끝 -->
	</div>

	<!-- 사진 넣기 -->
	<div class="photo" onload="afterlogin_showImage()">
		<img id = "introImg" class="main_img" width="1000px;">
	</div>


	<div>
		<table class="main_table">
			<tr>
				<td><a href="outdoors.jsp"><img src="../Images/outdoors.png"><p>야외</p></td>
				<td><a href="food.jsp"><img src="../Images/food.png"><p>음식점</p></a></td>
				<td><a href="accommodation.jsp"><img src="../Images/accommodation.png"><p>숙박</p></td>
				<td><a href="all.jsp"><img src="../Images/all.png"><p>전체</p></td>

			</tr>
		</table>
	</div>
	<!-- 콘텐츠 및 섹션 영역 끝 -->
	<br>
	<hr style = "width : 900px;">
	<!-- 푸터 영역 시작 -->
	<div class="footer">
		<footer>
			<link rel="preconnect" href="https://fonts.gstatic.com">
			<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">

			<p><br> 홈페이지 설명 </p>
			<p> 반려견과 동반 입장이 가능한 펫존(음식점, 숙박시설, 야외)을 검색할 수 있는 홈페이지입니다.<br></p>
			<p> 많은 이용 부탁드립니다:) </p>

		</footer>
	</div>
	<!-- 푸터 영역 끝 -->

	<!-- 자바스크립트 파일 외부 참조-->
	<script type="text/javascript" src="../JavaScript/common.js"></script>
</body>

</html>
