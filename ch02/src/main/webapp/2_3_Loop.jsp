<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2_3_Loop</title>
	
	<%--
		날짜: 2021/08/04
		이름: 박시현
		내용: JSP 반복문 실습하기	
		
		자바문법에서 스크립트릿이 어떻게 활용되는지 확인하는 중.
	--%>
	
</head>
<body>
	<h3>3.JSP 반복문 실습하기</h3>

	<h4> for </h4>
	<%
		for(int i=1;i<=5;i++){
			out.print("<h4>i :" +i+ "</h4>");
		}
	%>	
	
	<h4> while </h4>
	<%
		int k = 1;
		while(k<=5){
	%>
		<p>k : <%= k %> </p>
	<%
		k++;
		}
	%>	
		

	<h4> 구구단표 </h4>
	<table border = "1">
		<tr>
			<th>2단</th>
			<th>3단</th>
			<th>4단</th>
			<th>5단</th>
			<th>6단</th>
			<th>7단</th>
			<th>8단</th>
			<th>9단</th>
		</tr>
		
		
		<% for(int x=1;x<=9;x++){ %>
		<tr>
		
			<% for(int y=2;y<=9;y++){ %>
			<td><%= y %> x <%= x %> = <%= y*x %></td>
			<% } %>	
			
		</tr>
		<% } %>
	
	
	
	
	</table>


</body>
</html>