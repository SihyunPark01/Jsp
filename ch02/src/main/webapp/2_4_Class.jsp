<%@page import="sub1.Account"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2_4_Class</title>
	<%--
		날짜: 2021/08/04
		이름: 박시현
		내용: JSP 클래스 실습하기
	--%>
</head>
<body>
	<h3>4.JSP 클래스 실습하기</h3>
	
	<%
		Account kb = new Account("국민은행","101-121-1111","김유신",10000);
		Account wr = new Account("우리은행","101-121-2222","김춘추",30000);
	
		kb.deposit(5000);
		kb.withdraw(8000);
		kb.show(out);
		
		wr.deposit(50000);
		wr.withdraw(7000);
		wr.show(out);
	%>
	
</body>
</html>