<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	try{
		
		request.setCharacterEncoding("utf-8");
		String uid = request.getParameter("uid");
		String name = request.getParameter("name");
		String hp = request.getParameter("hp");
		String pos = request.getParameter("pos");
		String dep = request.getParameter("dep");
		
		
		//DB정보
		String host = "jdbc:mysql://54.180.160.240:3306/maro02260226";
		String user = "maro02260226";
		String pass = "1234";

		//1단계
		Class.forName("com.mysql.jdbc.Driver");
		//2단계			
		Connection conn = DriverManager.getConnection(host, user, pass);
		//3단계			
		Statement stmt = conn.createStatement();
		//4단계
		String sql = "UPDATE `MEMBER` SET ";
			sql += "`name`='"+name+"',";
		   	sql += "`hp`='"+hp+"',";
		   	sql += "`pos`='"+pos+"' ";
		   	sql += "`dep`='"+dep+"' ";
		   	sql += "WHERE `uid`='"+uid+"';";
		
		
		
		//5단계			
		//6단계			
	}catch(Exception e){
		e.printStackTrace();
	}

	
	response.sendRedirect("../list.jsp");



%>



	
