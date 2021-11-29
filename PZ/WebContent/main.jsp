<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width", initial-scale="1">
	<!-- 웹 페이지와 외부 자원간의 관계를 정의, 주로 스타일시트(CSS)파일 링크에 사용됨. -->
	<link rel="stylesheet" type="text/css" href="CSS/main.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<title>나도반함</title>

</head>

<body onload="showImage()">
	<div>
		<!-- 헤더영역 시작 -->
		<!-- 사이트의 소개나 네비게이션 등을 표시하는 영역 -->
		<header class="header">
			<!-- 네비게이션 영역 시작 -->
			<!-- 사이트의 네비게이션(메뉴) 항목을 표시 -->
			<nav class="nav">
				<a href="main.jsp">
					<img src="Images/main_logo.png" class="img_logo">  <!--로고 넣을 부분-->
				</a>

				<a href="JSP/login.jsp" class="button_login">LOGIN</a>
			</nav>
			<!-- 네비게이션 영역 끝 -->
		</header>
		<!-- 헤더영역 끝 -->
	</div>

	<!-- 사진 넣기 -->
	<div class="photo" onload="showImage()">
		<img id = "introImg" class="main_img" width="1000px;">
	</div>


	<div>
		<table class="main_table">
			<tr>
				<td><a href="JSP/food.jsp"><img src="Images/food.png"><p>음식점</p></a></td>
				<td><a href="JSP/accommodation.jsp"><img src="Images/accommodation.png"><p>숙박</p></td>
				<td><a href="JSP/outdoors.jsp"><img src="Images/outdoors.png"><p>야외</p></td>
				<td><a href="JSP/all.jsp"><img src="Images/all.png"><p>전체</p style="font-size:30px;"></td>

			</tr>
		</table>
	</div>
	<!-- 콘텐츠 및 섹션 영역 끝 -->
	<br>
	<hr style = "width : 900px;">
	
	<!-- 푸터 영역 시작 -->
	<div class="footer" style="height : 200px;">
		<footer>
			<div class="footer_detail" style="position : absolute;margin-left : 450px;">
				<br>
                <p>
                    고객센터 1234-1234<br>
                </p>
                <p>
                    상담전화 13:00~16:00(평일)<br>
                </p>
                <p>
                    상담톡 10:00~16:00(평일)
                </p>
                <br>
                <p>
                    메일 nadobanham_123@naver.com
                </p>
            </div>
            <div class="footer_company" style="position : absolute;margin-left : 810px;">
                <p style="margin-left: 80px; font-size : 35px; font-family: Jua;">
                    나도반함
                </p>
                <p>
                    대표 : 이채정, 이지은, 손영주, 곽민지
                </p>
                <p>
                    개인정보관리책임자 : 대표와 동일
                </p>
                <p>
                    사업자등록번호 : 123-12-12345
                </p>
            </div>
            <div class="footer_bank" style="position : absolute;margin-left : 1170px;">
                <br><br>
                <p style="margin-left: 100px;">
                    BANK<br><br>
                </p>
                <p>
                    농협은행 123-1234-1234-12<br>
                </p>
                <p>
                    이채정(건반상점)
                </p>
            </div>
		</footer>
	</div>
	<!-- 푸터 영역 끝 -->

	<!-- 자바스크립트 파일 외부 참조-->
	<script type="text/javascript" src="JavaScript/common.js"></script>
</body>

</html>
