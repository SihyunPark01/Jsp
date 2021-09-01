<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cate = request.getParameter("cate");
	
	String title = "";
	
	if(cate.equals("notice")){
		title = "공지사항";
	}else if(cate.equals("menu")){
		title = "오늘의식단";
	}else if(cate.equals("chef")){
		title = "나도요리사";	
	}else if(cate.equals("qna")){
		title = "1:1고객문의";
	}else if(cate.equals("fnq")){
		title = "자주묻는질문";
	}
%>
<div id="sub" class="cate5">
    <div><img src="../img/sub_top_tit5.png" alt="COMMUNITY"/></div>
    <section>
        <aside>
            <img src="../img/sub_aside_cate5_tit.png" alt="커뮤니티"/>
            <ul>
                <li class="<%= cate.equals("notice")  ? "on" : "off" %>"><a href="./list.jsp?group=Community&cate=notice">커뮤니티</a></li>                        
                <li class="<%= cate.equals("menu")  ? "on" : "off" %>"><a href="./list.jsp?group=Community&cate=menu">커뮤니티</a></li>                        
                <li class="<%= cate.equals("chef")  ? "on" : "off" %>"><a href="./list.jsp?group=Community&cate=chef">커뮤니티</a></li>                        
                <li class="<%= cate.equals("qna")  ? "on" : "off" %>"><a href="./list.jsp?group=Community&cate=qna">커뮤니티</a></li>                        
                <li class="<%= cate.equals("fnq")  ? "on" : "off" %>"><a href="./list.jsp?group=Community&cate=fnq">커뮤니티</a></li>                        
            </ul>
        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate5_<%= cate %>.png" alt="<%= title %>"/>
                <p>
                    HOME > 장보기 > <strong><%= title %></strong>
                </p>
            </nav>

            <!-- 내용 시작 -->
