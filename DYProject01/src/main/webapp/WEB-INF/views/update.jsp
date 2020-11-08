<%@page
	import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>say cheese</title>
<link href="resources/css/write_temp.css" type="text/css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script language="javascript">
	function updatecon() {
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
		if (confirm("Are you sure to update it?")) {
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
				<a href="MemberStart"><img src="resources/img/logo.png" alt="ë¡ê³ "></a>
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
			<b>Update Post</b>
		</h2>
		<form name="Freeboard" method="post" id="modal_up" action="doUpdate"
		onsubmit="return updatecon();">
			<br>
			<table border="1" align="center" id="mytable">
				<tr class="uptitle">
					<td class="bigtd">Write.NO</td>
					<td><input type="hidden" id=uno name=no value="${vo.no}">${vo.no}</td>
				</tr>
				<tr class="uptitle">
					<td class="bigtd">TITLE</td>
					<td align="left"><input type="text" id=title name=title
						placeholder="(40자이내)수정가능 ${vo.title}" size="120"></td>
				</tr>
				<tr class="uptitle">
					<td class="bigtd">WRITER</td>
					<td><input type="hidden" id=writer name=writer
						value="${vo.writer}">${vo.writer}</td>
				</tr>
				<tr class="uptitle">
					<td align="center" class="bigtd">CONTENT</td>
					<td><textarea id="textArea" placeholder="()수정가능 ${vo.content }"  name=content rows="5" cols="90"></textarea></td>
				</tr>
			</table>
			<div>
				<input type="submit" name="update" value="update" class="btn2" /> <button type="button" onclick="location.href='GoFBoard'" class="btn2">Cancel</button>
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

