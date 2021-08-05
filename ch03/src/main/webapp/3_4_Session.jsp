<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3_4_Session</title>
	<!-- 
		날짜: 2021/08/05
		이름: 박시현
		내용: JSP Session 내장객체 실습하기
		
		session 내장객체
		 - 최초 요청에서부터 마지막 요청까지의 전체 시간
		 - 클라이언트에서 서버로 요청할 때 서버에 기록되는 클라이언트 정보 테이블(Session Table)
		 - 서버는 각 클라이언트에 대한 고유번호(Session ID)를 부여함
	
	-->
	
</head>
<body>
	<h4> 4. Session 내장객체 실습하기 </h4>
	<form action="./proc/sessionProc.jsp" method="post"> <!-- 메소드는 전송방식, 기본방식은 method="get"으로,, 
	비번같은 노출되면 안되는 정보는 method="post"로! get같은 경우는 주소에 노출되므로 post를 써야함 단 post는 한글이 깨짐..-->
		<table border = "1">
			
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid"/></td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"/></td>
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