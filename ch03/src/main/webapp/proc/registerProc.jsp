<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>registerProc</title>
</head>
<body>
	<h3>회원가입 데이터 수신하기</h3>
	<%
	
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String[] hobbies = request.getParameterValues("hobby"); ////////값이 여러개일땐 배열 활용하면됨~~!!! getParameterValues!!
	String addr = request.getParameter("addr");

		
	%>
	
	<p>
		이름 : <%= name %><br/>
		성별 : <%= (gender.equals("1")) ? "남자" : "여자" %><br/>  <!-- 문자열비교는 .equals() -->
		취미 : <!-- 배열이기때문에 for확장문써야 여러개 값이 나옴 -->
		<% 
			for(String hobby : hobbies){
				out.print(hobby+"/ ");
			}
		%>
		<br/>
		
		주소 : <%= addr %><br/>
	
	</p>
	
	<a href="/ch03/3_1_Request.jsp">뒤로가기</a>	

</body>
</html>