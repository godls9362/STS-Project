<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>register</title>
<link href="css/contactstyle.css" type="text/css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script language="javascript">
	function validate() {
		var re = /^[a-zA-Z0-9]{4,8}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
		var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		// 이메일이 적합한지 검사할 정규식

		var id = document.getElementById("uid");
		var pw = document.getElementById("upw");
		var email = document.getElementById("uemail");
		var num1 = document.getElementById("unum1");
		var num2 = document.getElementById("unum2");

		// ------------ 이메일 까지 -----------

		if (!check(re, id,
				"Id must be 4 to 8 English or combination of letters and numbers")) {
			return false;
		}
		if (!check(re, pw,
				"Password must be 4 to 8 English or combination of letters and numbers")) {
			return false;
		}

		if (join.pwd.value != join.checkupw.value) {
			alert("Password is incorrect :(");
			join.checkupw.value = "";
			join.checkupw.focus();
			return false;
		}

		if (email.value == "") {
			alert("Fill in your email address :(");
			email.focus();
			return false;
		}

		if (!check(re2, email, "Your email address is not valid :(")) {
			return false;
		}

		if (join.name.value == "") {
			alert("Wait, What's your name again?");
			join.name.focus();
			return false;
		}

		// 관심분야, 자기소개 미입력시 하라는 메시지 출력
		if (join.interest[0].checked == false
				&& join.interest[1].checked == false
				&& join.interest[2].checked == false
				&& join.interest[3].checked == false) {
			alert("Choose your interest :)");
			return false;
		}

		if (join.introduction.value == "") {
			alert("We are sorry,But We want to hear your story :)");
			join.introduction.focus();
			return false;
		}
		return true;
		alret("회원가입이 완료되었습니다.");

	}
	function check(re, what, message) {
		if (re.test(what.value)) {
			return true;
		}
		alert(message);
		what.value = "";
		what.focus();
	}
	function check1() {
		id = $("#uid").val();

		$.ajax({
			url : 'ID_Check',
			type : 'POST',
			dataType : 'text', //서버로부터 내가 받는 데이터의 타입
			contentType : 'text/plain; charset=utf-8;',//내가 서버로 보내는 데이터의 타입
			data : id,

			success : function(data) {
				console.log(data);
				if (data == -1) {
					console.log("아이디 없음");
					alert("This ID belongs to you :^) ");
				} else {
					console.log("아이디 있음");
					alert("I'm sorry,This ID has been occupied :^( ");
				}
			},
			error : function() {
				alert("에러");
			}
		});

	}
</script>
</head>
<body>
	<form name="join" onsubmit="return validate();" id="myForm"
		method="post" action="insertRegi">
		<br>
		<table border="0" align="center">
			<tr>
				<td colspan="2" align="center" bgcolor="#5d5353"><b>We Are
						So Glad You're here!</b></td>
			</tr>

			<tr>
				<td align="center"><b>ID:</td>
				<td><input type="text" name="id" id="uid" size="20"
					maxlength="12"></input>
					<button id="duplicate_check" type="button" onclick="check1();">Duplicate
						Check ID</button></td>
			</tr>

			<tr>
				<td align="center"><b>Password:</td>
				<td><input type="password" name="pwd" id="upw" size="21"
					maxlength="12"></input>&nbsp4 to 8 English or combination of
					letters and numbers</td>
			</tr>

			<tr>
				<td align="center"><b>Check Password:</td>
				<td><input type="password" id="checkupw" size="21"
					maxlength="12"></td>
			</tr>

			<tr>
				<td align="center"><b>E-mail:</td>
				<td><input type="text" name="email" id="uemail" size="25"></input>&nbspex)
					id@domain.com</td>
			</tr>

			<tr>
				<td align="center"><b>Name:</td>
				<td><input type="text" name="name" id="uname" size="25"></input></td>
			</tr>

			<tr>
				<td colspan="2" align="center" bgcolor="#5d5353"><b>We Want
						To Know You More!</b></td>
			</tr>

			<tr>
				<td align="center"><b>Interest:</td>
				<td><input type="checkbox" name="interest" value="1">Longboard</input>
					<input type="checkbox" name="interest" value="2">Penny(Cruiser)</input>
					<input type="checkbox" name="interest" value="3">Skateboard</input>
					<input type="checkbox" name="interest" value="4">Etc</input></td>
			</tr>
			<tr>
				<td align="center"><b>introduction</td>
				<td><textarea rows="5" cols="80" name="introduction"></textarea></td>
			</tr>
		</table>
		<br> <br>

		<p align="center">

			<input type="submit" name="submit" value="Register"></input> <input
				type="reset" name="reset" value="Cancel"></input>
		</p>
	</form>
</body>

</html>
