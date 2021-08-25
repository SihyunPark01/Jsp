<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
 
<%
	String uri = request.getRequestURI();
%> 
 
  
    <%-- 이부분 aside_croptalk로 따로 만들것임 (사이드쪽도 반복해서 쓸거니까)    
    <div id="sub" class="cate3">
        <div><img src="/Farmstory1/img/sub_top_tit3.png" alt="CROP TALK"/></div>
        <section>
            <aside>
                <img src="/Farmstory1/img/sub_aside_cate3_tit.png" alt="농작물이야기"/>
                <ul>
                    <li class="on"><a href="/Farmstory1/croptalk/story.jsp">농작물이야기</a></li>
                    <li><a href="/Farmstory1/croptalk/grow.jsp">텃밭가꾸기</a></li>
                    <li><a href="/Farmstory1/croptalk/school.jsp">귀농학교</a></li>
                </ul>
            </aside>
            <article>
                <nav>
                    <img src="/Farmstory1/img/sub_nav_tit_cate3_tit1.png" alt="농작물이야기"/>
                    <p>
                        HOME > 농작물이야기 > <strong>농작물이야기</strong>
                    </p>
                </nav>
				
                <!--내용 시작--> --%>
 	
        <section id="board" class="list">
            <h3>글목록</h3>
            <article>
 				
 				<!--              
                <p>
                    홍길동님 반갑습니다.
                    <a href="./user/login.html" class="logout">[로그아웃]</a>
                </p>
                -->
                
                <table border="0">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><a href="<%= uri %>?mode=l">테스트 제목입니다.</a>&nbsp;[3]</td>
                        <td>길동이</td>
                        <td>20-05-12</td>
                        <td>12</td>
                    </tr>
                </table>
            </article>

            <!-- 페이지 네비게이션 -->
            <div class="paging">
                <a href="#" class="prev">이전</a>
                <a href="#" class="num current">1</a>                
                <a href="#" class="num">2</a>                
                <a href="#" class="num">3</a>                
                <a href="#" class="next">다음</a>
            </div>

            <!-- 글쓰기 버튼 -->
            <a href="/Farmstory1/croptalk/story.jsp?mode=w" class="btnWrite">글쓰기</a>

        </section>
     	<!-- 내용 끝 -->
        </article>
    </section>
</div>
<%@ include file="../_footer.jsp" %>   