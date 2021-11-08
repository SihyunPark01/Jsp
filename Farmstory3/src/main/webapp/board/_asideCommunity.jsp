<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="sub">
    <div><img src="/Farmstory3/img/sub_top_tit5.png" alt="COMMUNITY"></div>
    <section class="cate5">
        <aside>
            <img src="/Farmstory3/img/sub_aside_cate5_tit.png" alt="커뮤니티"/>

            <ul class="lnb">
                <li class="${cate == 'notice'?'on':'off'}"><a href="/Farmstory3/board/list.do?group=Community&cate=notice">공지사항</a></li>
                <li class="${cate == 'menu'?'on':'off'}"><a href="/Farmstory3/board/list.do?group=Community&cate=menu">오늘의식단</a></li>
                <li class="${cate == 'chef'?'on':'off'}"><a href="/Farmstory3/board/list.do?group=Community&cate=chef">나도요리사</a></li>
                <li class="${cate == 'qna'?'on':'off'}"><a href="/Farmstory3/board/list.do?group=Community&cate=qna">고객문의</a></li>
                <li class="${cate == 'fnq'?'on':'off'}"><a href="/Farmstory3/board/list.do?group=Community&cate=fnq">자주묻는질문</a></li>
            </ul>

        </aside>
        <article>
            <nav>
                <img src="/Farmstory3/img/sub_nav_tit_cate5_${cate}.png" alt="커뮤니티"/>
                <p>
                    HOME > 커뮤니티 > 
                    <c:if test="${cate == 'notice'}"><em>공지사항</em></c:if>
                    <c:if test="${cate == 'menu'}"><em>오늘의식단</em></c:if>
                    <c:if test="${cate == 'chef'}"><em>나도요리사</em></c:if>
                    <c:if test="${cate == 'qna'}"><em>고객문의</em></c:if>
                    <c:if test="${cate == 'fnq'}"><em>자주묻는질문</em></c:if>
                </p>
            </nav>

            <!-- 내용 시작 -->