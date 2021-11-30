<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User"%>
<%@ page import="java.util.ArrayList"%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta name="viewport" content="width=device-width", initial-scale="1"> -->
<!-- 웹 페이지와 외부 자원간의 관계를 정의, 주로 스타일시트(CSS)파일 링크에 사용됨. -->
<link rel="stylesheet" type="text/css" href="../CSS/main.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<title>마이페이지-정보수정</title>
</head>
<body>
	<div>
		<!-- 헤더영역 시작 -->
		<!-- 사이트의 소개나 네비게이션 등을 표시하는 영역 -->
		<header class="header">
			<!-- 네비게이션 영역 시작 -->
			<!-- 사이트의 네비게이션(메뉴) 항목을 표시 -->
			<nav class="nav">
				<a href="main_afterlogin.jsp"> <img
					src="../Images/main_logo.png" class="img_logo"> <!--로고 넣을 부분-->
				</a> <a href="mypage.jsp"> <img src="../Images/mypage_logo.png"
					class="mypage_logo">
				<!-- 마이페이지 로고 넣을 부분-->
				</a>

			</nav>
			<!-- 네비게이션 영역 끝 -->
		</header>
		<!-- 헤더영역 끝 -->
	</div>
	<br>
	<!-- 하얀색 백그라운드 div -->
	<div class="white_background">
		<a href="bookmark.jsp"><img src="../Images/bookmark.png"
			class="bookmark"> </a>
		<!-- 즐겨찾기 별모양 넣을 부분 -->
		<br> <img src="../Images/mypage_profile_logo.png"
			class="profile_logo"> <br>
		<%
		UserDAO userDAO = new UserDAO();
		String pw_star = userDAO.setStarUserPassword((String) session.getAttribute("userPassword"));
		ArrayList<User> list = userDAO.mypage_set((String) session.getAttribute("userID"),
				(String) session.getAttribute("userPassword"));
		for (int i = 0; i < list.size(); i++) {
		%>
		<p class="mypage_id"><%=list.get(i).getUserName()%>
			님
		</p>
		<br>
		<table class="edit_table">
			<tr>
				<td><p>
						<b>PW</b>
					</p></td>
				<td><b><%=pw_star%></b></td>
				<td><button class="edit" onclick="EditPW()">EDIT</button></td>
			</tr>
			<tr>
				<td><p>
						<b>E-mail</b>
					</p></td>
				<td><b><%=list.get(i).getUserEmail()%> </b></td>
				<!-- db에서 이메일 갖고 와서 표시 해야 함 -->
				<td><button class="edit" onclick="EditEmail()">EDIT</button></td>
			</tr>
			<%
			}
			%>
		</table>
		<br>
		<br>
		<form method="post" action="../logoutAction.jsp">
			<a href="#" class="button_logout"
				onclick="Logout_alert()">LOGOUT </a>
		</form>
		<form method="post" action="dropoutAction.jsp">
			<a href="#" class="button_dropout" onclick="Dropout_alert()">DROP OUT</a>
		</form>

	</div>
	<br>
	<br>
	<br>
	
	<!-- 푸터 영역 시작 -->
    <div class="footer" style="height : 200px;">
        <footer>
            <div class="footer_detail" style="position : absolute;margin-left : 450px;">
                <br>
                <p>
                    고객센터 1234-1234<br>
                </p>
                <p>
                    상담전화 13:00~16:00(평일)
                </p>
                <p>
                    상담톡 10:00~16:00(평일)
                </p>
                <p>
                    메일 nadobanham_123@naver.com
                </p>
            </div>
            <div class="footer_company" style="position : absolute;margin-left : 810px;">
                <p style="margin-left: 80px; font-size : 30px; font-family: Jua;">
                    나도반함
                </p>
                <p>
                    대표 : 이채정, 이지은, 손영주, 곽민지
                </p>
                <p>
                    사업자등록번호 : 123-12-12345
                </p>
            </div>
            <div class="footer_bank" style="position : absolute;margin-left : 1170px;">
                <br>
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
	
	<script type="text/javascript" src="../JavaScript/common.js"></script>
	<!-- script 위치는 body 안에서 맨 마지막 -->
</body>
</html>