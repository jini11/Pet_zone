<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>나도반함</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		
	    
		int result = userDAO.deleteUser((String)session.getAttribute("userID"));
		if(result == 0){
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('탈퇴되었습니다.')");
	        script.println("location.href = '../main.jsp'");
	        script.println("</script>");
		}else if(result == -1){
			PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('데이터베이스 오류가 발생했습니다.1')");
	        script.println("history.back()");
	        script.println("</script>");
		}
	%>
</body>
</html>