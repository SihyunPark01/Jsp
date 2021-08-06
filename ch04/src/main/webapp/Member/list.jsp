<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.User3Bean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%

		request.setCharacterEncoding("utf-8");
		
		//DB 정보
		String host = "jdbc:mysql://54.180.160.240:3306/maro02260226";
		String user = "maro02260226";
		String pass = "1234";

		List<User3Bean> users = new ArrayList<>(); 
			

	try{
		//1단계
		Class.forName("com.mysql.jdbc.Driver");
			
		//2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		//3단계
		Statement stmt = conn.createStatement(); 
		
		//4단계 : SQL문 작성
		String sql = "SELECT * FROM `MEMBER`;";
		ResultSet rs = stmt.executeQuery(sql);
		
		//5단계 왜냐면 이게 반복되어야 하거든?
		while(rs.next()){
			
			User3Bean ub = new User3Bean();
			ub.setUid(rs.getString(1));
			ub.setName(rs.getString(2));
			ub.setHp(rs.getString(3));
			ub.setPos(rs.getString(4));
			ub.setDep(rs.getInt(5));
			ub.setRdate(rs.getString(6));
			
		users.add(ub);	
			
		}
				
		//6단계
		rs.close();
		stmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}


%>



<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>list</title>
</head>
<body>
	<h3>직원목록</h3>
	<a href="./register.jsp"> 직원등록 </a>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>직급</th>
			<th>부서</th>
			<th>입사일</th>
			<th>기타</th>
		</tr>
		
		
		<%	for(User3Bean ub : users){		%>
		<tr>
			<td><%= ub.getUid() %></td>
			<td><%= ub.getName() %></td>
			<td><%= ub.getHp() %></td>
			<td><%= ub.getPos() %></td>
			<td><%= ub.getDep() %></td>
			<td><%= ub.getRdate().substring(2, 10) %></td>
			<td>
				<a href="./modify.jsp?uid=<%= ub.getUid() %>">수정</a>
				<a href="./proc/delete.jsp?uid=<%= ub.getUid() %>">삭제</a>
			</td>
		</tr>	
		<%
		}
		%>
	
	</table>
	

</body>
</html>