<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="sub">
    <div><img src="/Farmstory3/img/sub_top_tit2.png" alt="COMMUNITY"></div>
    <section class="cate2">
        <aside>
            <img src="/Farmstory3/img/sub_aside_cate2_tit.png" alt="장보기"/>

            <ul class="lnb">
                <li class="${cate == 'market' ? 'on' : 'off'}"><a href="/Farmstory3/board/list.do?group=Market&cate=market">장보기</a></li>
            </ul>

        </aside>
        <article>
            <nav>
                <img src="/Farmstory3/img/sub_nav_tit_cate2_${cate}.png" alt="장보기"/>
                <p>
                    HOME > 장보기 > 
                    <c:if test="${cate == 'market'}"><em>장보기</em></c:if>
                </p>
            </nav>

            <!-- 내용 시작 -->