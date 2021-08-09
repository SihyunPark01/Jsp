<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String user1 = "{\"uid\":\"A101\",\"name\":\"김유신\",\"hp\":\"010-1234-1111\",\"age\":25}";//key:value값들을 같이 넣어주는 것임
	String user2 = "{\"uid\":\"A102\",\"name\":\"김춘추\",\"hp\":\"010-1234-2222\",\"age\":22}";//key:value값들을 같이 넣어주는 것임
	String user3 = "{\"uid\":\"A103\",\"name\":\"장보고\",\"hp\":\"010-1234-3333\",\"age\":33}";//key:value값들을 같이 넣어주는 것임
	String user4 = "{\"uid\":\"A104\",\"name\":\"강감찬\",\"hp\":\"010-1234-4444\",\"age\":27}";//key:value값들을 같이 넣어주는 것임
	String user5 = "{\"uid\":\"A105\",\"name\":\"이순신\",\"hp\":\"010-1234-5555\",\"age\":42}";//key:value값들을 같이 넣어주는 것임

	String[] users = {user1, user2, user3, user4, user5};
			
	out.print(Arrays.deepToString(users)); //자바함수 사용
	//이렇게 해도 되지만 라이브러리를 쓰는게 훨씬 편하지...maven repository사이트에서 gson jar파일 다운받기
	//다운받아서 WEB_INF의 lib에 붙여넣기

	// client가 server한테 데이터달라고 요청한 상태
	
%>
