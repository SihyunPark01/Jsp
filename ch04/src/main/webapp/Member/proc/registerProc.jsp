<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");	

	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String pos = request.getParameter("pos");
	String dep = request.getParameter("dep");



	
	//DB 정보
	String host = "jdbc:mysql://54.180.160.240:3306/maro02260226";
	String user = "maro02260226";
	String pass = "1234";

	try{
		//1단계 : JDBC드라이버 로드 - 탐캣 다운로드한거 적용시키는 듯...드라이버클래스 복붙하는거잖아~~
		Class.forName("com.mysql.jdbc.Driver");		
		
		//2단계 : 데이터베이스 접속 커넥션으로 시작해!!!!!!
		Connection conn = DriverManager.getConnection(host,user,pass);
		
		//3단계 : SQL 실행객체 생성 Statement로 시작해!!!!!
		Statement stmt = conn.createStatement();
		
		//4단계 : SQL문 실행 쿼리문에 맵핑시킴
		String sql = "INSERT INTO `MEMBER` VALUES ('"+uid+"','"+name+"','"+hp+"','"+pos+"',"+dep+", NOW());";
		stmt.executeUpdate(sql);
		
		//5단계 :이 단계는 select문만 적용!
		
		//6단계 
		stmt.close();
		conn.close();
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

	//리다이렉트
	response.sendRedirect("../list.jsp");


%>



