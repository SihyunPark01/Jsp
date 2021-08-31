<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String seq = request.getParameter("seq"); //댓글번호
	String comment = request.getParameter("comment"); //수정한 댓글 내용

	//댓글 수정
	int result = ArticleDao.getInstance().updateComment(comment, seq);

	//Json 생성
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	out.print(json);

%>

