<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>5_4_Ajax</title>
	
	<%-- 굉장히 중요!!!!!!!!!!!!!!!!!!!!!!!!
		날짜 : 2021/08/09
		이름 : 박시현
		내용 : AJAX 실습하기
		
		AJAX(Asynchronous Javascript And Xml)
		- 일반적인 페이지 요청을 위한 HTTP통신과 다르게 데이터 요청을 위한 부분 통신(비동기)
		- 데이터 결과는 일반적으로 Json 사용
	
	 --%>
	
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
	 <script> 
	 	$(document).ready(function(){//제이쿼리문의 시작 , $표시를 제이쿼리라 읽음
	 		
	 												//alert('Hello jQuery'); //그냥은 출력이 안되지? jquery google쳐서 사이트에 library에 script주소 복사해서 <script>위에 붙여넣기
	 		// 데이터 출력 태그객체 선택
	 		var tds = $('tr > td:nth-child(2)');
	 		 														
	 														
	 		// 버튼 이벤트 구현
	 		$('button').click(function(){
	 			
	 			//Ajax통신(데이터 요청)  Ajax함수 기본옵션 4개
	 			$.ajax({
	 				url: './5_1_Json.jsp',
	 				type:'get',
	 				dataType:'json',
	 				success: function(data){ //data속으로 빈들이 들어옴 즉 5_1_json에 있는 변수들을 data에 담음
	 					
	 					tds.eq(0).text(data.uid);
	 					tds.eq(1).text(data.name);
	 					tds.eq(2).text(data.hp);
	 					tds.eq(3).text(data.age);
	 					
	 					//alert(data.name);
	 				} 
	 			});
	 		
	 		}); //클릭함수를 구현 button을 클릭하면 function()이 실행됨
	 			//alert('클릭!');
	 	}); //제이쿼리문의 시작
	</script>
 
</head>
<body>
	<h3>4.Ajax 통신 실습하기</h3>
	
	<button>데이터 가져오기</button> 
	
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>-</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>-</td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td>-</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>-</td>
		</tr>

	</table>

</body>
</html>