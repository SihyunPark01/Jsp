<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	String uri = request.getParameter("uri");
	
	ArticleDao.getInstance().deleteArticle(seq);
	
	response.sendRedirect(uri);
%>