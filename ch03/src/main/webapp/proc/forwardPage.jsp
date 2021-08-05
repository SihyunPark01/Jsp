<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>forwardPage</title>
</head>
<body>
	<h1>포워드 페이지 입니다.</h1>
	
	<%
		pageContext.forward("../3_1_Request.jsp");	
	%>


</body>
</html>