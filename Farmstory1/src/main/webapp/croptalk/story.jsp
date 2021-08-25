<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>

<%
 	String mode = request.getParameter("mode");
	String uri = request.getRequestURI();
	
	if(mode==null){
		mode = "l";
	}
%>



    <!--모든 서브페이지의 기본골격-->    
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

                <!--내용 시작-->
                <% if(mode.equals("l")){ %>
                	<jsp:include page="../board/list.jsp"/>
				<%}else if(mode.equals("w")){ %>
					<jsp:include page="../board/write.jsp"/>
				<%}else if(mode.equals("v")){ %>
					<jsp:include page="../board/view.jsp"/>
				<%}else if(mode.equals("m")){ %>
					<jsp:include page="../board/modify.jsp"/>
				<%} %>
				<!--  
				목록
				글쓰기
				글보기
				글수정
				-->	
                <!--내용 끝-->
                  
            </article>
        </section>
    </div>

<%@ include file="../_footer.jsp" %> 