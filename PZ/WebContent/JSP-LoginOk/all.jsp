<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="pz.PzDAO"%>
<%@ page import="pz.Pz"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta name="viewport" content="width=device-width", initial-scale="1"> -->
<!-- 웹 페이지와 외부 자원간의 관계를 정의, 주로 스타일시트(CSS)파일 링크에 사용됨. -->
<link rel="stylesheet" type="text/css" href="../CSS/main.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script >
<title>나도반함-전체</title>
</head>
<body>
	<%
	int pageNumber = 1;
	int index = 1;
	if (request.getParameter("pageNumber") != null) {
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

	<!-- 상단 메뉴 사진 표시하는 부분 -->
	<div class="top_menu_photo">
		<a href="all.jsp"> <img src="../Images/all.png">
		</a>
		<p>ALL</p>
	</div>

	<div class="search">
		<div style="margin: 50px auto auto 180px;">
			<table class="area"
				style="width: 1100px; height: 80px; text-align: center; border: 1px solid #000000; border-collapse: collapse;">
				<thead>
					<tr style="text-align: center;">
						<th style="width:500px;"><select name="area1"
							onChange="change_area(this.value,area2)" style="width:500px; height: 30px; margin-top:5px;">
								<option>-선택-</option>
								<option value='1'>서울특별시</option>
								<option value='2'>부산광역시</option>
								<option value='3'>대구광역시</option>
								<option value='4'>인천광역시</option>
								<option value='5'>광주광역시</option>
								<option value='6'>대전광역시</option>
								<option value='7'>울산광역시</option>
								<option value='8'>세종특별자치시</option>
								<option value='9'>강원도</option>
								<option value='10'>경기도</option>
								<option value='11'>경상남도</option>
								<option value='12'>경상북도</option>
								<option value='13'>전라남도</option>
								<option value='14'>전라북도</option>
								<option value='15'>제주특별자치도</option>
								<option value='16'>충청남도</option>
								<option value='17'>충청북도</option>
						</select></th>
						<th><select name="area2" style="width:500px; height:30px; margin-top:5px;">
								<option>-선택-</option>
								<option value='216'>광양시</option>
								<option value='217'>나주시</option>
								<option value='218'>목포시</option>
								<option value='219'>순천시</option>
								<option value='220'>여수시</option>
								<option value='221'>강진군</option>
								<option value='222'>고흥군</option>
								<option value='223'>곡성군</option>
								<option value='224'>구례군</option>
								<option value='225'>담양군</option>
								<option value='226'>무안군</option>
								<option value='227'>보성군</option>
								<option value='228'>신안군</option>
								<option value='229'>영광군</option>
								<option value='230'>영암군</option>
								<option value='231'>완도군</option>
								<option value='232'>장성군</option>
								<option value='233'>장흥군</option>
								<option value='234'>진도군</option>
								<option value='235'>함평군</option>
								<option value='236'>해남군</option>
								<option value='237'>화순군</option>
						</select></th>
						<th style="width:500px; height:25px; margin-left: 5px;"><input type="submit" value="검색" style="padding: 4px 20px 4px 20px; margin-top:2px;"></th>
					</tr>
					<tr>
						<td style="text-align:left;"><input type="radio"><label>현재 운영중인 곳만 보기</label></td>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<div class="container">
		<div class="row" style="margin: 50px auto auto 180px;">
			<table class="table table-striped table-bordered table-hover"
				style="width: 1600px; text-align: center; border: 1px solid #000000; border-collapse: collapse;">
				<thead>
					<tr style="border: 1px solid #000000">
						<th style="text-align: center;">번호</th>
						<th style="text-align: center;">이름</th>
						<th style="text-align: center;">주소</th>
						<th style="text-align: center;">전화번호</th>
						<th style="text-align: center;">평일</th>
						<th style="text-align: center;">주말</th>
						<th style="text-align: center;">휴무</th>
						<th style="text-align: center;">즐겨찾기</th>
					</tr>
				</thead>
				<tbody>
					<%
					PzDAO pzDAO = new PzDAO();
					ArrayList<Pz> list = pzDAO.getList(pageNumber, "all");
					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=20 * (pageNumber - 1) + (index++)%></td>
						<td><%=list.get(i).getPz_name()%></td>
						<td><%=list.get(i).getPz_address()%></td>
						<td><%=list.get(i).getPz_phone()%></td>
						<td><%=list.get(i).getWd_time()%></td>
						<td><%=list.get(i).getWe_time()%></td>
						<td><%=list.get(i).getClosed()%></td>
						<td><input type="checkbox" names="favorites"
							onclick="CheckMark()"></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<%
			if (pageNumber != 1) {
			%>
			<a href="all.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arraw-left">이전</a>
			<%
			}
			if (pzDAO.nextPage(pageNumber + 1)) {
			%>
			<a href="all.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-left">다음</a>
			<%
			}
			%>
			<!--<input type="submit" class="btn btn-primary pull-right" value="신고" style="font-size:20px"> -->
		</div>
	</div>

	<!-- 자바스크립트 파일 외부 참조-->
	<script type="text/javascript" src="../JavaScript/area.js"></script>
</body>

</html>