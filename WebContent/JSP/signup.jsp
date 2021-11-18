<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width", initial-scale="1">
	<!-- 웹 페이지와 외부 자원간의 관계를 정의, 주로 스타일시트(CSS)파일 링크에 사용됨. -->
	<link rel="stylesheet" type="text/css" href="../CSS/signup.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<title>회원가입</title>

</head>
<body>
    <section class="signup-form">
      <h1>Sign Up</h1> 
      <form action="../signupAction.jsp" method="post">  <!--연동하기 (예를 들어, signup.php로 함), method는 post방식과 get방식 중 하나-->
          <div class="int-area">
            <input id="name" type="text" name="userName" autocomplete="off" required> 
            <label for="name"> 이름 </label> <!--이름만 눌러도 입력창 활성화-->
          </div>
          <div class="int-area">
            <input id="id" type="text" name="userID" autocomplete="off" required> 
            <label for="id"> 아이디 </label> <!--이름만 눌러도 입력창 활성화-->
          </div>
          <div class="int-area"> 
            <input id="pwd" type="password" name="userPassword" autocomplete="off" required> 
            <label for="pwd"> 비밀번호  </label> <!--이름만 눌러도 입력창 활성화-->
          </div>
          <div class="int-area">
            <input id="email" type="email" name="userEmail" autocomplete="off" required> 
            <label for="email"> 이메일  </label> <!--이메일만 눌러도 입력창 활성화-->
          </div>
          <div>
            <span> <br>개인정보 수집 및 이용 동의 <br> </span>
            <input type="checkbox" value="개인정보" >
            <label>개인정보 수집 항목 : 이름, 아이디, 비밀번호, 이메일</label>
          </div>
          <div class="btn-area">
            <button type="submit" style="font-family:'Jua', sans-serif;">회원가입하기</button>
          </div>
          <div class="caption">
            <div class="caption">
                    <a href="../main.jsp">홈&nbsp; |</a>
                    <a href="login.jsp">&nbsp;로그인&nbsp; </a>
                </div>
              </div>
      </form>
    </section>
  
    <script>
      let name=$('#name');
          let id = $('#id');
          let pwd = $('#pwd');
          let email = $('#email');
          let btn = $('#btn');
      
          $(btn).on('click', function(){
              if($(id).val() == ""){
                  $(id).next('label').addClass('warning');
                  setTimeout(function(){
                      $('label').removeClass('warning');
                  },1500);
              }
              else if($(pwd).val() == ""){
                  $(pwd).next('label').addClass('warning');
                  setTimeout(function(){
                      $('label').removeClass('warning');
                  },1500);
              }
          });
  
  
      </script>
  </body>
  </html>
  