

/*메인홈페이지 랜덤 사진 출력하기*/
function showImage(){
	var imgArray = new Array();
	imgArray[0] = "Images/main_photo1.jpg";
	imgArray[1] = "Images/main_photo2.jpg";
	imgArray[2] = "Images/main_photo3.jpg";

	var imgNum = Math.round(Math.random()* (imgArray.length-1));
	var objImg = document.getElementById("introImg");
	objImg.src = imgArray[imgNum];
}

/*메인홈페이지 로그인되었을 때 랜덤 사진 출력하기*/
function afterlogin_showImage(){
	var imgArray = new Array();
	imgArray[0] = "../Images/main_photo1.jpg";
	imgArray[1] = "../Images/main_photo2.jpg";
	imgArray[2] = "../Images/main_photo3.jpg";

	var imgNum = Math.round(Math.random()* (imgArray.length-1));
	var objImg = document.getElementById("introImg");
	objImg.src = imgArray[imgNum];
}


/*탈퇴하기 버튼 눌렀을 때 alert발생하기*/
function Dropout_alert(){
	if(confirm("나도반함을 탈퇴하시겠습니까?") == true) {
		alert("탈퇴되었습니다.");
		location.replace("../main.html");
		/* DB에서도 삭제하는 코드 작성해야 함 */
	}
	else{
		alert("취소되었습니다.");
	}
}

/*로그아웃 버튼 눌렀을 때 alert발생하기*/
function Logout_alert(){
	if(confirm("로그아웃 하시겠습니까?")==true){
		alert("로그아웃 되었습니다.");
		location.replace("../main.html");
	}
	else{
		alert("취소되었습니다.");
	}
}

/*아이디 찾기버튼을 누르면 아이디 알려주는 창*/
function Notify_id(){
	window.open("../HTML/get_ID.html", "아이디확인","width=500, height=50"); /*DB랑 연결해서 DB에서 갖고 온 아이디를 새 창에 입력할 수 있도록! 새 창 주소는 get_ID로 했음*/
}

/*아이디찾기 버튼 - 아이디 확인 창 - 확인 누르면 해당 창 닫기*/
function get_ID_OK(){
	window.close();
	window.opener.location.href="../HTML/login.html";
}

/*비밀번호찾기 버튼 - alert발생*/
function Notify_pw(){
	alert("이메일 전송되었습니다.");
	location.replace("../HTML/login.html");
}

/*비밀번호 변경버튼 누르면 새로운 창 열리면서 비밀번호 변경할 수 있도록*/
function EditPW(){
	window.open("../HTML-LoginOK/edit_pw.html", "비밀번호 수정","width=500, height=600");
}

/*이메일 변경버튼 누르면 새로운 창 열리면서 이메일 변경할 수 있도록*/
function EditEmail(){
	window.open("../HTML-LoginOK/edit_email.html","이메일 수정","width=500, height=600");
}
