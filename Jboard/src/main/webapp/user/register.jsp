<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="/Jboard/css/style.css"/>
    
    <!-- 요거 꼭 추가해야함!!! -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    	$(document).ready(function(){
    		
    		//아이디 중복체크
    		$('input[name=uid]').focusout(function(){
    			
    			var uid = $(this).val();
    			
    			//DB에서 가져와서 아이디 있는지 없는지 확인해봐야하는 작업
    			$.ajax({
    				url: '/Jboard/user/proc/checkUid.jsp?uid='+uid,
    				type: 'get',
    				dataType: 'json',
    				success: function(data){
    					
    					if(data.result == 1){
    						// alert('이미 사용중인 아이디 입니다.');
    						$('.resultId').css('color', 'red').text('이미 사용중인 아이디 입니다.');
    					}else{
    						$('.resultId').css('color', 'green').text('사용 가능한 아이디 입니다.');
    					}
    				}	
    				
    			});
  			
    		});
  		
    		//닉네임 중복 체크
    		$('input[name=nick]').focusout(function(){
    			
    			var nick = $(this).val();
    			
    			//DB에서 가져와서 아이디 있는지 없는지 확인해봐야하는 작업
    			$.ajax({
    				url: '/Jboard/user/proc/checkNick.jsp?nick='+nick,
    				type: 'get',
    				dataType: 'json',
    				success: function(data){
    					
    					if(data.result == 1){
    						// alert('이미 사용중인 아이디 입니다.');
    						$('.resultNick').css('color', 'red').text('이미 사용중인 닉네임 입니다.');
    					}else{
    						$('.resultNick').css('color', 'green').text('사용 가능한 닉네임 입니다.');
    					}
    				}	
    				
    			});
  			
    		});
    		//이메일 중복 체크
    		$('input[name=email]').focusout(function(){
    			
    			var email = $(this).val();
    			
    			//DB에서 가져와서 아이디 있는지 없는지 확인해봐야하는 작업
    			$.ajax({
    				url: '/Jboard/user/proc/checkEmail.jsp?email='+email,
    				type: 'get',
    				dataType: 'json',
    				success: function(data){
    					
    					if(data.result == 1){
    						// alert('이미 사용중인 아이디 입니다.');
    						$('.resultEmail').css('color', 'red').text('이미 사용중인 이메일 입니다.');
    					}else{
    						$('.resultEmail').css('color', 'green').text('사용 가능한 이메일 입니다.');
    					}
    				}	
    				
    			});
  			
    		});
    		//휴대폰 중복 체크
				$('input[name=hp]').focusout(function(){
    			
    			var hp = $(this).val();
    			
    			//DB에서 가져와서 아이디 있는지 없는지 확인해봐야하는 작업
    			$.ajax({
    				url: '/Jboard/user/proc/checkHp.jsp?hp='+hp,
    				type: 'get',
    				dataType: 'json',
    				success: function(data){
    					
    					if(data.result == 1){
    						// alert('이미 사용중인 아이디 입니다.');
    						$('.resultHp').css('color', 'blue').text('이미 사용중인 번호입니다.');
    					}else{
    						$('.resultHp').css('color', 'gray').text('사용 가능한 번호입니다.');
    					}
    				}	
    				
    			});
  			
    		});
			
       		
    	});
    	
    
    
    </script>
    
</head>
<body>
    <div id="wrapper">
        <section id="user" class="register">
            <form action="/Jboard/user/proc/registerProc.jsp" method="POST">
                <table border="1">
                    <caption>사이트 이용정보 입력</caption>
                    <tr>
                        <td>아이디</td> <!-- 아이디 중복체크 작업수행 -->
                        <td>
                            <input type="text" name="uid" placeholder="아이디 입력"/>
                            <span class="resultId"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td>
                            <input type="password" name="pass1" placeholder="비밀번호 입력"/>                            
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호 확인</td>
                        <td>
                            <input type="password" name="pass2" placeholder="비밀번호 확인 입력"/>
                            <span class="resultPass"></span>
                        </td>
                    </tr>
                </table>
                <table border="1">
                    <caption>개인정보 입력</caption>
                    <tr>
                        <td>이름</td>
                        <td>
                            <input type="text" name="name" placeholder="이름 입력"/>                            
                        </td>
                    </tr>
                    <tr>
                        <td>별명</td>
                        <td>
                            <p>공백없이 한글, 영문, 숫자만 입력가능</p>
                            <input type="text" name="nick" placeholder="별명 입력"/>
                            <span class="resultNick"></span>                            
                        </td>
                    </tr>
                    <tr>
                        <td>E-Mail</td>
                        <td>
                            <input type="email" name="email" placeholder="이메일 입력"/>
                            <span class="resultEmail"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>휴대폰</td>
                        <td>
                            <input type="text" name="hp" placeholder="- 포함 13자리 입력" minlength="13" maxlength="13" />
                        	<span class="resultHp"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td>
                            <div>
                                <input type="text" name="zip" placeholder="우편번호" readonly/>
                                <button class="btnZip">주소검색</button>
                            </div>                            
                            <div>
                                <input type="text" name="addr1" placeholder="주소를 검색하세요." readonly/>
                            </div>
                            <div>
                                <input type="text" name="addr2" placeholder="상세주소를 입력하세요."/>
                            </div>
                        </td>
                    </tr>
                </table>

                <div>
                    <a href="/Jboard/user/login.jsp" class="btnCancel">취소</a>
                    <input type="submit" class="btnJoin" value="회원가입"/>
                </div>

            </form>
        </section>
    </div>    
</body>
</html>