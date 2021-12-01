<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 메뉴 리스트</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/main.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrap" id="wrap">
	<%@ include file="/WEB-INF/views/headerFooter/header.jsp"%>
    	<section class="size15 boardList">
            <div class="boardList-box">
                <div class="carousel-title">
                    <h2 class="font-noto">고객센터</h1>
                </div>
                <div class="boardList-list-title strong main-color2">
                    <p>번호</p> 
                    <p>글 제목</p>
                    <p class="text-r">날짜</p>
                </div>
                <c:forEach var="board" items="${boards.content }">
                    <div class="boardList-list">
                        <div class="boardList-contents">
                            <a href="/board/${board.bid}" class="boardList-content">
                                <!-- {보드 넘버 여기다가 넣으면 될덧} -->
                                <p>${board.bid }</p> 
                                <p class="boardList-contents-title">${board.board_title}</p>
                                <!-- {작성일자 여기다 넣으면 될 덧} -->
                                <p class="text-r">${board.board_createDate }</p>
                            </a>    
                            <!-- board.gettitle 요청 -->
                        </div>
                    </div>
                </c:forEach>
    
                <div class="boardList-write bg-main3">
                    글쓰기
                </div>
                <script>
                    $(document).ready(function (){
                        $('.boardList-write').on('click',function (){
                            location.href="/board/saveForm";
                        })
                    })
                </script>
                <div class="boardList-pagination">
                    <c:choose>
                        <c:when test="${boards.first }">
                            <div class="pagi-disabled"><a class="" href="?page=${boards.number-1 }">Previous</a></div>
                            <c:forEach var="i" begin="1" end="${boards.totalPages}">
                                <div class=""><a class="" href="?page=${i-1}">${i}</a></div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class=""><a class="" href="?page=${boards.number-1 }">Previous</a></div>
                            <c:forEach var="i" begin="1" end="${boards.totalPages}">
                                <div class=""><a class="" href="?page=${i-1}">${i}</a></li>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${boards.last}">
                            <div class="pagi-disabled"><a class="" href="?page=${boards.number+1 }">Next</a></div>
                        </c:when>
                        <c:otherwise>
                            <div class=""><a class="" href="?page=${boards.number+1 }">Next</a></div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </section>
	<%@ include file="/WEB-INF/views/headerFooter/footer.jsp"%>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
</body>
</html>