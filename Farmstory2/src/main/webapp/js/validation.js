/**
 * 
 */

/**
 * 
 */


//Validation(유효성 검증)
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
  