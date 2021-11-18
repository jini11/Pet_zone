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
	<title>나도반함-식당</title>
</head>

<body>
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

  <!-- 상단 메뉴 사진 표시하는 부분 -->
  <div class="top_menu_photo">
    <a href="outdoors.jsp">
      <img src="../Images/outdoors.png">
    </a>
    <p>OUTDOORS</p>
  </div>


	<!-- 자바스크립트 파일 외부 참조-->
	<script type="text/javascript" src="../JavaScript/common.js"></script>
</body>

</html>