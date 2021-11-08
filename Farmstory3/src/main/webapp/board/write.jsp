<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>

<jsp:include page="${includeFile}">
	<jsp:param name="cate" value="${cate}"/>
</jsp:include>



<section id="board" class="write">
    <h3>글쓰기</h3>
    <article>
        <form action="/Farmstory3/board/write.do?group=${group}&cate=${cate}" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="uid" value="${sessMember.uid}"/> <!-- form의 uid값으로 전송됨 -->
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
                <a href="/Farmstory3/board/list.do?group=${group}&cate=${cate}" class="btnCancel">취소</a>
                <input type="submit"  class="btnWrite" value="작성완료">
            </div>
        </form>
    </article>
</section>
<%@ include file="../_footer.jsp" %> 