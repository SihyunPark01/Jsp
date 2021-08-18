<%@page import="kr.co.jboard.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	MemberBean mb = (MemberBean) session.getAttribute("sessMember");
	
	if(mb == null){
		// 로그인을 하지 않고 write 페이지를 요청했을 때
		response.sendRedirect("/Jboard/user/login.jsp?success=103");
		return;
	}
	
	request.setCharacterEncoding("UTF-8");
	String pg = request.getParameter("pg");
	
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
    <link rel="stylesheet" href="/Jboard/css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="write">
            <h3>글쓰기</h3>
            <article>
                <form action="/Jboard/proc/writeProc.jsp" method="post" enctype="multipart/form-data">  <!-- get으로 할 경우 길이 제한이 있는데 글내용은 길 수 있으니까. -->
 <!-- 이거 왜 추가하는거임? -->   <input type="hidden" name="uid" value="<%= mb.getUid() %>"/>
                    <table>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <textarea name="content"></textarea>                                
                            </td>
                        </tr>
                        <tr>
                            <td>첨부</td>
                            <td><input type="file" name="fname"/></td>
                        </tr>
                    </table>
                    <div>
                        <a href="/Jboard/list.jsp" class="btnCancel">취소</a>
                        <input type="submit"  class="btnWrite" value="작성완료">
                    </div>
                </form>
            </article>
        </section>
    </div>
</body>
</html>