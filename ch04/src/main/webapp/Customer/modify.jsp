<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.User2Bean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<% //2단계 수정페이지를 열었을 때 수정데이터가 있어야하니까

	request.setCharacterEncoding("UTF-8");
	String custid = request.getParameter("custid");

	//DB 정보
	String host = "jdbc:mysql://54.180.160.240:3306/maro02260226";
	String user = "maro02260226";
	String pass = "1234";


	User2Bean ub = new User2Bean();
	try{
	//1단계
	Class.forName("com.mysql.jdbc.Driver");
	
	//2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	//3단계
	Statement stmt = conn.createStatement();
	
	//4단계
	String sql = "SELECT * FROM `Customer` WHERE `custid`='"+custid+"';";
	ResultSet rs = stmt.executeQuery(sql);
	
	//5단계 1개의 자료만 나올것이므로 while문을 쓸 필요가 없음
	
	if(rs.next()){
		
		ub.setCustid(rs.getInt(1));
		ub.setName(rs.getString(2));
		ub.setAddress(rs.getString(3));
		ub.setPhone(rs.getString(4));
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
	<h3>고객수정</h3>
	
	<form action="./proc/modifyProc.jsp" method="post">
		
	<table border="1">
	
		<tr>
			<td>아이디</td>
			<td><input type="text" name="custid" value="<%= ub.getCustid() %>"/></td>
		</tr>
	
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%= ub.getName() %>"/></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="address" value="<%= ub.getAddress() %>"/></td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td><input type="text" name="phone" value="<%= ub.getPhone() %>"/></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="등록하기"/>
			</td>	
		</tr>
	
	</table>
</form>

</body>
</html>