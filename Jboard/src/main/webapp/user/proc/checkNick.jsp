<%@page import="kr.co.jboard.db.Sql"%>
<%@page import="kr.co.jboard.db.DBConfig"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	
	//전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String nick = request.getParameter("nick");
	
	String host = "jdbc:mysql://54.180.160.240:3306/maro02260226";
	String user = "maro02260226";
	String pass = "1234";
	
	int result = 0; //그래야 출력문에서 result라는 변수가 에러가 안나지?
			
	
	try{
		//1~2단계
				Connection conn = DBConfig.getInstance().getConnection();
		//3단계
		
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_NICK);
		psmt.setString(1, nick);
		
		//4단계
		ResultSet rs = psmt.executeQuery();
		
		//5단계
		if(rs.next()){
			result = rs.getInt(1); //0 아니면 1밖에 안나오지? result를 json으로 출력
			
		}
				
		//6단계
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