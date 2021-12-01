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
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>
	<div class="wrap" id="wrap">
	<%@ include file="/WEB-INF/views/headerFooter/header.jsp"%>
    	<section class="size-all bg-dg board">
            <div class="size15 board-box">
                <div class="buy-title">
                    <h2 class="font-noto">작성글 수정</h2>
                </div>
                <div class="board-insert-box font-noto">
                    <form action="" method="post">
                        <input type="hidden"  id="bid"  value="${board.bid }" />
                        <div class="board-insert-title">
                            <p class="main-color">제목</p>
                            <input value="${board.board_title }" type="text" class="board-insert-input" placeholder="Enter Title" id="board_title">
                        </div>
                        <div class="board-insert-content">
                            <p class="main-color">내용</p>
                            <textarea class="board-insert-input" rows="5" id="board_content">${board.board_content }</textarea>
                        </div>
                        <div class="board-insert-button">
                            <button id="btn-cancel" class="bib-cancel bg-c">취소</button>
                            <button id="btn-update" class="bib-insert bg-main3">글수정</button>
                        </div>
                    </form>
                </div>
            </div>
            <script>
                $('.summernote').summernote({
                    tabsize : 2,
                    height : 300
                });
                
                $(document).ready(function (){
                    $('#btn-cancel').on('click',function (e){
                        e.preventDefault();
                        history.go(-1);
                    });
                });
            </script>
            <script src="/js/board.js"></script>
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