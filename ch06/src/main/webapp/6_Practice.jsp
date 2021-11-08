<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h3>첫번째 방법</h3>
	<%		
		String name = "홍길동";
		pageContext.setAttribute("name", name);
	%>
	<p> ${name} </p>
	
	<h3>두번째 방법</h3>
	<%
		pageContext.setAttribute("name", "김유신");
	%>
	<p> ${pageScope.name}
	
	<h3>세번째 방법</h3>
	<%
		String str1 = "";
		int num1 = 1;
		int num2 = 2;
		
		request.setAttribute("str1", str1);
		request.setAttribute("num1", num1);
		request.setAttribute("num2", num2);
	%>
	<p> num1 + num2 = ${num1 + num2} </p>

	<h3>JSTL core 태그예제 - set, out, remove</h3>
	<p>browser 변수값 설정
	<c:set var="browser" value="${header['User-Agent']}"/><br>
	<c:out value="${browser}"/><p>
	
	<p>browser 변수값 제거 후
	<c:remove var="browser"/>
	<c:out value="${browser}"/>
	

	<h3>JSTL core 태그예제 </h3>
	<c:set var="country" value="${'Korea'}"/>
	
	<c:if test="${country != null}">
		국가명:<c:out value="${country}"/><br>
	</c:if>		
	
	<c:choose>
		<c:when test="${country == 'Korea'}">
			<p><c:out value="${country}"/>의 겨울은 춥다.<br/>
		</c:when>
		<c:when test="${country == 'Canada'}">
			<p><c:out value="${country}"/>의 겨울은 너무 춥다. 	
		</c:when>	
		<c:otherwise>
			<p>그 외의 나라들의 겨울은 알 수 없다.
		</c:otherwise>
	</c:choose>
	
	
	<c:forEach var="i" begin="1" end="100">
		<c:out value="${i % 2 == 0}"/>
	</c:forEach>
	
	
	<h3>Header 정보:</h3>
	<c:forEach var="head" items="${headerValues}">
		<p>param: <c:out value="${head.key}"/>
		<p>values:
			<c:forEach var="val" items="${head.value}">
				<c:out value="${val}"/>
			</c:forEach>
	</c:forEach>
	
	
	<h3>JSTL core 태그예제 - forTokens</h3>
	<c:forTokens var="tech" items="금강불괴,허공답보,열양기공,천마군림보" delims=",">
		<p>익혀야 할 기술: <c:out value="${tech}"/>
	</c:forTokens>
	
	
	<h3>JSTL core 태그예제 - import</h3>
	
	<c:import url="/ch06/6_1_EL.jsp" var="url"/>
	${url}
	
		
	
	
	
</body>
</html>