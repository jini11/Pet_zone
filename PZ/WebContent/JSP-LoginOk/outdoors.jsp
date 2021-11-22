<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="pz.PzDAO" %>
<%@ page import="pz.Pz" %>
<%@ page import="java.util.ArrayList" %>
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
	<%
		int pageNumber = 1;
		int index = 1;
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
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

	<div class="container">
		<div class="row" style="margin:50px auto auto 180px;">
			<table class="table table-striped table-bordered table-hover" style="width: 1600px;	text-align:center; border:1px solid #000000; border-collapse: collapse;">
				<thead>
					<tr style="border: 1px solid #000000">
						<th style="text-align: center;">번호</th>
						<th style="text-align: center;">이름</th>
						<th style="text-align: center;">주소</th>
						<th style="text-align: center;">전화번호</th>
						<th style="text-align: center;">평일</th>
						<th style="text-align: center;">주말</th>
						<th style="text-align: center;">휴무</th>
					</tr>
				</thead>
				<tbody>
					<%
						PzDAO pzDAO = new PzDAO();
						ArrayList<Pz> list = pzDAO.getList(pageNumber,"outdoors");
						for(int i=0;i<list.size();i++) {
					%>
					<tr>
						<td><%= 20 * (pageNumber - 1) + (index++) %></td>
						<td><%= list.get(i).getPz_name() %></td>
						<td><%= list.get(i).getPz_address() %></td>
						<td><%= list.get(i).getPz_phone() %></td>
						<td><%= list.get(i).getWd_time() %></td>
						<td><%= list.get(i).getWe_time() %></td>
						<td><%= list.get(i).getClosed() %></td>
					</tr> 
					<%
						}
					%>
				</tbody>
			</table>		
			<%
				if(pageNumber != 1) {
			%>
				<a href="outdoors.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				} if(pzDAO.nextPage(pageNumber + 1)) {
			%>
				<a href="outdoors.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left" >다음</a>
			<%
				}
			%>
			<!--<input type="submit" class="btn btn-primary pull-right" value="신고" style="font-size:20px"> -->
		</div>
	</div>

	<!-- 자바스크립트 파일 외부 참조-->
	<script type="text/javascript" src="../JavaScript/common.js"></script>
</body>

</html>