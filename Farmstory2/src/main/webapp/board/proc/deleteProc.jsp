<%@page import="kr.co.farmstory2.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	
	ArticleDao.getInstance().deleteArticle(seq);
	
	response.sendRedirect("/Farmstory2/board/list.jsp?group="+group+"&cate="+cate);
%>