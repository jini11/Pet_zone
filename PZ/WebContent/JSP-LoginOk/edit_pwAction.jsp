<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>나도반함</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		String oldPw = request.getParameter("userPassword");
		String newPw = request.getParameter("edit_pw");
	
	    int result = userDAO.check_pw((String)session.getAttribute("userID"), oldPw);
	    if(result ==1){
	    	int result2 = userDAO.update_pw((String)session.getAttribute("userID"), newPw);
	    	if(result2 == 0){
	    		session.setAttribute("userPassword", newPw);
	    		PrintWriter script = response.getWriter();
	            script.println("<script>");
	            script.println("alert('비밀번호가 정상적으로 변경되었습니다.')");
	            script.println("window.close()");
	            script.println("opener.location.reload()");
	            script.println("</script>");
	    	}else if(result2 == -1){
	    		PrintWriter script = response.getWriter();
	            script.println("<script>");
	            script.println("alert('데이터베이스 오류가 발생했습니다.1')");
	            script.println("history.back()");
	            script.println("</script>");
	    	}
	    }else if(result == 0) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('현재 비밀번호가 틀립니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else if(result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('존재하지 않는 아이디입니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else if(result == -2) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('데이터베이스 오류가 발생했습니다.')");
            script.println("history.back()");
            script.println("</script>");
        } 

	%>
</body>
</html>