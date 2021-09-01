<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cate = request.getParameter("cate");
	
	String title = "";
	
	if(cate.equals("market")){
		title = "장보기";
	}
%>
<div id="sub" class="cate2">
    <div><img src="../img/sub_top_tit2.png" alt="MARKET"/></div>
    <section>
        <aside>
            <img src="../img/sub_aside_cate2_tit.png" alt="장보기"/>
            <ul>
                <li class="<%= cate.equals("market")  ? "on" : "off" %>"><a href="./list.jsp?group=Market&cate=market">장보기</a></li>                        
            </ul>
        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate2_<%= cate %>.png" alt="<%= title %>"/>
                <p>
                    HOME > 장보기 > <strong><%= title %></strong>
                </p>
            </nav>

            <!-- 내용 시작 -->
