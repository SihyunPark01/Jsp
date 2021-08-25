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
 <div id="sub" class="cate5">
     <div><img src="/Farmstory1/img/sub_top_tit5.png" alt="COMMUNITY"/></div>
     <section>
         <aside>
             <img src="/Farmstory1/img/sub_aside_cate5_tit.png" alt="커뮤니티"/>
             <ul>
                <li><a href="/Farmstory1/community/notice.jsp">공지사항</a></li>
                <li class="on"><a href="/Farmstory1/community/menu.jsp">오늘의식단</a></li>
                <li><a href="/Farmstory1/community/chef.jsp">나도요리사</a></li>
                <li><a href="/Farmstory1/community/qna.jsp">고객문의</a></li>
                <li><a href="/Farmstory1/community/faq.jsp">자주묻는질문</a></li>
             </ul>
         </aside>
         <article>
             <nav>
                 <img src="/Farmstory1/img/sub_nav_tit_cate5_tit2.png" alt="오늘의식단"/>
                 <p>
                     HOME > 커뮤니티 > <strong>오늘의식단</strong>
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

             <!--내용 끝-->
         </article>
     </section>
 </div>

<%@ include file="../_footer.jsp" %> 