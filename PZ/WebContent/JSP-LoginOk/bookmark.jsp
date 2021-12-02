<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="fv.FvDAO" %>
<%@ page import="fv.Fv" %>
<%@ page import="pz.PzDAO" %>
<%@ page import="pz.Pz" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- <meta name="viewport" content="width=device-width", initial-scale="1"> -->
	<!-- 웹 페이지와 외부 자원간의 관계를 정의, 주로 스타일시트(CSS)파일 링크에 사용됨. -->
	<link rel="stylesheet" type="text/css" href="../CSS/table.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<title>나도반함</title>
</head>

<body onload="showImage()">
<%
	request.setCharacterEncoding("UTF-8");
	int pageNumber = 1;
	int index = 1;
	if (request.getParameter("pageNumber") != null)
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
%>
<div class="wrapper">
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
	
	<%
   		UserDAO userDAO = new UserDAO();
  		ArrayList<User> list = userDAO.mypage_set((String)session.getAttribute("userID"),(String)session.getAttribute("userPassword"));
  		for(int i=0;i<list.size();i++) {
   %>
	
	<!-- 상단 메뉴 사진 표시하는 부분 -->
	<div class="top_menu_photo">
		<a href="bookmark.jsp"> <img
			src="../Images/bookmark.png" style="width : 100px;">
		</a>
		<p><%= list.get(i).getUserName() %>님의 즐겨찾기</p>
	</div>
	<%
	}
	%>
	
	<div class="container">
		<div class="row" style="margin: 50px auto auto 180px;">
			<table class="table table-striped table-bordered table-hover fz_table"
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
						<th style="text-align: center;">수정</th>
					</tr>
				</thead>
				<tbody>
				<%
					FvDAO fvDAO = new FvDAO();
					PzDAO pzDAO = new PzDAO();
					ArrayList<Fv> li = fvDAO.getList((String)session.getAttribute("userID"));
					
					for (int i = 0; i < li.size(); i++) {
						ArrayList<Pz> li2 = pzDAO.getPzList(li.get(i).getPz_id());
						for(int j=0;j<li2.size();j++) {
				%>
					<tr>
						<td><%= 20 * (pageNumber - 1) + index %></td> 
						<!-- <td name="pz_id"><%= li.get(i).getPz_id() %></td> -->
						<td name="pz_name"><%= li2.get(j).getPz_name() %></td>
						<td name="pz_address"><%= li2.get(j).getPz_address() %></td>
						<td name="pz_phone"><%= li2.get(j).getPz_phone() %></td>
						<td name="wd_time"><%= li2.get(j).getWd_time() %></td>
						<td name="we_time"><%= li2.get(j).getWe_time() %></td>
						<td name="closed"><%= li2.get(j).getClosed() %></td>
						
						<td>
                            <form action="../deleteFavoritesAction.jsp" onsubmit="return CheckDelete()">
                                <input type="hidden" name="pzid" value="<%= li.get(i).getPz_id() %>">
                                <input type="submit" value="삭제" name="subbtn">
                            </form>
                        </td>
					</tr>
					<%
						}
					index++;
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
	</div>
	
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
	<script type="text/javascript" src="../JavaScript/common.js?ver=1"></script>
</body>

</html>