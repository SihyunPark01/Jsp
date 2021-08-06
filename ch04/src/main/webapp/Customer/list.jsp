<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.User2Bean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>



<%

		//DB 정보
		String host = "jdbc:mysql://54.180.160.240:3306/maro02260226";
		String user = "maro02260226";
		String pass = "1234";

		List<User2Bean> users = new ArrayList<>(); 
		
		
	try{
		//1단계 JDBC 드라이버 로드
		Class.forName("com.mysql.jdbc.Driver");
		
		//2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		//3단계
		Statement stmt = conn.createStatement();
		
		//4단계
		String sql = "SELECT * FROM `Customer`;"; 
/*****/	ResultSet rs = stmt.executeQuery(sql); //insert문은 executeUpdate로 실행하고 select문은 executeQuery로 실행해야 함.
		//rs라는 객체에다 디비데이터 하나하나객체를 담았음 ///설명 카톡에!		

		//5단계(결과셋 처리(select일 경우))
		while(rs.next()){
		
			//1라운드	 DB user1에 있는 첫번째 레코드(객체)의 각각의 컬럼을 담음		
			/* 
			String uid = ;
			String name = ;
			String hp = ;
			int age = ; 
			*/
			
			User2Bean ub = new User2Bean(); //ub에는 지금 데이터가 하나도 없지?
			ub.setCustid(rs.getInt(1));
			ub.setName(rs.getString(2));
			ub.setAddress(rs.getString(3));
			ub.setPhone(rs.getString(4));
			
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
	<h3>고객목록</h3>
	<a href="./register.jsp"> 고객등록 </a>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>주소</th>
			<th>휴대폰</th>
			<th>기타</th>
		</tr>
		
		<%
			for(User2Bean ub : users){
		%>
			
		<tr>
			<td><%= ub.getCustid() %></td>
			<td><%= ub.getName() %></td>
			<td><%= ub.getAddress() %></td>
			<td><%= ub.getPhone() %></td>
			<td>
				<a href="./modify.jsp?custid=<%= ub.getCustid() %>">수정</a>
				<a href="./proc/delete.jsp?custid=<%= ub.getCustid() %>">삭제</a>
			</td>
		</tr>
		<%
			}
		
		%>
	
	</table>
	

</body>
</html>