<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${sessionScope.sessMember eq null}">          <!-- 표현언어에서 ==은 eq로 표시하는거 알지? -->
		<!-- 로그인을 안했을 때 -->
		<jsp:forward page="/user/login.do"/> <!-- 첫페이지를 로그인페이지로 고정시키기 -->
	</c:when>
	<c:otherwise>
		<!-- 로그인을 했을 때 -->
		<jsp:forward page="/list.do"/> 
	</c:otherwise>
</c:choose>	

