<!-- 1단계 수정하려면 수정페이지를 일단 열어야하잖아 -->



<%@page import="bean.User1Bean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% //2단계 수정페이지를 열었을 때 수정데이터가 있어야하니까

	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");

	//DB 정보
	String host = "jdbc:mysql://54.180.160.240:3306/maro02260226";
	String user = "maro02260226";
	String pass = "1234";


	User1Bean ub = new User1Bean();
	try{
	//1단계
	Class.forName("com.mysql.jdbc.Driver");
	
	//2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	//3단계
	Statement stmt = conn.createStatement();
	
	//4단계
	String sql = "SELECT * FROM `user1` WHERE `uid`='"+uid+"';";
	ResultSet rs = stmt.executeQuery(sql);
	
	//5단계 1개의 자료만 나올것이므로 while문을 쓸 필요가 없음
	
	if(rs.next()){
		
		ub.setUid(rs.getString(1));
		ub.setName(rs.getString(2));
		ub.setHp(rs.getString(3));
		ub.setAge(rs.getInt(4));
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
	<title>4_4_Update</title>
</head>
<body>
	<h3>1.Jsp Update 실습하기</h3>
	
	<h4>User 수정</h4>
	<form action="./proc/updateProc.jsp" method="post">
		
	<table border="1">
		<tr>
			<td>아이디</td>					<!-- 아이디는 보통 수정못하니까 readonly써서 수정못하게 막는 거임 -->
			<td><input type="text" name="uid" readonly value="<%= ub.getUid() %>"/></td>   <!-- ub생성자를 try문 밖에다 선언해야함 -->
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%= ub.getName()%>"/></td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td><input type="text" name="hp" value="<%= ub.getHp() %>" /></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="age" value="<%= ub.getAge() %>" /></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="수정하기"/>
			</td>	
		</tr>
	
	</table>
</form>


</body>
</html>