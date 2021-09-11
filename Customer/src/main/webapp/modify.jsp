<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<body>

	<h3>고객수정</h3>
	<form action="/Customer/modify.do" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="custid" value="${customer.custid}" readonly/></td>
		</tr>
	
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="${customer.name}"/></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="address" value="${customer.address}"/></td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td><input type="text" name="phone" value="${customer.phone}"/></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="수정하기"/>
			</td>	
		</tr>
	
	</table>
</form>
	
</body>
</html>