<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3_3_PageContext</title>
	<!-- 
		날짜: 2021/08/05
		이름: 박시현
		내용: JSP pageContext 내장객체 실습하기
		
		pageContext 내장객체
		 - JSP 페이지에 대해 1:1로 연결된 객체로 JSP 페이지당 하나의 pageContext 객체가 생성
		 - 주요 기능은 페이지의 흐름 제어(forward)에 사용
		 		
		
		forward 기능
		 - 시스템에서 페이지를 요청하는 pageContext 객체의 기능
		 - 최초 요청에 대한 주소가 반영  (cf. redirect는 최종 요청에 대한 주소가 반영)
	 -->
</head>

<body>
	<h3>3.PageContext 내장객체 실습</h3>

	<a href="./proc/forwardPage.jsp">포워드 페이지 요청</a>

</body>
</html>