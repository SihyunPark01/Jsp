<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.User1Bean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

		//DB 정보
		String host = "jdbc:mysql://54.180.160.240:3306/maro02260226";
		String user = "maro02260226";
		String pass = "1234";

		List<User1Bean> users = new ArrayList<>(); //arraylist는 제네릭클래스임..제네릭변수가 뭔지 공부하자
		
		
	try{
		//1단계 JDBC 드라이버 로드
		Class.forName("com.mysql.jdbc.Driver");
		
		//2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		
		//3단계
		Statement stmt = conn.createStatement();
		
		
		//4단계
		String sql = "SELECT * FROM `user1`;"; //이거 ``로 해야돼 ''는 안돼!!!!!!!!!
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
			
			User1Bean ub = new User1Bean(); //ub에는 지금 데이터가 하나도 없지?
			ub.setUid(rs.getString(1));
			ub.setName(rs.getString(2));
			ub.setHp(rs.getString(3));
			ub.setAge(rs.getInt(4));
			
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
	<title>4_2_Select.jsp</title>
</head>
<body>
	<h3>2.Jsp Select 실습하기</h3>
	
	<a href="./4_1_Insert.jsp">사용자 등록</a>
	
	
	<h4>사용자 목록</h4>
	<table border = "1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>관리</th>
		</tr>
		
		<%
			for(User1Bean ub : users){
		%>
		
		<tr>
			<td><%= ub.getUid() %></td>
			<td><%= ub.getName() %></td>
			<td><%= ub.getHp() %></td>
			<td><%= ub.getAge() %></td>
			<td>
				<a href="#">수정</a>
				<a href="./4_3_Delete.jsp?uid=<%= ub.getUid() %>">삭제</a> <!-- 삭제할 아이디를 심어놓는 것임 -->
			</td>
		</tr>
		<%
			}
		
		%>
	</table>
</body>
</html>