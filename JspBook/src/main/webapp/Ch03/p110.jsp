<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>선언문예제-메소드선언</title>
</head>
<body>
	<h2>선언문 예제 - 메소드 선언</h2>
	
	
	<%! //선언문 작성하여
	String id = "Kingdora";
	
	public String getID(){
		return id;
	}
	
	%>
	
	<!-- 실행출력문 표현식으로 -->
	id변수 : <%= id %> <br/>
	getID()메소드 실행결과 : <%= getID() %> 

</body>
</html>