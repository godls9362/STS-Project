<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>Home</title>
	<script type="text/javascript">
	$('#test').data("reno")
	
	</script>
</head>
<body>
<h1 data-reno="3" id="test">
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
