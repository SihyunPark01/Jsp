<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>표현식예제</title>
</head>
<body>
	<h2>표현식 예제 - 배열원소 출력</h2>
<%
	//배열의 초기화 블럭- 배열의 선언, 메모리 할당, 초기값 설정을 한 번에 함.
	String[] str = {"JSP","JAVA","Android","HTML5"};
%>
	<table>
		<tr><th>배열의 첨자번호<th>배열요소의 값
		<% for(int i=0; i<str.length; i++){%>
			<tr><td><%=i %><td><%=str[i]%>
		<%} %>
	</table>
	
	
	<h2> 표현식예제 - 기본데이터타입 및 레퍼런스타입출력</h2>
	
	<% 
	//기본 데이터 타입의 출력
	int x = 10;
	int y = (x>10) ? 20 : x;
	out.println("y변수의 내용 : " + y + "<br>");
	
	//레퍼런스 타입의 출력
	StringBuffer sf = new StringBuffer("Unicorn");
	sf.reverse();
	out.println("객체의 내용 : " + sf.toString());
	%>
	
	</body>
</html>