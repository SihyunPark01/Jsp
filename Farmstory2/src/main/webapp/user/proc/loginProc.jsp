<%@page import="kr.co.farmstory2.dao.MemberDao"%>
<%@page import="kr.co.farmstory2.bean.MemberBean"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	MemberBean mb = MemberDao.getInstance().selectMember(uid, pass);
	
	if(mb != null){
		//회원이 맞을 경우
		session.setAttribute("sessMember", mb);
		response.sendRedirect("/Farmstory2");
		
	}else{
		//회원이 아닐 경우
		response.sendRedirect("/Farmstory2/user/login.jsp?success=100");
	}

%>
