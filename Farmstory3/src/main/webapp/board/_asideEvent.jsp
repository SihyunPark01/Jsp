<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="sub">
    <div><img src="/Farmstory3/img/sub_top_tit5.png" alt="COMMUNITY"></div>
    <section class="cate4">
        <aside>
            <img src="/Farmstory3/img/sub_aside_cate4_tit.png" alt="이벤트"/>

            <ul class="lnb">
                <li class="${cate == 'event'?'on':'off'}"><a href="/Farmstory3/board/list.do?group=Event&cate=event">이벤트</a></li>
            </ul>

        </aside>
        <article>
            <nav>
                <img src="/Farmstory3/img/sub_nav_tit_cate4_${cate}.png" alt="이벤트"/>
                
                <p>
                    HOME > 이벤트 > 
                    <c:if test="${cate == 'event'}"><em>이벤트</em></c:if>
                </p>
                
                
                
            </nav>

            <!-- 내용 시작 -->