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
					class="mypage_logo"> <!-- 마이페이지 로고 넣을 부분-->
				</a>

			</nav>
			<!-- 네비게이션 영역 끝 -->
		</header>
		<!-- 헤더영역 끝 -->
	</div>
	<br>
	<!-- 하얀색 백그라운드 div -->
	<div class="white_background">
		<br> <a href="bookmark.jsp"><img src="../Images/bookmark.png"
			class="bookmark"> </a>
		<!-- 즐겨찾기 별모양 넣을 부분 -->
		<br> <img src="../Images/mypage_profile_logo.png"
			class="profile_logo"> <br>
		<%
		UserDAO userDAO = new UserDAO();
		ArrayList<User> list = userDAO.mypage_set((String) session.getAttribute("userID"),
				(String) session.getAttribute("userPassword"));
		for (int i = 0; i < list.size(); i++) {
		%>
		<p class="mypage_id"><%=list.get(i).getUserName()%>
			님
		</p>
		<!--db랑 연결해서 해당 아이디 갖고 오는 부분 -->
		<br>
		<table class="edit_table">
			<tr>
				<td><p>
						<b>PW</b>
					</p></td>
				<td><b><%=session.getAttribute("userPassword")%></b></td>
				<!-- db에서 비밀번호 갖고 와서 자릿수만큼 *로 표시 해야 함 -->
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
		<br> <br>
		<form method="post" action="../logoutAction.jsp">
			<a href="#" class="button_logout" onclick="Logout_alert()">LOGOUT
			</a>
		</form>
		<a href="../main.jsp" class="button_dropout" onclick="Dropout_alert()">DROP
			OUT</a>

	</div>
	<br>
	<br>
	<br>
	<div class="footer">
		<footer>
			<link rel="preconnect" href="https://fonts.gstatic.com">
			<link
				href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
				rel="stylesheet">

			<p>
				<br> 마이페이지
			</p>
			<p>
				개인정보 수정 및 즐겨찾기 기능을 이용할 수 있습니다.<br>
			</p>
			<p>많은 이용 부탁드립니다:)</p>

		</footer>
	</div>
	<script type="text/javascript" src="../JavaScript/common.js"></script>
	<!-- script 위치는 body 안에서 맨 마지막 -->
</body>
</html>