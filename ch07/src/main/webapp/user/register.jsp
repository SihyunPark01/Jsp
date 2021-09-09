<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>register</title>
</head>
<body>

	<h4>User 등록</h4>
	<form action="/ch07/user/register.do" method="post">
		
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="uid"/></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"/></td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td><input type="text" name="hp"/></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="age"/></td>
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