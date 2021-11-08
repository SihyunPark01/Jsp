<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<jsp:include page="./_aside${group}.jsp">
	<jsp:param name="cate" value="${cate}"/>
</jsp:include>


        <section id="board" class="modify">
            <h3>글수정</h3>
            <article>
                <form action="/Farmstory3/board/modify.do">
                	<input type="hidden" name="seq"  value="${seq}">
                	<input type="hidden" name="group"  value="${group}">
                	<input type="hidden" name="cate"  value="${cate}">
                    <table>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="title" value="${vo.title}"/></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <textarea name="content"></textarea>                                
                            </td>
                        </tr>
                        <tr>
                            <td>첨부</td>
                            <td><input type="file" name="file" /></td>
                        </tr>
                    </table>
                    <div>
                        <a href="/Farmstory3/board/view.do?group=${group}&cate=${cate}&seq=${seq}" class="btnCancel">취소</a>
                        <input type="submit"  class="btnWrite" value="수정완료">
                    </div>
                </form>
            </article>
        </section>
<%@ include file="../_footer.jsp" %>      