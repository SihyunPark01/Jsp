
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.rmi.ConnectIOException"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String hp = request.getParameter("hp");
	
	
	//DB정보
	String host = "jdbc:mysql://54.180.160.240:3306/maro02260226";
	String user = "maro02260226";
	String pass = "1234";

	int result = 0;
	
	try{
		
		//1단계
		Class.forName("com.mysql.jdbc.Driver");		
		
		//2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
				
		//3단계
		String sql = "SELECT COUNT(`hp`) FROM `Jboard_member` WHERE `hp`=?;";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, hp);
		
		//4단계
		ResultSet rs = psmt.executeQuery();
		
		//5단계
		if(rs.next()){
			result = rs.getInt(1);
		}
		//6단계
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
		
		//json 출력
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		out.print(json);

%>