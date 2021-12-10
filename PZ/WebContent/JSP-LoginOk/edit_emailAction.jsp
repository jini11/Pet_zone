<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userEmail" />

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>나도반함</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		String new_email = request.getParameter("edit_email");
		
		int result = userDAO.update_email((String)session.getAttribute("userID"), new_email);
		if(result == 0){
			session.setAttribute("userEmail", new_email);
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이메일이 정상적으로 변경되었습니다.')");
            script.println("window.close()");
            script.println("opener.location.reload()");
            script.println("</script>");
		}else if(result == -1){
    		PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('데이터베이스 오류가 발생했습니다.')");
            script.println("history.back()");
            script.println("</script>");
    	}
	%>
</body>
</html>

