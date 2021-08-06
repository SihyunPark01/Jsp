<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.User3Bean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<% //2단계 수정페이지를 열었을 때 수정데이터가 있어야하니까

	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");

	//DB 정보
	String host = "jdbc:mysql://54.180.160.240:3306/maro02260226";
	String user = "maro02260226";
	String pass = "1234";


	User3Bean ub = new User3Bean();
	try{
	//1단계
	Class.forName("com.mysql.jdbc.Driver");
	
	//2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	//3단계
	Statement stmt = conn.createStatement();
	
	//4단계
	String sql = "SELECT * FROM `MEMBER` WHERE `uid`='"+uid+"';";
	ResultSet rs = stmt.executeQuery(sql);
	
	//5단계 1개의 자료만 나올것이므로 while문을 쓸 필요가 없음
	
	if(rs.next()){
		
		ub.setUid(rs.getString(1));
		ub.setName(rs.getString(2));
		ub.setHp(rs.getString(3));
		ub.setPos(rs.getString(4));
		ub.setDep(rs.getInt(5));
		ub.setRdate(rs.getString(6));
		
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
	<title>modify</title>
</head>
<body>
	<h3>직원수정</h3>
	
	<form action="./proc/modifyProc.jsp" method="post">
		
	<table border="1">
		
		
		<tr>
			<td>아이디</td>
			<td><input type="text" name="uid" value="<%= ub.getUid() %>"/></td>
		</tr>
		
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%= ub.getName() %>"/></td>
		</tr>
		
		<tr>
			<td>휴대폰</td>
			<td><input type="text" name="hp" value="<%= ub.getHp() %>"/></td>
		</tr>
		
		<tr>
			<td>직급</td>
			<td>
				<select name = "pos" ">
					<option>사원</option>
					<option>대리</option>
					<option>과장</option>
					<option>차장</option>
					<option>부장</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>부서</td>
			<td>
				<select name="dep" ">
					<option value="101">영업1부</option>
					<option value="101">영업2부</option>
					<option value="101">영업3부</option>
					<option value="101">영업지원부</option>
					<option value="101">인사부</option>
				</select>
			</td>	
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