<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
    private Connection conn;
    private Statement stmt;
    private ResultSet rs;
%>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost/db_dog/?allowPublicKeyRetrieval=true&useSSL=false", "root", "6497");
    stmt = conn.createStatement();
    rs = stmt.executeQuery("select * from pet_zone");
%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="description" content="">
	<meta name="keywords" content="HTML5, CSS, JavaScript">

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
				<a href="../main.html">
					<img src="../Images/main_logo.png" class="img_logo">  <!--로고 넣을 부분-->
				</a>
				<a href="login.html" class="button_login">LOGIN</a>
			</nav>
			<!-- 네비게이션 영역 끝 -->
		</header>
		<!-- 헤더영역 끝 -->
	</div>

  <!-- 상단 메뉴 사진 표시하는 부분 -->
  <div class="top_menu_photo">
    <a href="food.html">
      <img src="../Images/food.png">
    </a>
    <p>FOOD</p>
  </div>

  <div id="content">
    <div id="table">
        <div class="row">
            <table>
                <tr>
                    <td rowspan="2">사번</td>
                    <td rowspan="2">이름</td>
                    <td>날짜</td>
                </tr>
                <tr>
                    <td>금액</td>
                </tr>
            </table>
        </div>
    </div>
    <% while(rs.next()){ %>
    
    <a href="#?sabun=<%=rs.getInt("sabun") %>">
     <div class="row">
        <div class = "col"><%=rs.getInt("name") %></div>
        <div class = "col"><%=rs.getString("address") %></div>
        <div class = "col"><%=rs.getString("phone") %></div>
        <div class = "col"><%=rs.getString("wd_time") %></div>
     </div>
     </a>
    <% } %>
   </div>

	<!-- 자바스크립트 파일 외부 참조-->
	<script type="text/javascript" src="JavaScript/common.js"></script>
</body>

</html>
