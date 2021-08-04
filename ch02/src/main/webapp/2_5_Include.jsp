<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2_5 Include</title>
	<%--
		날짜: 2021/08/04
		이름: 박시현
		내용: JSP Include 지시자 실습하기
	--%>
</head>
<body>
	<h3>5.JSP Include 지시자</h3>
	
	<%@ include file="./inc/_header.jsp" %> 
	
	<main>
		<h1> 메인 영역 입니다. </h1> <!-- 여기 컨텐츠가 보통 들어가고 -->
	</main>
	
 	<%@ include file="./inc/_footer.jsp" %>
 	 
</body>
</html>