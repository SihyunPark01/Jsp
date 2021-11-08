<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="/Farmstory3/css/style.css"/>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  	<script src="/Farmstory3/js/zipcode.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
	//정규표현식(Regular Expression) /^ [   ] $/ 서칭해서 붙여넣으면 됨.
    var reUid = /^[a-z]+[a-z0-9]{3,10}$/; //3,10도 붙어적어야함!!! //아이디 - 영문소문자 + 영문소문자, 숫자 를 4자리에서 10자리까지만 입력가능
    var rePass = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,}$/;
    var reName = /^[가-힣]{2,10}$/;
    var reNick = /^[a-z가-힣0-9]{2,10}$/;

    //최종 유효성 검사에 사용될 상태변수
    var isUidOk = false;
    var isPassOk = false;
    var isNameOk = false;
    var isNickOk = false;
  	
    $(document).ready(function(){
	 		
	 		$('.register > form').submit(function(){
	 			
	 			if(!isUidOk){ // 
	 				alert('아이디가 유효하지 않습니다. 다시 입력하세요.');
	 				return false; //false : 서버로 전송 취소, 막음. 
	 			}
	 			
	 			if(!isPassOk){
	 				alert('비밀번호가 유효하지 않습니다. 다시 입력하세요.');
	 				return false; //false : 서버로 전송 취소, 막음. 
	 			}
	 			
	 			if(!isNameOk){
	 				alert('이름이 유효하지 않습니다. 다시 입력하세요.');
	 				return false; //false : 서버로 전송 취소, 막음. 
	 			}
	 			
	 			if(!isNickOk){
	 				alert('닉네임이 유효하지 않습니다. 다시 입력하세요.');
	 				return false; //false : 서버로 전송 취소, 막음. 
	 			}
	 			
	 			return true; //true : 전송하기
	 			
	 		});
	 		
	 	});
    
    	$(function(){
			
    		// 아이디 중복체크
    		$('input[name=uid]').focusout(function(){
    			
    			var uid = $(this).val();
    			
    			$.ajax({
    				url: '/Farmstory3/checkUid.do?uid='+uid,
    				type: 'get',
    				dataType: 'json',
    				success:function(data){
    					
    					if(data.result == 1){
   						$('.resultId').css('color', 'red').text('이미 사용중인 아이디 입니다.');
							isUidOk = false;
    					}else{
							if(reUid.test(uid)){
								$('.resultId').css('color', 'green').text('사용 가능한 아이디 입니다.');
								isUidOk = true;								
							}else{
								$('.resultId').css('color', 'red').text('아이디는 영문 소문자, 숫자 조합 4~10자 까지 입니다.');
								isUidOk = false;								
							}
							isUidOk = true;
    					}
    				}	
    			});
    		});

    		// 비밀번호 유효성 검사
    		$('input[name=pass2]').focusout(function(){
				
				var pass1 = $('input[name=pass1]').val();
				var pass2 = $('input[name=pass2]').val();
				
				if(pass1 == pass2){ //비번 확인란이랑 일치한다면
					
					if(rePass.test(pass2)){
						$('.resultPass').css('color','green').text('비밀번호가 일치합니다.');
						isPassOk = true;
					}else{
						$('.resultPass').css('color','red').text('비밀번호는 영문,숫자 조합 최소 4이상이어야 합니다.');
						isPassOk = false;
					}
									
				}else{
					$('.resultPass').css('color','red').text('비밀번호가 일치하지 않습니다.');
					isPassOk = false;
				} 
				
			});
    		
    		// 이름 유효성 검사
    		$('input[name=name]').focusout(function(){
				
				var name = $(this).val();
				
				if(reName.test(name)){
					$('.resultName').css('color','gray').text('이름이 유효합니다.');
					isNameOk = true;
				}else{
					$('.resultName').css('color','red').text('이름이 유효하지 않습니다.');
					isNameOk = false;
				}
			});
    		
    		// 닉네임 중복체크
    		$('input[name=nick]').focusout(function(){
    			
    			var nick = $(this).val();
    			
    			//DB에서 가져와서 아이디 있는지 없는지 확인해봐야하는 작업
    			$.ajax({
    				url: '/Farmstory3/checkNick.do?nick='+nick,
    				type: 'get',
    				dataType: 'json',
    				success: function(data){
	
    					//닉네임 유효성 검사
    					if(data.result == 1){
    						$('.resultNick').css('color', 'red').text('이미 사용중인 닉네임 입니다.');
							isNickOk = false;
    					}else{
							if(reNick.test(nick)){
								$('.resultNick').css('color', 'green').text('사용 가능한 닉네임 입니다.');
								isNickOk = true;
							}else{
								$('.resultNick').css('color', 'red').text('닉네임은 영문,한글,숫자포함 2~10자 입니다.');
								isNickOk = false;
							}	
    						
    					}
    				}	
    				
    			});
  			
    		});
    		
    		// 이메일 중복체크
    		$('input[name=email]').focusout(function(){
    			
    			var email = $(this).val();
    			
    			//DB에서 가져와서 아이디 있는지 없는지 확인해봐야하는 작업
    			$.ajax({
    				url: '/Farmstory3/checkEmail.do?email='+email,
    				type: 'get',
    				dataType: 'json',
    				success: function(data){
    					
    					if(data.result == 1){
    						$('.resultEmail').css('color', 'red').text('이미 사용중인 이메일 입니다.');
    					}else{
    						$('.resultEmail').css('color', 'green').text('사용 가능한 이메일 입니다.');
    					}
    				}	
    				
    			});
  			
    		});
    		
    		// 휴대폰 중복체크
				$('input[name=hp]').focusout(function(){
    			
    			var hp = $(this).val();
    			
    			//DB에서 가져와서 아이디 있는지 없는지 확인해봐야하는 작업
    			$.ajax({
    				url: '/Farmstory3/checkHp.do?hp='+hp,
    				type: 'get',
    				dataType: 'json',
    				success: function(data){
    					
    					if(data.result == 1){
    						
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
            <form action="/Farmstory3/member/register.do" method="POST">
                <table border="1">
                    <caption>사이트 이용정보 입력</caption>
                    <tr>
                        <td>아이디</td>
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
                            <span class="resultName"></span>                             
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
		                         <input type="text" id="zip" name="zip" placeholder="우편번호" readonly/>
		                         <button type="button" class="btnZip" onclick="zipcode()">주소검색</button>
		                     </div>                            
		                     <div>
		                         <input type="text" id="addr1" name="addr1" placeholder="주소를 검색하세요." readonly/>
		                     </div>
		                     <div>
		                         <input type="text" id="addr2" name="addr2" placeholder="상세주소를 입력하세요."/>
                     		</div>
                        </td>
                    </tr>
                </table>

                <div>
                    <a href="/Farmstory3/member/login.do" class="btnCancel">취소</a>
                    <input type="submit"   class="btnJoin" value="회원가입"/>
                </div>

            </form>
        </section>
         