<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>6_1_EL</title>
	<!-- 
		날짜 : 2021/09/06
		이름 : 박시현
		내용 : JSP 표현언어(Expression Language) 실습하기
	 -->
</head>
<body>
	<h3>1.표현언어</h3> 
	<%
		String name = "홍길동";
		int num1 = 1;
		int num2 = 2;
		
		// 표현언어로 출력하기 위해 JSP 내장객체로 저장. 연산도 가능.
		pageContext.setAttribute("name", name);
		request.setAttribute("num1", num1);
		session.setAttribute("num2", num2);
		
	%>
	
	<h4>표현식 출력</h4>
	<p>
		name : <%= name %><br/>
		num1 : <%= num1 %><br/>
		num2 : <%= num2 %><br/>
		num1 + num2 = <%= num1 + num2 %>
	</p>
	
	<h4>표현언어 출력</h4>
	<p>
		name : ${name}<br/>
		num1 : ${num1}<br/>
		num2 : ${num2}<br/>
		num1 + num2 = ${num1 + num2}
	</p>
	
</body>
</html>