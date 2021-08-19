<%@page import="kr.co.jboard.bean.ArticleBean"%>
<%@page import="kr.co.jboard.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	String parent = request.getParameter("parent");
	String content = request.getParameter("content");
	String uid = request.getParameter("uid");
	String regip = request.getRemoteAddr();

	//int p = Integer.parseInt(parent); 
	
	ArticleBean ab = new ArticleBean();
	ab.setParent(parent);
	ab.setContent(content);
	ab.setUid(uid);
	ab.setRegip(regip);
	
	
	//댓글 등록하기
	ArticleDao.getInstance().insertComment(ab);
	
	//댓글 카운트(등록-플러스)
	ArticleDao.getInstance().updateCommentCount(parent, +1);

	//댓글 카운트(삭제-마이너스) //이건 deleteComment에서 처리
		
	//리다이렉트
	response.sendRedirect("/Jboard/view.jsp?seq="+parent); //왜 parent가 되는건데??? 생성한 글번호니까.

%>