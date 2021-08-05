<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>cookieProc</title>
</head>
<body>
	<h3>쿠키생성 및 쿠키 전송</h3>
	<%	//Cookies에 있는 forms내용들을 cookieProc으로 전송
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		//쿠키 생성(쿠키는 내장객체가 아님) (서버에서 만들어서 클라이언트로 전송해줄것)
		Cookie c1 = new Cookie("uid",id);
		Cookie c2 = new Cookie("pass",pw);
		
		//쿠키 전송
		response.addCookie(c1);
		response.addCookie(c2);
	%>
	
	<h4>클라이언트에게 쿠키 전송완료!</h4>
	
	<a href="./cookieConfirm.jsp">클라이언트에서 서버로 다시 쿠키 전송하기</a>
	
	

</body>
</html>