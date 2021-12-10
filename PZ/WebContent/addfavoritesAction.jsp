<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pz.PzDAO" %>
<%@ page import="fv.FvDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="pz" class="pz.Pz" scope="page" />
<jsp:setProperty name="pz" property="pz_id"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나도반함</title>
</head>
<body>
	<%
	   PrintWriter script = response.getWriter();
	   ArrayList<String> list = (ArrayList)session.getAttribute("pztr");
	   String pz_id = request.getParameterValues("pzid")[0];
	   
	   FvDAO fvDAO = new FvDAO();
	   int result = fvDAO.checkFavorites((String)session.getAttribute("userID"), pz_id);
	   
	   if(result == 0){ // addfavorites추가해야함
		   int result1 = fvDAO.addFavorites((String)session.getAttribute("userID"), pz_id);
           script.println("<script>");
           script.println("alert('즐겨찾기에 추가되었습니다.')");
           script.println("history.back()");
           script.println("</script>");
       }else if(result ==1){
           script.println("<script>");
           script.println("alert('이미 추가된 장소입니다.')");
           script.println("history.back()");
           script.println("</script>");
       }else if(result == -2){
           script.println("<script>");
           script.println("alert('데이터베이스 오류가 발생하였습니다.')");
           script.println("history.back()");
           script.println("</script>");
       }
	   
	  
	%>
</body>
</html>

