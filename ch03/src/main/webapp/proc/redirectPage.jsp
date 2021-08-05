<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>redirectPage</title>
</head>
<body>
	<h1>리다이렉트 페이지 입니다.</h1>
	<%
		response.sendRedirect("../3_1_Request.jsp"); //이게 제일 중요함!!!!!!!!!!!!!!!!!
	
	
	%>

</body>
</html>