<%@page
	import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>say cheese</title>
<link href="resources/css/write_temp.css" type="text/css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script language="javascript">
	function deletecon() {
		no = $("#uno").val();
		originNo = $("#uoriginNo").val();
		groupLayer = $("#ugroupLayer").val();
		if (confirm("Are you sure to delete it?")) {
			$.ajax({
				type : "POST",
				url : "goDelete",
				mode : 'cors',
				data : {
					"oNo" : no
				},
				dataType : 'json',
				success : function(data) {
					if (data == 1) {
						alert("Completed.");
						window.location.replace('GoFBoard');
					} else {
						alert("Canceled.");
					}
				},
				error : function(request, status, error) {
					alert(status);
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
			<b>View Post</b>
		</h2>
		<form name="Freeboard" method="post" id="modal_up" action="goUPpage">
			<input type="hidden" id=uoriginNo name=uoriginNo
				value="${vo.originNo}"> <input type="hidden" id=ugroupLayer
				name=ugroupLayer value="${vo.groupLayer}"> <br>
			<table border="1" align="center" id="mytable">
				<tr class="uptitle">
					<td class="bigtd">Write.NO</td>
					<td><input type="hidden" id=uno name=no value="${vo.no}">${vo.no}</td>
				</tr>
				<tr class="uptitle">
					<td class="bigtd">TITLE</td>
					<td align="center">${vo.title }</td>
				</tr>
				<tr class="uptitle">
					<td class="bigtd">WRITER</td>
					<td>${vo.nickname } </td>
				</tr>
				<tr class="uptitle">
					<td align="center" class="bigtd">CONTENT</td>
					<td><textarea id="textArea" rows="5" cols="10" readonly>${vo.content }</textarea></td>
				</tr>
			</table>
			<div>
				<button type="button"
					onclick="location.href='Goreply?originNo=${vo.originNo}&title=${vo.title }&grouplayer=${vo.groupLayer }&groupord=${vo.groupOrd }'"
					class="btn2">Reply</button>
				<button type="button" class="btn2"
					onclick="location.href='GoFBoard'">Cancel</button>
				<c:if test="${login.id eq vo.writer}">
					<input type="submit" name="update" value="update" class="btn2">
					<button type="button" onclick="deletecon();" class="btn2">Delete</button>
				</c:if>
			</div>
		</form>
		<div class="container">
			<label for="content" align="left" id="headliner"> <b>Comment</b>
			</label>

			<form name="commentInsertForm" method="post" id="modal_upss"
				action="goUPpage">
				<br>
				<table border="0" align="center" id="mytables">
					<tr class="uptitle">
						<td colspan="2"><input type="hidden" name=Bno
							value="${vo.no}" /> <input type="hidden" id=uno name=Cwriter
							value="${login.id}"> <textarea id="textArea"
								placeholder=" Leave your comment ;) !" rows="3" cols="30"
								name="Ccontent"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" name="commentInsertBtn"
							class="btn3" value="Save"></td>
					</tr>
				</table>
			</form>
			<div class="container">
				<div class="commentList"></div>
			</div>
		</div>
		<%@ include file="./comment.jsp"%>
	</section>

</body>
</html>


