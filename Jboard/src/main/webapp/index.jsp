<%@page import="kr.co.jboard.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
		//프로젝트 시작처리 페이지 / session table에 접근해야지!!!
		MemberBean mb = (MemberBean)session.getAttribute("sessMember");
			
		if(mb == null){
			//로그인을 안한 경우 로그인페이지 포워드 
			pageContext.forward("./user/login.jsp"); //포워드에서는 절대경로를 사용할 수 없으므로 상대경로를 사용하자
			
		}else{
			//로그인을 했으면 리스트페이지 포워드
			pageContext.forward("./list.jsp");
		}

%>