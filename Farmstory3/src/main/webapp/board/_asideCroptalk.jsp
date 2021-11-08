<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="sub">
    <div><img src="/Farmstory3/img/sub_top_tit3.png" alt="COMMUNITY"></div>
    <section class="cate3">
        <aside>
            <img src="/Farmstory3/img/sub_aside_cate3_tit.png" alt="농작물이야기"/>

            <ul class="lnb">
                <li class="${cate == 'story'? 'on': 'off'}"><a href="/Farmstory3/board/list.do?group=Croptalk&cate=story">농작물이야기</a></li>
                <li class="${cate == 'grow'? 'on': 'off'}"><a href="/Farmstory3/board/list.do?group=Croptalk&cate=grow">텃밭가꾸기</a></li>
                <li class="${cate == 'school'? 'on': 'off'}"><a href="/Farmstory3/board/list.do?group=Croptalk&cate=school">귀농학교</a></li>
            </ul>

        </aside>
        <article>
            <nav>
                <img src="/Farmstory3/img/sub_nav_tit_cate3_${cate}.png" alt="농작물이야기"/>
                <p>
                    HOME > 농작물이야기 > 
                    <c:if test="${cate == 'story'}"><em>농작물이야기</em></c:if>
                    <c:if test="${cate == 'grow'}"><em>텃밭가꾸기</em></c:if>
                    <c:if test="${cate == 'school'}"><em>귀농학교</em></c:if>
                </p>
            </nav>

            <!-- 내용 시작 -->