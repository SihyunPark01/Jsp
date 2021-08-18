<%@page import="java.util.List"%>
<%@page import="kr.co.jboard.bean.MemberBean"%>
<%@page import="kr.co.jboard.bean.ArticleBean"%>
<%@page import="kr.co.jboard.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberBean mb = (MemberBean) session.getAttribute("sessMember");

	if(mb == null){
		// 로그인을 하지 않고 view 페이지를 요청했을 때
		response.sendRedirect("/Jboard/user/login.jsp?success=103");
		return;
}
	request.setCharacterEncoding("UTF-8");
	String seq = request.getParameter("seq");
	
	
	ArticleDao dao = ArticleDao.getInstance();
	//조회수 업데이트
	dao.updateArticleHit(seq);
	
	//글 가져오기
	ArticleBean article = ArticleDao.getInstance().selectArticle(seq);

	//댓글 가져오기
	List<ArticleBean> comments = dao.selectComments(seq); //selectComments만들러가자
	
	
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글보기</title>
    <link rel="stylesheet" href="./css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="view">
            <h3>글보기</h3>
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="<%=article.getTitle() %>" readonly/></td>
                </tr>
                <% if(article.getFile()==1){ %>
                <tr>
                    <td>첨부파일</td>
                    <td>
                        <a href="#"><%= article.getFb().getOriName() %></a>
                        <span><%= article.getFb().getDownload() %>회 다운로드</span>
                    </td>
                </tr>
                <% } %>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content" readonly><%=article.getContent()%></textarea>
                    </td>
                </tr>
            </table>
            <div>
                <a href="#" class="btnDelete">삭제</a>
                <a href="/Jboard/modify.jsp" class="btnModify">수정</a>
                <a href="/Jboard/list.jsp" class="btnList">목록</a>
            </div>  
            
            <!-- 댓글리스트 -->
            <section class="commentList">
                <h3>댓글목록</h3>
                
                <% for(ArticleBean comment : comments){ %> 
                <article class="comment">
                    <span>
                        <span><%= comment.getNick() %></span>
                        <span><%= comment.getRdate().substring(2, 10) %></span>
                    </span>
                    <textarea name="comment" readonly><%= comment.getContent() %></textarea>
                    <div>
                        <a href="#">삭제</a>
                        <a href="#">수정</a>
                    </div>
                </article>
                <% } %> 
                
                <% if(comments.size() == 0){ %>
                <p class="empty">등록된 댓글이 없습니다.</p>
                <% } %>
            </section>

            <!-- 댓글입력폼 -->
            <section class="commentForm">
                <h3>댓글쓰기</h3>
                <form action="/Jboard/proc/commentProc.jsp" method="post">
                	<input type="hidden" name="parent" value="<%= article.getSeq() %>"/> <!-- 현재보고있는글번호 -->
                	<input type="hidden" name="uid" value="<%= mb.getUid() %>"/>
                
                    <textarea name="content"></textarea>
                    <div>
                        <a href="#" class="btnCancel">취소</a>
                        <input type="submit" class="btnWrite" value="작성완료"/>
                    </div>
                </form>
            </section>

        </section>
    </div>    
</body>
</html>