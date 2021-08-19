<%@page import="kr.co.jboard.dao.ArticleDao"%>
<%@page import="kr.co.jboard.bean.ArticleBean"%>
<%@page import="kr.co.jboard.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberBean mb = (MemberBean) session.getAttribute("sessMember");
	
	if(mb == null){
		// 로그인을 하지 않고 view 페이지를 요청했을 때
		response.sendRedirect("/Jboard/user/login.jsp?success=103");
		return;
	}
	
	
	request.setCharacterEncoding("utf-8");
 	String seq = request.getParameter("seq");
 	
 	// 수정 글 가져오기
 	ArticleBean article = ArticleDao.getInstance().selectArticle(seq);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글수정</title>
    <link rel="stylesheet" href="/Jboard/css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="modify">
            <h3>글수정</h3>
            <article>
                <form action="/Jboard/proc/modifyProc.jsp" method="post">
                	<input type="hidden" name="seq" value="<%= seq %>"/>
                    <table>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="title" value="<%= article.getTitle() %>" placeholder="제목을 입력하세요."/></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <textarea name="content"><%= article.getContent() %></textarea>                                
                            </td>
                        </tr>
                        <!-- 수정화면에서 첨부파일 추가는 생략하겠습니다.
                        <tr>
                            <td>첨부</td>
                            <td><input type="file" name="file"/></td>
                        </tr>
                         -->
                    </table>
                    <div>
                        <a href="/Jboard/view.jsp?seq=<%= seq %>" class="btnCancel">취소</a>
                        <input type="submit"  class="btnWrite" value="수정완료"/>
                    </div>
                </form>
            </article>
        </section>
    </div>
</body>
</html>