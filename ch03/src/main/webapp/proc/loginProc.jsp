<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginProc</title>
</head>
<body>
	<h3> 전송 파라미터 수신</h3> <!-- Request에서 보내온거 받아야지!!1 -->
	<%
	
		//전송데이터 인코딩 설정
		request.setCharacterEncoding("UTF-8"); //post방식은 한글깨지니까 인코딩설정이 필요. 그냥 무조건 한다고 생각해.	
	
		//데이터수신 굉장히 중요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		String uid = request.getParameter("uid"); //특히 이거 굉장히 많이씀 (데이터 수신하는 기능)
		String pass = request.getParameter("pass"); //특히 이거 굉장히 많이씀 (데이터 수신하는 기능)
	
	%>
	
	<p>
		아이디 : <%= uid %><br/>
		비밀번호 : <%= pass %><br/>
	</p>
	
	<a href="../3_1_Request.jsp">뒤로가기</a>
	
</body>
</html>