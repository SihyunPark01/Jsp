  
<%@page import="kr.co.jboard.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String seq     = request.getParameter("seq");
	String title   = request.getParameter("title");
	String content = request.getParameter("content");
	ArticleDao.getInstance().updateArticle(title, content, seq);
	
	response.sendRedirect("/Jboard/view.jsp?seq="+seq);
%>