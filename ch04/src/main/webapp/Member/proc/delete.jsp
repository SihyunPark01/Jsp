<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	
	//DB정보
	String host = "jdbc:mysql://54.180.160.240:3306/maro02260226";
	String user = "maro02260226";
	String pass = "1234";

	

	try{
		//1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		//2단계
		Connection conn = DriverManager.getConnection(host,user,pass);
		
		//3단계
		Statement stmt = conn.createStatement();
		
		//4단계
		String sql = "DELETE FROM `MEMBER` WHERE `uid`='"+uid+"';";
		stmt.executeUpdate(sql);
		
		//5단계 없음
		
		//6단계
		stmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

	//리다이렉트 시켜야지 삭제되고나서 다시 list페이지로 와야겠지?
	response.sendRedirect("../list.jsp");

%>
