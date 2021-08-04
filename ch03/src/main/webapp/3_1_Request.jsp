<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3_1_Request</title> <!-- 오늘수업의 하이라이트!!!!!!! 가장 중요!!!!! -->
	<!-- 
		날짜: 2021/08/04
		이름: 박시현
		내용: JSP request 내장객체 실습하기
		
		request 내장객체
		- 클라이언트의 요청 정보를 갖는 객체
		- 클라이언트의 전송 데이터(Parameter)를 수신하는 기능을 제공
		
		get 전송방식
		- 기본 데이터 전송방식
		- 서버에 페이지나 데이터를 요청하는 전송방식
		- 데이터 주소에 노출
		
		post 전송방식
		- 서버에 데이터를 전달하면서 처리를 요청하는 전송방식
		- 전송데이터를 요청메세지에 삽입해서 전송하므로 데이터 노출 안됨
		 	
	 -->
	
	
	
	
</head>
<body>
	<h3>1.JSP request 객체</h3>

	<h4> 로그인 </h4>
	<form action="./proc/loginProc.jsp" method="post"> <!-- 메소드는 전송방식, 기본방식은 method="get"으로,, 
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
	
	<h4>회원가입</h4>
	
	<form action="/ch03/proc/registerProc.jsp" method="get"> 
		<table border="1">
		
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"/>
			</tr>
			
			<tr>
				<td>성별</td>
				<td>
				<label><input type="radio" name="gender" value="1"/>남</label>
				<label><input type="radio" name="gender" value="2"/>여</label>
				</td>
			</tr>
			
			<tr>
				<td>취미</td>
				<td>
				<label><input type="checkbox" name="hobby" value="등산"/>등산하기</label>
				<label><input type="checkbox" name="hobby" value="독서"/>독서하기</label>
				<label><input type="checkbox" name="hobby" value="여행"/>여행하기</label>
				<label><input type="checkbox" name="hobby" value="운동"/>운동하기</label>
				<label><input type="checkbox" name="hobby" value="영화"/>영화보기</label>
				</td>
			</tr>
			
			<tr>
				<td>주소</td>
				<td>
					<select name="addr">
						<option value="서울">서울특별시</option>
						<option value="부산">부산광역시</option>
						<option value="대구">대구광역시</option>
						<option value="대전">대전광역시</option>
						<option value="광주">광주광역시</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="가입하기"/></td>
			</tr>
		</table>
	</form>
	
	
	
	
	
	
	
	
	
	
	
	



</body>
</html>