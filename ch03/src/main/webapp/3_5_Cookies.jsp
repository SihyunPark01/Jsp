<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3_5_Cookies</title>
	<%--
		날짜: 2021/08/05
		이름: 박시현
		내용: JSP Cookie 내장객체 실습하기
		
		Cookie
		 - 클라이언트와 서버간의 식별을 위해 사용되는 조각파일
		 - 쿠키는 서버에서 생성하고 클라이언트에 저장함
		 - 클라이언트는 전송된 쿠키를 보관, 해당 서버로 다시 요청할 때 보관된 쿠키를 같이 전송함
	--%>
</head>
<body>

	<h3>5.Cookie 실습하기</h3>	
	<form action="./proc/cookieProc.jsp" method="post"> <!-- 메소드는 전송방식, 기본방식은 method="get"으로,, 
	비번같은 노출되면 안되는 정보는 method="post"로! get같은 경우는 주소에 노출되므로 post를 써야함 단 post는 한글이 깨짐..-->
		<table border = "1">
			
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"/></td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw"/></td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="로그인"/> 
				</td>
			</tr>
			
		</table>
	</form>


</body>
</html>