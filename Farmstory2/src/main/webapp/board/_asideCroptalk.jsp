<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String cate = request.getParameter("cate");
	
	String title = "";
	
	if(cate.equals("story")){
		title = "농작물이야기";
	}else if(cate.equals("grow")){
		title = "텃밭가꾸기";
	}else if(cate.equals("school")){
		title = "귀농학교";	
	}


%>

<div id="sub" class="cate3">
    <div><img src="../img/sub_top_tit3.png" alt="CROP TALK"/></div>
    <section>
        <aside>
            <img src="../img/sub_aside_cate3_tit.png" alt="농작물이야기"/>
            <ul>
                <li class="<%= cate.equals("story") ? "on" : "off" %>"><a href="./list.jsp?group=Croptalk&cate=story">농작물이야기</a></li>
                <li class="<%= cate.equals("grow") ? "on" : "off" %>"><a href="./list.jsp?group=Croptalk&cate=grow">텃밭가꾸기</a></li>
                <li class="<%= cate.equals("school") ? "on" : "off" %>"><a href="./list.jsp?group=Croptalk&cate=school">귀농학교</a></li>
            </ul>
        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate3_<%= cate %>.png" alt="<%= title %>"/>
                <p>
                    HOME > 농작물이야기 > <strong><%= title %></strong>
                    
                </p>
            </nav>

            <!--내용 시작-->
