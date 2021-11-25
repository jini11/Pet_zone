<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>나도반함</title>
</head>
<body>
    <%
    	String userName = user.getUserName();
    	String userEmail = user.getUserEmail();
    	
    	if(userName == null || userEmail == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안 된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");    		 
		} else {
			UserDAO userDAO = new UserDAO();
            String userID = userDAO.findID(userName, userEmail);
            
            if(userID == null) {
                System.out.println("userID == NULL");
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('해당하는 아이디가 없습니다.')");
                script.println("history.back()");
                script.println("</script>");
            }
            else {
                System.out.println("userID != NULL");
                PrintWriter script = response.getWriter();
                script.println("<script>");
            	String foundID = "회원님의 아이디는 "+userID+"입니다.";
                script.println("alert('"+foundID+"')");
                script.println("location.href = 'JSP/login.jsp'");
                script.println("</script>");
            }
    	}  
    %>
</body>
</html> 