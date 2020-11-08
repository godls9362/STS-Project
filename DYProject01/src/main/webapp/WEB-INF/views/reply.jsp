<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>say cheese</title>
<link href="resources/css/write.css" type="text/css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script language="javascript">
	function insertBoardReply() {
		if (boardForm.title.value == "") {
			alert("Fill in your title  :(")
			boardForm.title.focus();
			return false;
		}

		if (boardForm.content.value == "") {
			alert("Fill in your content :(");
			boardForm.content.focus();
			return false;
		}

		var yn = confirm("게시글을 등록하시겠습니까?");
		if (yn) {

			$.ajax({

				url : "insertBoardReply",
				data : $('[name=boardForm]').serialize(),
				dataType : "JSON",
				type : "post",
				success : function(data) {
					if (data == 1) {
						alert("saved it ;) !");
						window.location.replace('GoFBoard');
					}
				},
				error : function(status, error) {
					alert(error);
				}

			});

		} else {
			alert("X");
			window.location.replace('GoFBoard');
		}
	}
</script>
</head>

<body>
	<!--==== ìì´ì´íë ì ì¼ìª½ ìì ====-->
	<header>
		<div class="top">
			<!-- top:logoì menu ë¬¶ì´ì¤ -->
			<div class="logo">
				<a href="MemberStart"><img src="resources/img/logo.png"
					alt="ë¡ê³ "></a>
			</div>
			<nav class="menu">
				<ul class="navi">
					<li><a href="#">About us</a>
						<ul class="submenu">
							<li><a href="#">Hello!</a></li>
							<li><a href="#">News</a></li>
							<li><a href="#">Our space</a></li>
						</ul></li>
					<li><a href="#">Programs</a>
						<ul class="submenu">
							<li><a href="#">Why Skateboarding?</a></li>
							<li><a href="#">Schedule</a></li>
							<li><a href="#">the rookie of the month</a></li>
						</ul></li>
					<li><a href="#">Booking</a>
						<ul class="submenu">
							<li><a href="#">Booking</a></li>
							<li><a href="#">Confirm</a></li>
							<li><a href="#">Cancelation</a></li>
						</ul></li>
					<li><a href="#">Community</a>
						<ul class="submenu">
							<li><a href="#">Notice</a></li>
							<li><a href="GoReview?name=${login.name }">Review</a></li>
							<li><a href="GoFBoard?name=${login.name }">Free board</a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
		<!-- top ë -->
	</header>
	<!--==== ìì´ì´íë ì ì¼ìª½ ë ====-->

	<!--==== ìì´ì´íë ì ì¤ë¥¸ìª½ ìì ====-->
	<section>

		<h2 align="center" size=50 class="headline">
			<b>Create Post</b>
		</h2>
		<form name="boardForm" method="post" id="modal_up"
			onsubmit="return insertBoardReply();">
			<input type=hidden name=no value=${seq }> <input type=hidden
				name=originNo value=${originNo }> <input type=hidden
				name=writer value=${login.id }> <br>
				<input type=hidden name=orgroupLayer value=${orgroupLayer }>
				<input type=hidden name=ortitle value=${ortitle }>
				<input type=hidden name=groupord value=${groupord }>
			<table border="1" align="center">
				<tr class="uptitle">
					<td class="bigtd">NO</td>
					<td>${seq }</td>
				</tr>
				<tr class="uptitle">
					<td class="bigtd">TITLE</td>
					<td align="left"><input type="text" class="upbody"
						placeholder="(40자이내)제목을 입력해주세요." value="RE:" name=title size=100></td>
				</tr>
				<tr class="uptitle">
					<td class="bigtd">WRITER</td>
					<td>${login.id }</td>
				</tr>
				<tr class="uptitle">
					<td align="center" class="bigtd">CONTENT</td>
					<td class="upbody"><textarea rows="8" cols="100"
							placeholder="(100자이내)내용을 입력해주세요." class="upbody" name=content
							id=content></textarea></td>
				</tr>


			</table>
			<div>
				<input type="button" name="Submit" class="btn" value="submit" onclick="insertBoardReply();">
				<button type="button" onclick="location.href='GoFBoard'"
					class="btn2">Cancel</button>

			</div>
		</form>
	</section>
	<footer>
		<div class="site">
			<!-- site:btmenuì copy ë¬¶ì´ì¤ -->
			<div class="btmenu">
				<ul>
					<li><a href="#">HOME</a></li>
					<li><a href="#">CAREER</a></li>
					<li><a href="#">LOCATION</a></li>
				</ul>
			</div>
			<div class="copy">COPYRIGHT Â© by Doyoon Kim. ALL RIGHTS
				RESERVED</div>
		</div>
		<!-- site ë -->
	</footer>
	<!--==== ìì´ì´íë ì ì¤ë¥¸ìª½ ë ====-->

</body>
</html>

