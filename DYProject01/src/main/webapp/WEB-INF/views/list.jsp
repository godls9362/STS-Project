<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>say cheese</title>
<link href="resources/css/blist.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="<c:url value='resources/js/jquery-1.12.3.js'/>"></script>
<script type="text/javascript" src="<c:url value='resources/js/jjscript.js'/>"></script>


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
		<h1 align="center" bgcolor="#5d5353" size="60" id="headline">
			<b>Free board</b>
		</h1>
		<form action="writeGO" method="get">
			<table border="1" align="center" id="mytable">
				<tr class="firsttr">
					<td id="Cno">NO</td>
					<td id="Ctitle">TITLE</td>
					<td id="Cwriter">WRITER</td>
					<td id="Cdate">DATE</td>
				</tr>
				<c:forEach var="m" items="${blist}">
					<tr id="secondtr">
						<td>${m.num}</td>
						<td><a href="goDetail?no=${m.no }">${m.title}</a></td>
						<td>${m.writer}</td>
						<td>${m.regtime}</td>
					</tr>
				</c:forEach>
			</table>
			
			<div>
				<input type="submit" name="submit" value="Write" class="first">
				<button type="button" onclick="location.href='MemberStart'" class="second">Back</button>
			</div>
		</form>
	</section>
	<footer>
		<div class="site">
			<!-- site:btmenuì copy ë¬¶ì´ì¤ -->
			<div class="btmenu">
				<ul class="btmenu2">
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

