<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>list</title>
</head>
<body>
	<h3>직원목록</h3>
	<a href="./register.jsp"> 고객등록 </a>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>직급</th>
			<th>부서</th>
			<th>입사일</th>
			<th>기타</th>
		</tr>
		<tr>
			<td>a101</td>
			<td>홍길동</td>
			<td>101-1231-4564</td>
			<td>사원</td>
			<td>영업1부</td>
			<td>2021-08-06</td>
			<td>
				<a href="./modify.jsp">수정</a>
				<a href="./proc/delete.jsp">삭제</a>
			</td>
		</tr>	
	</table>
	

</body>
</html>