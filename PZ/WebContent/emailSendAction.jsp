
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.Address" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Authenticator" %>
<%@ page import="java.util.Properties" %>
<%@ page import="user.UserDAO"%>
<%@ page import="util.Gmail"%>
<%@ page import="java.io.PrintWriter"%>


<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userEmail" />

	<%
	UserDAO userDAO = new UserDAO();
	
    String result = userDAO.getUserEmail(user.getUserID(), user.getUserEmail());
    if(result == null){
    	PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('입력 오류가 발생했습니다.')");
	    script.println("history.back()");
	    script.println("</script>");
    }else{
		String host = "smtp.gmail.com";
		String from = "lje8213@gmail.com";
		String to = result;
		String subject = "[나도반함] - 비밀번호 찾기 관련 이메일 인증";
		System.out.println("11111");
		String password_result = userDAO.getUserPassword(user.getUserID());
		
	   if(password_result==null){
	   		PrintWriter script = response.getWriter();
		    script.println("<script>");
		    script.println("alert('오류가 발생했습니다.')");
		    script.println("history.back()");
		    script.println("</script>");
	   }else{
		   	String star_pw = userDAO.fourcutPw(password_result);
		   	String text = "비밀번호는 "+star_pw+ " 입니다."; /*동빈나 9강 - 18:12*/
		   	System.out.println("333333");
		   	
		   	Properties props = new Properties();
		   	props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		       props.put("mail.smtp.starttls.enable", "true");
		       props.put("mail.smtp.host", host); 	
		       props.put("mail.smtp.port", 587); 
		       props.put("mail.smtp.auth", "true"); 
		       
			try{
				Authenticator auth = new Gmail();
				Session ses = Session.getInstance(props,auth);
				ses.setDebug(true);
				
				MimeMessage message = new MimeMessage(ses);
				
				message.setFrom(new InternetAddress(from));
				message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
				
				message.setSubject(subject);
				message.setText(text);
				
				Transport.send(message);
				
				PrintWriter script = response.getWriter();
		        script.println("<script>");
		        script.println("alert('이메일로 전송해드렸습니다.')");
		        script.println("location.href = 'JSP/login.jsp'");
		        script.println("</script>");
			}catch(Exception e){
				e.printStackTrace();  /*동빈나 9강 - 20:34*/
			}
		}
    }
	
%>
