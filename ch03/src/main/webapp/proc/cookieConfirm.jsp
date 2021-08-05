<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>cookieConfirm</title>
</head>
<body>
	<h3>클라이언트에서 전송된 쿠키 확인</h3>
	<%
		Cookie[] cookies = request.getCookies(); //cookies복수형을 보면 알 수 있듯이 여러개의 배열임
	
		for(Cookie cookie : cookies){
	%>	
		<p> 
			쿠키명 : <%= cookie.getName() %><br/>
			쿠키값 : <%= cookie.getValue() %><br/>
		
		</p>
			
	<% 		
		}
	%>
</body>
</html>