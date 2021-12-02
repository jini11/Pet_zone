<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="pz.PzDAO"%>
<%@ page import="pz.Pz"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta name="viewport" content="width=device-width", initial-scale="1"> -->
<!-- 웹 페이지와 외부 자원간의 관계를 정의, 주로 스타일시트(CSS)파일 링크에 사용됨. -->
<link rel="stylesheet" type="text/css" href="../CSS/table.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<title>나도반함-식당</title>
</head>

<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String area1 = "";
	String area2 = "";
	int pageNumber = 1;
	int index = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	if (request.getParameter("area1") != null) {
		area1 = request.getParameter("area1");
	}
	if (request.getParameter("area2") != null) {
		area2 = request.getParameter("area2");
	}
	%>
	<div class="wrapper">
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

	<!-- 상단 메뉴 사진 표시하는 부분 -->
	<div class="top_menu_photo">
		<a href="outdoors.jsp"> <img src="../Images/outdoors.png">
		</a>
		<p>OUTDOORS</p>
	</div>

		<div class="search">
		<div style="margin: 50px auto auto 180px;">
			<form name="select_area">
				<table class="area"
					style="width: 1100px; height: 80px; text-align: center; border: 1px solid #000000; border-collapse: collapse;">
					<thead>
						
							<th style="width: 500px;"><select name="area1" id="area1"
								onChange="change_area(this.value, area2)"
								style="width: 500px; height: 30px; margin-top: 5px;">
									<option>-선택-</option>
									<option value='1' <% if(area1.contains("서울특별시")) out.println("selected"); %>>서울특별시</option>
									<option value='2' <% if(area1.contains("부산광역시")) out.println("selected"); %>>부산광역시</option>
									<option value='3' <% if(area1.contains("대구광역시")) out.println("selected"); %>>대구광역시</option>
									<option value='4' <% if(area1.contains("인천광역시")) out.println("selected"); %>>인천광역시</option>
									<option value='5' <% if(area1.contains("광주광역시")) out.println("selected"); %>>광주광역시</option>
									<option value='6' <% if(area1.contains("대전광역시")) out.println("selected"); %>>대전광역시</option>
									<option value='7' <% if(area1.contains("울산광역시")) out.println("selected"); %>>울산광역시</option>
									<option value='8' <% if(area1.contains("세종특별자치시")) out.println("selected"); %>>세종특별자치시</option>
									<option value='9' <% if(area1.contains("강원도")) out.println("selected"); %>>강원도</option>
									<option value='10' <% if(area1.contains("경기도")) out.println("selected"); %>>경기도</option>
									<option value='11' <% if(area1.contains("경상남도")) out.println("selected"); %>>경상남도</option>
									<option value='12' <% if(area1.contains("경상북도")) out.println("selected"); %>>경상북도</option>
									<option value='13' <% if(area1.contains("전라남도")) out.println("selected"); %>>전라남도</option>
									<option value='14' <% if(area1.contains("전라북도")) out.println("selected"); %>>전라북도</option>
									<option value='15' <% if(area1.contains("제주특별자치도")) out.println("selected"); %>>제주특별자치도</option>
									<option value='16' <% if(area1.contains("충청남도")) out.println("selected"); %>>충청남도</option>
									<option value='17' <% if(area1.contains("충청북도")) out.println("selected"); %>>충청북도</option>
							</select></th>
							<th><select name="area2" id="area2"
								style="width: 500px; height: 30px; margin-top: 5px;">
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
							<th style="width: 500px; height: 25px; margin-left: 5px;">
								<button type="submit" style="padding: 4px 20px 4px 20px; margin-top: 2px;">검색</button>
								</th>
					</thead>
				</table>
			</form>
		</div>
	</div>

	<div class="container">
		<div class="row" style="margin: 50px auto auto 180px;">
			<table class="table table-striped table-bordered table-hover fz_table"
				style="width: 1600px; text-align: left; border-collapse: collapse; padding-bottom: 30px;">
				<thead>
					<tr>
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
					String[] arr = { "서울특별시", "부산광역시", "대구광역시", "인천광역시", "광주광역시", "대전광역시", "울산광역시", "세종특별자치시", "강원도", "경기도", "경상남도", "경상북도",
							"전라남도", "전라북도", "제주특별자치도", "충청남도", "충청북도" };
					String str = "";
					try {
						str = arr[Integer.parseInt(area1) - 1];
					} catch (Exception e) {
					}
					PzDAO pzDAO = new PzDAO();
					ArrayList<Pz> list = pzDAO.getList(pageNumber, "outdoors", str, area2);
					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=20 * (pageNumber - 1) + (index)%></td>
						<td><%=list.get(i).getPz_name()%></td>
						<td><%=list.get(i).getPz_address()%></td>
						<td><%=list.get(i).getPz_phone()%></td>
						<td><%=list.get(i).getWd_time()%></td>
						<td><%=list.get(i).getWe_time()%></td>
						<td><%=list.get(i).getClosed()%></td>
						<td><input type="checkbox" name="check" id=<%=index%>
							value=<%=index++%> onclick="CheckMark()" /></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<%
			if (pageNumber != 1) {
			%>
			<a href="outdoors.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arraw-left">이전</a>
			<%
			}
			if (pzDAO.nextPage(pageNumber + 1)) {
			%>
			<a href="outdoors.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-left">다음</a>
			<%
			}
			%>
			<!--<input type="submit" class="btn btn-primary pull-right" value="신고" style="font-size:20px"> -->
		</div>
	</div>
	</div>
	
	<!-- 푸터 영역 시작 -->
    <div class="footer footer_btn_have" style="height : 200px;">
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
    
	<!-- 자바스크립트 파일 외부 참조-->
	<script type="text/javascript" src="../JavaScript/area.js"></script>
	<script type="text/javascript" src="../JavaScript/common.js"></script>
</body>

</html>