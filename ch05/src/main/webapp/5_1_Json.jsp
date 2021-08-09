<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/*
		날짜 : 2021/08/09
		이름 : 김철학
		내용 : Jsp JSON 데이터 실습하기
		
		Json 데이터 
		- JavaScript Object Notation (자바스크립트 객체 표기)
		- 이기종간의 데이터 교환할 때 사용하는 표준 포맷 (서버와 자동차, 서버와 밥솥, 서버와 서버 등등등)
		
	*/

	String jsonData = "{\"uid\":\"A101\",\"name\":\"홍길동\",\"hp\":\"010-1234-1111\",\"age\":25}"; //자바스크립트는 객체를 {}로 표기함, ""는 앞에 \(escape)처리
	
	out.print(jsonData); //출력 객체 -> 실행!해보면 위의 형태랑 똑같이 나와버림.
	
	//크롬 웹스토어에서 json viewer 다운받아서 설치한 후 결과값을 보면 다른 거 볼 수 있지??? 이게 json data임.
			
			
	
	



%>

