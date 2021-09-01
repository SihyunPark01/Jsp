<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cate = request.getParameter("cate");
	
	String title = "";
	
	if(cate.equals("event")){
		title = "이벤트";
	}
%>
<div id="sub" class="cate4">
    <div><img src="../img/sub_top_tit4.png" alt="EVENT"/></div>
    <section>
        <aside>
            <img src="../img/sub_aside_cate4_tit.png" alt="이벤트"/>
            <ul>
                <li class="<%= cate.equals("event")  ? "on" : "off" %>"><a href="./list.jsp?group=Event&cate=event">이벤트</a></li>                        
            </ul>
        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate4_<%= cate %>.png" alt="<%= title %>"/>
                <p>
                    HOME > 장보기 > <strong><%= title %></strong>
                </p>
            </nav>

            <!-- 내용 시작 -->
