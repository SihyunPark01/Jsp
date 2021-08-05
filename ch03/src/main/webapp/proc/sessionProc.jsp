<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sessionProc</title>
</head>
<body>
	<h3>사용자 정보 세션저장</h3>
	
	<%  //session에서 sessionProc으로 정보 제출
		
		request.setCharacterEncoding("UTF-8");	
	
		String uid = request.getParameter("uid");
		String pass = request.getParameter("pass");
	
		//사용자 정보 세션(Session Table) 저장
		session.setAttribute("uid", uid);
		session.setAttribute("pass", pass); //속성값을 지정해라
			
	%>
	<h4>세션 저장 완료!</h4>
	
	<a href="./sessionConfirm.jsp">세션 확인</a> <!-- ./은 현재디렉토리 -->

</body>
</html>