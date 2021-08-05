<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");



	//DB 정보
	String host = "jdbc:mysql://54.180.160.240:3306/maro02260226";
	String user = "maro02260226";
	String pass = "1234";


	try{// 예외처리로 실행하는군....
	//1단계 - JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver"); //Driver.class우버튼 복사해서 ""에 붙여넣기
	
	//2단계 - 데이터베이스 접속
	Connection conn= DriverManager.getConnection(host,user,pass);
	//java.sql.connection 인터페이스 선언해야함

		
	//3단계 - SQL 실행객체 생성
	Statement stmt = conn.createStatement();
		
	//4단계 - SQL 실행 --------쿼리문에 맵핑시킴
	String sql = "INSERT INTO `user1` VALUES ('"+uid+"','"+name+"','"+hp+"',"+age+");"; //나이는 숫자라 ''처리 안함
	stmt.executeUpdate(sql); //실행문
	
	//5단계 - 결과처리(SELECT일 경우만 수행)
	//insert문이라 할 필요 없음	건너뜀
	
	
	//6단계 - 데이터베이스 종료
	stmt.close();
	conn.close();	
		
	
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//리다이렉트
	response.sendRedirect("../4_2_Select.jsp");
	
	
%>
