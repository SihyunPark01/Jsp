<%@page import="kr.co.farmstory1.dao.MemberDao"%>
<%@page import="kr.co.farmstory1.bean.MemberBean"%>
<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
 
<%
	String uri = request.getRequestURI();
	
	int begin = uri.lastIndexOf("/")+1;
	int end = uri.lastIndexOf(".");
	
	String cate = uri.substring(begin, end);
	
	//전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String pg = request.getParameter("pg");
	
	if(pg == null){
		pg = "1";
	}

	// 페이지 계산 처리 
	int start = 0;
	int currentPage = Integer.parseInt(pg);
	int total = ArticleDao.getInstance().selectCountTotal(cate);
	int lastPageNum = 0;
	
	if(total % 10 == 0){
		lastPageNum = total / 10;
	}else{
		lastPageNum = total / 10 + 1;
	}	
	start = (currentPage - 1) * 10;
	
	int pageStartNum = total - start;
	int groupCurrent = (int)Math.ceil(currentPage / 10.0);
	int groupStart = (groupCurrent - 1) * 10 + 1;
	int groupEnd = groupCurrent * 10;
	
	if(groupEnd > lastPageNum){
		groupEnd = lastPageNum;
	}
	
	//게시물 가져오기
	List<ArticleBean> articles = ArticleDao.getInstance().selectArticles(cate, start);		
			
	
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
                    
                   <% for(ArticleBean article : articles){ %>
            <tr>
                <td><%= pageStartNum-- %></td>
                <td><a href="<%= uri %>?mode=v&seq=<%= article.getSeq() %>"><%= article.getTitle() %></a>&nbsp;[<%= article.getComment() %>]</td>
                <td><%= article.getNick() %></td>
                <td><%= article.getRdate().substring(2, 10) %></td>
                <td><%= article.getHit() %></td>
            </tr>
            <% } %>
                    
                </table>
            </article>

            <!-- 페이지 네비게이션 -->
          <div class="paging">
        
        <% if(groupStart > 1){ %>
        	<a href="<%= uri %>?pg=<%= groupStart - 1 %>" class="prev">이전</a>
        <% } %>
        
        <% for(int i=groupStart ; i<=groupEnd ; i++){ %>
        	<a href="<%= uri %>?pg=<%= i %>" class="num <%= (currentPage == i) ? "current":"" %>"><%= i %></a>
        <% } %>
        
        <% if(groupEnd < lastPageNum){ %>
        	<a href="<%= uri %>?pg=<%= groupEnd + 1 %>" class="next">다음</a>
        <% } %>
   		 </div>

            <!-- 글쓰기 버튼 -->
            <a href="<%= uri %>?mode=w" class="btnWrite">글쓰기</a>
 			
 			
 			
        </section>
     	
<%@ include file="../_footer.jsp" %>   