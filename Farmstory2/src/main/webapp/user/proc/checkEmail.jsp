<%@page import="kr.co.farmstory2.db.Sql"%>
<%@page import="kr.co.farmstory2.db.DBConfig"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	
	int result = 0;
	
	try{
		Connection conn = DBConfig.getInstance().getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_EMAIL);
		psmt.setString(1, email);
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			result = rs.getInt(1);
		}
				
		rs.close();
		psmt.close();
		conn.close();
	
	}catch(Exception e){
		e.printStackTrace();		
	}
	
	//Json 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	out.print(json);
%>