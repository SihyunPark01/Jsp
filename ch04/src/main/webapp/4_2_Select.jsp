<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>4_2_Select.jsp</title>
</head>
<body>
	<h3>2.Jsp Select 실습하기</h3>
	
	<a href="./4_1_Insert.jsp">사용자 등록</a>
	
	
	<h4>사용자 목록</h4>
	<table border = "1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>관리</th>
		</tr>
		<tr>
			<td>A101</td>
			<td>홍길동</td>
			<td>010-1234-1234</td>
			<td>23</td>
			<td>
				<a href="#">수정</a>
				<a href="#">삭제</a>
			</td>
		</tr>
	</table>
</body>
</html>