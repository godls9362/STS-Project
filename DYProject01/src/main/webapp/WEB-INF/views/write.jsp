<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>say cheese</title>
<link href="resources/css/write.css" type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="<c:url value='resources/js/jjscript.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='resources/js/jquery-1.12.3.js'/>"></script>
<script language="javascript">
	function valiboard() {
		if (Freeboard.title.value == "") {
			alert("Fill in your title  :(")
			Freeboard.title.focus();
			return false;
		}

		if (Freeboard.content.value == "") {
			alert("Fill in your content :(");
			Freeboard.content.focus();
			return false;
		}

		if (confirm("Are you sure to save it?")) {
			alert("Completed!")
			return true;
		} else {
			alert("Canceled!");

			return false;

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
		<form name="Freeboard" onsubmit="return valiboard();" method="post"
			id="modal_up" action="savePost">
			<br>
			<table border="1" align="center">
				<tr class="uptitle">
					<td class="bigtd">NO</td>
					<td><input type=hidden name=no value=${seq }>${seq }</td>
				</tr>
				<tr class="uptitle">
					<td class="bigtd">TITLE</td>
					<td align="left"><input type="text" class="upbody"
						placeholder="(40자이내)제목을 입력해주세요." name=title size=100></td>
				</tr>
				<tr class="uptitle">
					<td class="bigtd">WRITER</td>
					<td><input type=hidden name=writer value=${login.id }>${login.id }</td>
				</tr>
				<tr class="uptitle">
					<td align="center" class="bigtd">CONTENT</td>
					<td class="upbody"><textarea rows="8" cols="100"
							placeholder="(100자이내)내용을 입력해주세요." class="upbody" name=content
							id=content></textarea></td>
				</tr>

			</table>
			<div>
				<input type="submit" name="submit" value="Submit" class="btn"></input>
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

