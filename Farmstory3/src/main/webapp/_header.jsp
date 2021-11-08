<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
    <link rel="stylesheet" href="/Farmstory3/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="/Farmstory3/js/CheckMember.js"></script>
    
    <script>
    	var success = ${requestScope.success};
    	
    	if(success == 100){
    		alert('일치하는 회원이 없습니다.\n아이디, 비밀번호를 다시 확인해 주세요.');
    	}else if(success == 101){
    		alert('정상적으로 로그아웃이 되었습니다.');
    	}else if(success == 102){
    		alert('먼저 로그인을 하셔야 합니다.');
    	}else if(success == 103){
    		alert('글 작성을 위해 로그인을 하셔야 합니다.');
    	}
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/Farmstory3/js/zipcode.js"></script>
    
    <script>
        $(function(){

            $('.slider > ul').bxSlider({
                slideWidth: 980,
                pager: false,
                controls: false,
                auto: true
            });

            $('#tabs').tabs();

        });
    </script>
    
    

</head>
<body>
    <div id="wrapper">
        <header>
            <a href="/Farmstory3" class="logo"><img src="/Farmstory3/img/logo.png" alt="로고"/></a>
            <p>
                <a href="/Farmstory3">HOME |</a>
                <c:choose>
                <c:when test="${sessMember eq null}">
                <a href="/Farmstory3/member/login.do">로그인 |</a>
                <a href="/Farmstory3/member/terms.do">회원가입 |</a>
                </c:when>
                <c:otherwise>
                <a>${sessMember.nick}님</a>
                <a href="/Farmstory3/member/logout.do">로그아웃|</a>
                </c:otherwise>
                </c:choose>
                <a href="#">고객센터</a>
            </p>
            <img src="/Farmstory3/img/head_txt_img.png" alt="3만원 이상 무료배송"/>
            
            <ul class="gnb">
                <li><a href="/Farmstory3/introduction/hello.do">팜스토리소개</a></li>
                <li><a href="/Farmstory3/board/list.do?group=Market&cate=market"><img src="/Farmstory3/img/head_menu_badge.png" alt="30%"/>장보기</a></li>
                <li><a href="/Farmstory3/board/list.do?group=Croptalk&cate=story">농작물이야기</a></li>
                <li><a href="/Farmstory3/board/list.do?group=Event&cate=event">이벤트</a></li>
                <li><a href="/Farmstory3/board/list.do?group=Community&cate=notice">커뮤니티</a></li>
            </ul>
        </header>
       