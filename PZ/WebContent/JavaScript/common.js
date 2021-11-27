

/*메인홈페이지 랜덤 사진 출력하기*/
function showImage() {
	var imgArray = new Array();
	imgArray[0] = "Images/main_photo1.jpg";
	imgArray[1] = "Images/main_photo2.jpg";
	imgArray[2] = "Images/main_photo3.jpg";

	var imgNum = Math.round(Math.random() * (imgArray.length - 1));
	var objImg = document.getElementById("introImg");
	objImg.src = imgArray[imgNum];
}

/*메인홈페이지 로그인되었을 때 랜덤 사진 출력하기*/
function afterlogin_showImage() {
	var imgArray = new Array();
	imgArray[0] = "../Images/main_photo1.jpg";
	imgArray[1] = "../Images/main_photo2.jpg";
	imgArray[2] = "../Images/main_photo3.jpg";

	var imgNum = Math.round(Math.random() * (imgArray.length - 1));
	var objImg = document.getElementById("introImg");
	objImg.src = imgArray[imgNum];
}


/*탈퇴하기 버튼 눌렀을 때 alert발생하기*/
function Dropout_alert() {
	if (confirm("나도반함을 탈퇴하시겠습니까?") == true) {
		alert("탈퇴되었습니다.");
		location.replace("../main.jsp");
		/* DB에서도 삭제하는 코드 작성해야 함 */
	}
	else {
		alert("취소되었습니다.");
	}
}

/*로그아웃 버튼 눌렀을 때 alert발생하기*/
function Logout_alert() {
	if (confirm("로그아웃 하시겠습니까?") == true) {
		alert("로그아웃 되었습니다.");
		location.replace("../main.jsp");
	}
	else {
		alert("취소되었습니다.");
	}
}

/*아이디 찾기버튼을 누르면 아이디 알려주는 창*/
function Notify_id() {
	window.open("../JSP/get_ID.jsp", "아이디확인", "width=500, height=50"); /*DB랑 연결해서 DB에서 갖고 온 아이디를 새 창에 입력할 수 있도록! 새 창 주소는 get_ID로 했음*/
}

/*아이디찾기 버튼 - 아이디 확인 창 - 확인 누르면 해당 창 닫기*/
function get_ID_OK() {
	window.close();
	window.opener.location.href = "../JSP/login.jsp";
}


/*비밀번호 변경버튼 누르면 새로운 창 열리면서 비밀번호 변경할 수 있도록*/
function EditPW() {
	window.open("../JSP-LoginOk/edit_pw.jsp", "비밀번호 수정", "width=500, height=600");
}

/*이메일 변경버튼 누르면 새로운 창 열리면서 이메일 변경할 수 있도록*/
function EditEmail() {
	window.open("../JSP-LoginOk/edit_email.jsp", "이메일 수정", "width=500, height=600");
}


/* =======================회원가입 유효성 검사====================================*/
function sign_up_chk() {
	var sign_up_name = document.getElementById("name").value;
	var sign_up_id = document.getElementById("id").value;
	var sign_up_pw = document.getElementById("pwd").value;
	var sign_up_email = document.getElementById("email").value;

	var pattern_chk1 = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	var pattern_chk2 = /[0-9]/;
	var pattern_chk3 = /[a-zA-Z]/;
	var pattern_chk4 = /[~!@#$%^&*()_+|<>?:{}]/;

	/* 이름 체크 */
	if (sign_up_name.length == 0) {
		alert("이름을 입력해 주십시오.");
		return;//exit 기능. return만 사용하면 null을 반환.
	}
	else if (sign_up_name.search(/\s/) != -1) {
		alert("이름에 공백은 들어갈 수 없습니다.");
		location.replace("../JSP/signup.jsp");
		return;//exit 기능. return만 사용하면 null을 반환.
	}
	else if (pattern_chk1.test(sign_up_name)) {
		alert("이름에 특수문자는 들어갈 수 없습니다.");
		location.replace("../JSP/signup.jsp");
		return;//exit 기능. return만 사용하면 null을 반환.
	}

	/* 아이디 유효성 체크 */
	if (sign_up_id.length == 0) {
		alert("아이디를 입력해 주십시오.");
		location.replace("../JSP/signup.jsp");
		return;//exit 기능. return만 사용하면 null을 반환.
	}
	else if (sign_up_id.search(/\s/) != -1) {//아이디 공백체크
		alert("아이디에 공백은 들어갈 수 없습니다.");
		location.replace("../JSP/signup.jsp");
		return;//exit 기능. return만 사용하면 null을 반환.
	}
	else if (pattern_chk1.test(sign_up_id)) { //아이디 특수문자 체크
		alert("아이디에 특수문자는 들어갈 수 없습니다.");
		location.replace("../JSP/signup.jsp");
		return;//exit 기능. return만 사용하면 null을 반환.
	}

	/* 비밀번호 유효성 체크 */
	else if (!pattern_chk2.test(sign_up_pw) || !pattern_chk3.test(sign_up_pw) || !pattern_chk4.test(sign_up_pw) || sign_up_pw.length < 8) {
		alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");
		location.replace("../JSP/signup.jsp");
		return;//exit 기능. return만 사용하면 null을 반환.
	}

	/* 이메일 체크 */
	else if (sign_up_email.length == 0) {
		alert("이메일을 입력하세요.");
		location.replace("../JSP/signup.jsp");
		return;//exit 기능. return만 사용하면 null을 반환.
	}
}

/*=================아이디 찾기 - 유효성 체크 : 여기는 해당 아이디가 없다는 alert로 출력됨=======================*/
function findID_chk() {
	var findInfo_name = document.getElementById("name").value;
	var findInfo_email = document.getElementById("email").value;
	var pattern_chk1 = /[`~!@#$%^&*|\\\'\";:\/?]/gi; //특수문자 체크
	var pattern_chk2 = /[0-9]/; // 숫자체크
	var pattern_chk3 = /[a-zA-Z]/; // 문자체크

	/* 이름 체크 */
	if (findInfo_name.length == 0) {
		alert("이름을 입력해 주십시오.");
		return;//exit 기능. return만 사용하면 null을 반환.
	}
	else if (findInfo_name.search(/\s/) != -1) {
		alert("이름에 공백은 들어갈 수 없습니다.");
		location.replace("../JSP/findID.jsp");
		return;//exit 기능. return만 사용하면 null을 반환.
	}
	else if (pattern_chk1.test(findInfo_name)) {
		alert("이름에 특수문자는 들어갈 수 없습니다.");
		location.replace("../JSP/findID.jsp");
		return;//exit 기능. return만 사용하면 null을 반환.
	}

	/* 이메일 체크 ----- 여기는 자체적으로 유효성처리가 됨!*/
	else if (findInfo_email.length == 0) {
		alert("이메일을 입력해 주십시오.");
		location.replace("../JSP/findID.jsp");
		return;//exit 기능. return만 사용하면 null을 반환.
	}
	else if (findInfo_email.search(/\s/) != -1) {
		alert("이메일에 공백은 들어갈 수 없습니다.");
		location.replace("../JSP/findID.jsp");
		return;//exit 기능. return만 사용하면 null을 반환.
	}

}

/*==================================비밀번호 찾기 - 유효성 체크 : 여기는 해당 비밀번호가 없다는 alert로 출력됨==================================*/
function findPW_chk() {
	var findInfo_name = document.getElementById("name").value;
	var findInfo_id = document.getElementById("id").value;
	var findInfo_email = document.getElementById("email").value;
	var pattern_chk1 = /[`~!@#$%^&*|\\\'\";:\/?]/gi; //특수문자 체크
	var pattern_chk2 = /[0-9]/; // 숫자체크
	var pattern_chk3 = /[a-zA-Z]/; // 문자체크

	/* 이름 체크 */
	if (findInfo_name.length == 0) {
		alert("이름을 입력해 주십시오.");
		return;//exit 기능. return만 사용하면 null을 반환.
	}
	else if (findInfo_name.search(/\s/) != -1) {
		alert("이름에 공백은 들어갈 수 없습니다.");
		location.replace("../JSP/findPW.jsp");
		return;//exit 기능. return만 사용하면 null을 반환.
	}
	else if (pattern_chk1.test(findInfo_name)) {
		alert("이름에 특수문자는 들어갈 수 없습니다.");
		location.replace("../JSP/findPW.jsp");
		return;//exit 기능. return만 사용하면 null을 반환.
	}

	/* 아이디 유효성 체크 */
	else if (findInfo_id.length == 0) {
		alert("아이디를 입력해 주십시오.");
		location.replace("../JSP/findPW.jsp");
		return;//exit 기능. return만 사용하면 null을 반환.
	}
	else if (findInfo_id.search(/\s/) != -1 || pattern_chk1.test(findInfo_id)) {
		//아이디 공백, 특수문자, 체크
		alert("아이디에는 공백, 특수문자가 들어갈 수 없습니다.");
		location.replace("../JSP/findPW.jsp");
		return;//exit 기능. return만 사용하면 null을 반환.
	}

	else if (findInfo_email.length == 0) {
		alert("이메일을 입력해 주십시오.");
		return;//exit 기능. return만 사용하면 null을 반환.
	}
	else if (findInfo_email.search(/\s/) != -1) {
		alert("이메일에 공백은 들어갈 수 없습니다.");
		location.replace("../JSP/findPW.jsp");
		return;//exit 기능. return만 사용하면 null을 반환.
	}
}

/*즐겨찾기 체크박스 눌렀을 때 반응 */
function CheckMark() {
	if ($("input:checkbox[name=check]").is(":checked") == true) {
		if (confirm("즐겨찾기에 추가하시겠습니까?") == true) {
			alert("즐겨찾기에 추가되었습니다.");
			const checked = document.querySelectorAll('input[name="check"]:checked');
			this.form.submit();
			this.checked = true;
		}
		else {
			alert("취소되었습니다.");
			const checked = document.querySelectorAll('input[name="check"]:checked');
			this.checked = false;
			this.form.submit();
		}
	}
	else if ($("input:checkbox[name=check]").is(":checked") == false) {
		if(confirm("즐겨찾기 취소하시겠습니까?") == true) {
			alert("즐겨찾기가 취소되었습니다.");
			const checked = document.querySelectorAll('input[name="check"]:checked');
			this.form.submit();
			this.checked = true;
		}
		else {
			alert("작업이 취소되었습니다.");
			this.form.submit();
			this.checked = false;
		}
	}
}
