<%@page import="kr.co.farmstory2.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String parent = request.getParameter("parent");	
	String seq = request.getParameter("seq");
		
	ArticleDao dao = ArticleDao.getInstance();
	
	//댓글 삭제
	dao.deleteComment(seq);
	//댓글 카운트 -1
	dao.updateCommentCount(parent, -1);
	//리다이렉트
	response.sendRedirect("#");

%>