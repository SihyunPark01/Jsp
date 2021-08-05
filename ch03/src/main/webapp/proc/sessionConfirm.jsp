<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sessionConfirm</title>
</head>
<body>
	<h3>현재 클라이언트 세션확인</h3>
	<%
		String sid = session.getId();	
		String uid = (String) session.getAttribute("uid"); //string과 object로 타입이 다르므로 (string)처리(Casting) 해주어야함 
		String pass = (String) session.getAttribute("pass");
	%>
	
	<p>
		클라이언트 세션아이디 : <%= sid %><br/>
		클라이언트 아이디 : <%= uid %><br/>
		클라이언트 비밀번호 : <%= pass %><br/>
	</p>
	
	<a href="../3_4_Session.jsp">로그인</a>	
		
</body>
</html>