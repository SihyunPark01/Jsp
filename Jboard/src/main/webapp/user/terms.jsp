<%@page import="kr.co.jboard.db.Sql"%>
<%@page import="kr.co.jboard.db.DBConfig"%>
<%@page import="kr.co.jboard.bean.TermsBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
		String host = "jdbc:mysql://54.180.160.240:3306/maro02260226";
		String user = "maro02260226";
		String pass = "1234";

		TermsBean tb = new TermsBean();
	try{
	
		
		//1~2단계
		Connection conn = DBConfig.getInstance().getConnection();
		
		//3단계
		Statement stmt = conn.createStatement();
		
		
		//4단계 이거 외우자!!!!!!!!
		ResultSet rs = stmt.executeQuery(Sql.SELECT_TERMS);
		
		
		//5단계
		
		if(rs.next()){
			
			tb.setTearms(rs.getString(1));
			tb.setPrivacy(rs.getString(2));
		}
		
		
		//6단계
		rs.close();
		conn.close();
		stmt.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>



<!-- 마크업 & 스타일 부분 : DB가져오려면 이 위에다가 try-catch문 선언--> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>약관</title>
    <link rel="stylesheet" href="/Jboard/css/style.css"/>   
    
    
    		    <!-- jquery google 들어가서 복사해 오는 이 라이브러리 추가 작업 중요!!! 스크립트선언문 위에다 추가해야 함!!!!! -->
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
    		/* //체크박스 (다음버튼을 누를 떄 체크가 되었는지 활성화해야하므로)
    		var chk1 = $('input[name=chk1]');
    		var chk2 = $('input[name=chk2]'); */
    		
    		
    		
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
                        <textarea readonly><%= tb.getTearms() %></textarea>
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
                        <textarea readonly><%= tb.getPrivacy() %></textarea>
                        
                        <p>
                            <label><input type="checkbox" name="chk2"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Jboard/user/login.jsp">취소</a>
                <a href="/Jboard/user/register.jsp">다음</a>
            </div>
        </section>
    </div>
    
</body>
</html>