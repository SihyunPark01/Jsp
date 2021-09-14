<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>약관</title>
    <link rel="stylesheet" href="../css/style.css"/>    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    
    	//제이쿼리 라이브러리를 추가해야 document를 실행할 수 있음
    	$(document).ready(function(){
    		
    		var btnNext = $('.terms > div > a:nth-child(2)'); //다음버튼 얘기하는 것임
    		btnNext.click(function(){
    			
    			var isChecked1/*상태변수*/ = $('input[name=chk1]').is(':checked'); //동의체크를 하지 않았을 경우를 위한 작업1
    			var isChecked2/*상태변수*/ = $('input[name=chk2]').is(':checked'); //동의체크를 하지 않았을 경우를 위한 작업1
    			
    			if(/*둘 중 하나라도 동의체크를 하지 않았을 경우*/!isChecked1 || !isChecked2 ){
    				alert('동의 체크를 하셔야 합니다.')
    				return false; //링크로 이동하지 못하게 막는 작업
    			}else{
    				return true; //페이지 이동
    			}
    		})    		
    	}); //document가 자바스크립트를 의미함
    </script>
    
</head>
<body>
    <div id="wrapper">
        <section id="user" class="terms">
            <table>
                <caption>사이트 이용약관</caption>
                <tr>
                    <td>
                        <textarea readonly>${vo.terms}</textarea>
                        <p>
                            <label><input type="checkbox" name="chk1"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <table>
                <caption>개인정보 취급방침</caption>
                <tr>
                    <td>
                        <textarea readonly>${vo.privacy}</textarea>
                        <p>
                            <label><input type="checkbox" name="chk2"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Jboard2/user/login.do">취소</a>
                <a href="/Jboard2/user/register.do">다음</a>
            </div>
        </section>
    </div>
    
</body>
</html>