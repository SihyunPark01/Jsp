<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>


<%

	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	
	//DB 정보
		String host = "jdbc:mysql://54.180.160.240:3306/maro02260226";
		String user = "maro02260226";
		String pass = "1234";


	try{
		//1단계
		Class.forName("com.mysql.jdbc.Driver");
		//2단계
		Connection conn = DriverManager.getConnection(host,user,pass);
		//3단계
		Statement stmt = conn.createStatement(); //3단계까지는 그냥 그대로 외워라!
		
		//4단계
		String sql = "INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES('"+name+"','"+address+"','"+phone+"')";
		stmt.executeUpdate(sql);
		
		//5단계
		//6단계
		stmt.close();
		conn.close();
		
		
	}catch (Exception e){
		e.printStackTrace();
	}
	
	//리다이렉트
	response.sendRedirect("../list.jsp");



%>
