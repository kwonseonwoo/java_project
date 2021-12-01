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
    	<section class="size-all bg-dg board">
            <div class="size15 board-box">
                <c:if test="${board.member.member_no == principal.member.member_no }">
                    <a href="/board/${board.bid }/updateForm" class="btn btn-warning">수정</a>
                    <button id="btn-delete" class="btn btn-danger">삭제</button>
                </c:if>
                <div class="board-top">
                    <div class="board-top-info">
                        <div class="bti-info">
                            <div class="bti-num">글 번호 : <span id="bid" class="main-color2"><i>${board.bid}</span></i></div>
                            <div class="bti-name">작성자 : <span class="main-color2"><i>${board.member.member_id}</i></span></i></div>
                        </div>
                        <div class="board-back" onclick="history.back()">돌아가기</div>
                    </div>
                    <div class="board-top-contents">
                        <div class="board-top-title">
                            <h3 class="font-noto">${board.board_title}</h3>
                        </div>
                        <div class="board-top-content bg-dg">
                            <div>${board.board_content}</div>
                        </div>
                    </div>
                </div>
                <div class="board-bottom">
                    <form action="">
                    <input type="hidden" id="memberNo" value="${principal.member.member_no }"/>
                    <input type="hidden" id="boardId" value="${board.bid }">
                    <div class="board-bottom-write">
                        <div class="bbw-content">
                            <textarea id="reply-content" class="form_control" placeholder="글을 작성해 주세요"></textarea>
                        </div>
                        <div class="bbw-button-div">
                            <button type="button" id="btn-reply-save" class="bbw-button bg-main3">등록</button>
                        </div>
                    </div>
                    </form>
                </div>
                <br>
                <div class="board-reply">
                    <div class="board-reply-title font-noto">댓글 리스트</div>
                    <ul id="reply-box" class="brt-list">
                        <c:forEach var="reply" items="${board.replys }">
                            <li id="reply-${reply.id }" class="list-group-item">
                                <div>작성자 : ${reply.member.member_id } &nbsp;</div>
                                <div class="font-italic">${reply.reply_content }</div>
                                <button class="btn btn-danger" onclick="index.replyDelete(${board.bid}, ${reply.id })">삭제</button>
                                
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </section>
	<%@ include file="/WEB-INF/views/headerFooter/footer.jsp"%>
	</div>
	<script src="/js/board.js"></script>
	
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
