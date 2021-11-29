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
      <form name="form" action="../signupAction.jsp">  <!--연동하기 (예를 들어, signup.php로 함), method는 post방식과 get방식 중 하나-->
          <div class="int-area">
            <input id="name" type="text" name="userName" autocomplete="off" required> 
            <label for="name"> 이름 </label> <!--이름만 눌러도 입력창 활성화-->
          </div>
          <div class="int-area">
            <input id="id" type="text" name="userID" autocomplete="off" required> 
            <label for="id"> 아이디 </label> <!--아이디만 눌러도 입력창 활성화-->
          </div>
          <div class="int-area"> 
            <input id="pwd" type="password" name="userPassword" autocomplete="off" required> 
            <label for="pwd"> 비밀번호  </label> <!--비밀번호만 눌러도 입력창 활성화-->
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
            <button type="submit" style="font-family:'Jua', sans-serif;" onclick="sign_up_chk()">회원가입하기</button>
          </div>
          <div class="caption">
            <div class="caption">
                    <a href="../main.jsp">홈&nbsp; |</a>
                    <a href="login.jsp">&nbsp;로그인&nbsp; </a>
                </div>
              </div>
      </form>
    </section>
  
    <script type="text/javascript">	
    function sign_up_chk(){
    	  var sign_up_name = document.getElementById("name").value;
    	  var sign_up_id = document.getElementById("id").value;
    	  var sign_up_pw = document.getElementById("pwd").value;
    	  var sign_up_email = document.getElementById("email").value;

    	  var pattern_chk1 = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
    	  var pattern_chk2 = /[0-9]/;
    	  var pattern_chk3 = /[a-zA-Z]/;
    	  var pattern_chk4 = /[~!@#$%^&*()_+|<>?:{}]/;

    	  /* 이름 체크 */
    	  if (sign_up_name.search(/\s/) != -1) {
    	  	location.replace("signup.jsp");
    	    alert("이름에 공백은 들어갈 수 없습니다.");
    	    return false; //exit 기능. return만 사용하면 null을 반환.
    	  }
    	  else if (pattern_chk1.test(sign_up_name)) {
    	    alert("이름에 특수문자는 들어갈 수 없습니다.");
    	    return false; //exit 기능. return만 사용하면 null을 반환.
    	  }

    	  /* 아이디 유효성 체크 */
    	  else if (sign_up_id.length == 0) {
    	    alert("아이디를 입력해 주십시오.");
    	    return false;//exit 기능. return만 사용하면 null을 반환.
    	  }
    	  else if (sign_up_id.search(/\s/) != -1) {//아이디 공백체크
    	    alert("아이디에 공백은 들어갈 수 없습니다.");
    	    return false;//exit 기능. return만 사용하면 null을 반환.
    	  }
    	  else if (pattern_chk1.test(sign_up_id)) { //아이디 특수문자 체크
    	    alert("아이디에 특수문자는 들어갈 수 없습니다.");
    	    return false;//exit 기능. return만 사용하면 null을 반환.
    	  }

    	  /* 비밀번호 유효성 체크 */
    		else if (!pattern_chk2.test(sign_up_pw) || !pattern_chk3.test(sign_up_pw) || !pattern_chk4.test(sign_up_pw) || sign_up_pw.length <8) {
    			alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");
    			return false;//exit 기능. return만 사용하면 null을 반환.
    		}

    	  /* 이메일 체크 */
    		else if (sign_up_email.length == 0) {
    			alert("이메일을 입력하세요.");
    			return false;//exit 기능. return만 사용하면 null을 반환.
    		}

    		else{
                location.href="../signupAction.jsp";
            }
    		}

    	}
    </script>
  </body>
  </html>
  