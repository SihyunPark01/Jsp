<%@page import="kr.co.farmstory2.bean.ArticleBean"%>
<%@page import="kr.co.farmstory2.dao.ArticleDao"%>
<%@page import="java.util.List"%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String includeFile = "./_aside" +group+ ".jsp"; 
	
	String uid = mb.getUid();
		
	ArticleDao dao = ArticleDao.getInstance();
	
	// 조회수 업데이트
	dao.updateArticleHit(seq);
	// 글 가져오기
	ArticleBean article = dao.selectArticle(seq);
	// 댓글 가져오기
	List<ArticleBean> comments = dao.selectComments(seq);
	
%>
<jsp:include page="<%= includeFile %>">
	<jsp:param name="cate" value="<%= cate %>"/>
</jsp:include>


<script>
	$(document).ready(function(){
		
		// 댓글 삭제
		$('.btnCommentDel').click(function(){
			var result = confirm('정말 삭제 하시겠습니까?');
			return result;
		});
		
		
		var content = '';
		
		// 댓글 수정
		$('.btnCommentModify').click(function(){
			
			var tag = $(this);
			var mode = $(this).text();    			    			
			var textarea = $(this).parent().prev();
			
			if(mode == '수정'){
				// 수정모드
				content = textarea.val(); 
				
				$(this).prev().css('display', 'none');
				$(this).next().css('display', 'inline');
				$(this).text('수정완료');
				textarea.attr('readonly', false).focus();
    			textarea.css({
    				'background': 'white',
    				'outline': '1px solid gray'
    			});
    			
			}else{
				// 수정완료 모드
				
				var seq     = textarea.attr('data-seq');
				var comment = textarea.val(); 
				
				var jsonData = {
						'seq': seq,
						'comment': comment
					};
				
				$.ajax({
					url: '/Farmstory2/board/proc/updateCommentProc.jsp',
					type: 'post',
					data: jsonData,   // 서버로 전송하는 데이터(JSON) 지정
					dataType: 'json', // 서버로 부터 전달되는 데이터 종류
					success: function(data){
						if(data.result == 1){
							alert('댓글 수정이 성공 했습니다.');
							
							// 수정모드 해제
							tag.text('수정');
							tag.prev().css('display', 'inline');
							tag.next().css('display', 'none');    			    			    							
			    			textarea.attr('readonly', true);
			    			textarea.css({
			    				'background': 'transparent',
			    				'outline': 'none'
			    			});
			    			
						}else{
							alert('댓글 수정이 실패 했습니다.');
						}
					}
				});
			}
			return false;
		});
		
		// 댓글 수정 취소
		$('.btnCommentCancel').click(function(e){
			e.preventDefault();
			$(this).prev().text('수정');
			$(this).prev().prev().css('display', 'inline');
			$(this).css('display', 'none');
			
			var textarea = $(this).parent().prev();
			
			textarea.val(content);
			textarea.attr('readonly', true);
			textarea.css({
				'background': 'transparent',
				'outline': 'none'
			});	
		});
		
		
	});
</script>

<section id="board" class="view">
    <h3>글보기</h3>
    <table>
        <tr>
            <td>제목</td>
            <td><input type="text" name="title" value=<%= article.getTitle() %> readonly/></td>
        </tr>
        <% if(article.getFile() == 1){ %>
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
                <textarea name="content" readonly><%= article.getContent() %></textarea>
            </td>
        </tr>
    </table>
    <div>
        <% if(uid.equals(article.getUid())){ %>
        	<a href="/Farmstory2/board/proc/deleteProc.jsp?seq=<%= article.getSeq() %>" class="btnDelete">삭제</a>
       		<a href="/Farmstory2/board/write.jsp?seq=<%= article.getSeq() %>" class="btnModify">수정</a>
     	<% } %>
        <a href="/Farmstory2/board/list.jsp?seq=<%= article.getSeq() %>" class="btnList">목록</a>
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
         <textarea name="comment" readonly data-seq="<%= comment.getSeq() %>"><%= comment.getContent() %></textarea>
         
         <% if(uid.equals(comment.getUid())){ %>
         <div>
              <a href="/Farmstory2/board/proc/deleteCommentProc.jsp?parent=<%= comment.getParent() %>&seq=<%= comment.getSeq() %>" class="btnCommentDel">삭제</a>
	          <a href="#" class="btnCommentModify">수정</a>
	          <a href="#" class="btnCommentCancel">취소</a>
         </div>
         <% } %>
         
     </article>
     <% } %>
     
     
     <% if(comments.size() == 0){ %>
       	<p class="empty">등록된 댓글이 없습니다.</p>
     <% } %>
  </section>

 <!-- 댓글입력폼 -->
 <section class="commentForm">
     <h3>댓글쓰기</h3>
     <form action="/Farmstory2/board/proc/insertCommentProc.jsp" method="post">
     		<input type="hidden" name="parent" value="<%= article.getSeq() %>" />
        	<input type="hidden" name="uid" value="<%= uid %>" />
        	     
       <textarea name="content"></textarea>
         <div>
             <a href="/Farmstory2/board/view.jsp?seq=<%= article.getSeq() %>" class="btnCancel">취소</a>
             <input type="submit" class="btnWrite" value="작성완료"/>
         </div>
     </form>
 </section>

