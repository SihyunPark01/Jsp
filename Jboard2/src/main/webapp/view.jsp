<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글보기</title>
    <link rel="stylesheet" href="/Jboard2/css/style.css"/>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
    					url: '/Jboard2/UpdateCommentService.do',
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
    
</head>
<body>
    <div id="wrapper">
        <section id="board" class="view">
            <h3>글보기</h3>
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="${vo.title}" readonly/></td>
                </tr>

				<c:if test="${vo.file == 1}"></c:if>
                <tr>
                    <td>첨부파일</td>
                    <td>
                        <a href="/Jboard2/fileDownload.do?fseq=${vo.fb.fseq}">${vo.fb.oriName}</a>
                        <span>${vo.fb.download}회 다운로드</span>
                    </td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content" readonly>${vo.content}</textarea>
                    </td>
                </tr>
            </table>
            <div>
                <a href="#" class="btnDelete">삭제</a>
                <a href="/Jboard2/modify.do" class="btnModify">수정</a>
                <a href="/Jboard2/list.do" class="btnList">목록</a>
            </div>  
            
            <!-- 댓글리스트 -->
            <section class="commentList">
                <h3>댓글목록</h3>
                
                <c:forEach var="comment" items="${comments}">
                <article class="comment">
                    <span>
                        <span>${comment.nick}</span>
                        <span>${comment.rdate}</span>
                    </span>
                    <textarea name="comment" readonly >${comment.content}</textarea>
                    <div>
                        <a href="#">삭제</a>
                        <a href="#">수정</a>
                    </div>
	               </article>
                </c:forEach>
                
                <c:if test="${comments.size() == 0}">
                <p class="empty">
                    등록된 댓글이 없습니다.
                </p>
                </c:if>
            </section>

            <!-- 댓글입력폼 -->
            <section class="commentForm">
                <h3>댓글쓰기</h3>
                <form action="/Jboard2/comment.do" method="post">
                	<input type="hidden" name="parent" value="${vo.seq}"/>
                	<input type="hidden" name="uid" value="${sessMember.uid}"/>
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