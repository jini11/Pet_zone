<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fv.FvDAO" %>
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
        FvDAO fvDAO = new FvDAO();
        String pz_id = request.getParameterValues("pzid")[0];
        int result = fvDAO.deleteFavorites((String)session.getAttribute("userID"), pz_id);
        if(result == 1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('삭제되었습니다.')");
            script.println("location.href='JSP-LoginOk/bookmark.jsp'");
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