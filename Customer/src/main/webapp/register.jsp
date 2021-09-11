<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
</head>
<body>
	<h3>고객등록</h3>
	
	<form action="/Customer/register.do" method="post">
		
	<table border="1">
		
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"/></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="address"/></td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td><input type="text" name="phone"/></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="등록하기"/>
			</td>	
		</tr>
	
	</table>
</form>
</body>
</html>