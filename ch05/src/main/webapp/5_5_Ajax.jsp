<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>5.Ajax</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
	<script>
		$(document).ready(function(){
			
			var table = $('table > tbody');
			
			$('button').click(function(){
				
				//데이터 요청하기
				$.ajax({
					url: '5_3_Json.jsp', //요청주소
					type:'get',
					dataType: 'json',
					success: function(data){
						
						//data가 객체 리스트이므로
						for(var i=0; i<data.length; i++){ //배열 반복문
							
							//alert(data[i].name);
							table.append('<tr></tr>'); //table마지막에 <tr></tr>을 삽입한 꼴
							table.find('tr:last-child').append('<td>'+data[i].uid+'</td>');
							table.find('tr:last-child').append('<td>'+data[i].name+'</td>');
							table.find('tr:last-child').append('<td>'+data[i].hp+'</td>');
							table.find('tr:last-child').append('<td>'+data[i].pos+'</td>');
							table.find('tr:last-child').append('<td>'+data[i].dep+'</td>');
							table.find('tr:last-child').append('<td>'+data[i].rdate+'</td>');
						
						}
					
					}
				});
				
			});
			
		});
	</script>
	
</head>
<body>
	<h3>5.Ajax 통신 실습하기</h3>
	
	<button>데이터 불러오기</button>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>직급</th>
			<th>부서</th>
			<th>입사일</th>
		</tr>
		
	</table>
	
</body>
</html>