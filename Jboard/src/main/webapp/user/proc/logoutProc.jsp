<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.invalidate(); //session에 있는 로그인정보 삭제
	
	//로그인 페이지로 이동(리다이렉트)
	response.sendRedirect("/Jboard/user/login.jsp?success=101");

%>