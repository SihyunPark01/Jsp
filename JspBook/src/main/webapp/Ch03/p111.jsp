<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>선언문과 스크립트릿에서 작성된 변수의 차이</title>
</head>
<body>
	<h2>선언문과 스크립트릿에서 선언된 변수의 차이점 확인</h2>
	
	<%! 
		String str1 = "선언문에서 선언한 변수"; //멤버변수
	%>
	
	<%	String str2 = "스크립트에서 선언된 변수"; //지역변수
	
	%>
	
	</body>
</html>