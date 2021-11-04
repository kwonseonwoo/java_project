<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세페이지</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
		integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/main.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<style>

.button {
	float:right;
	display:inline-block;
}

</style>

</head>
<body>
<%@ include file="../../headerFooter/header.jsp"%>
	<div class="wrap">
		<section class="admin size-all bg-dg pd-20">
			<div class="size15 admin-title bg-main3 font-noto">
				<h3>관리자화면</h3>
				<h5>Administrator</h5>
			</div>
			<div class="size15 admin-box bg-dg">
				<div class="admin-tab">
					<div class="member-tab tab">회원 관리</div>
					<div class="product-tab ad-untab">상품 관리</div>
				</div>
				
				<script>
					$(document).ready(function(){
						$('.member-tab').on('click', function(){
							location.href = "/admin/member/list";
						});
						$('.product-tab').on('click', function(){
							location.href = "/admin/product/list";
						});
					});
				</script>
				
				<div class="adminList-box">
					<div class="adminView-title">
						<h5>회원 정보/수정</h5>
					</div>
					<div class="adminView-content adminView-member-content">
						<div class="adminView-member-left">
							<div>
								<p>아이디</p>
							</div>
							<div>
								<p>이름</p>
							</div>
							<div>
								<p>우편번호</p>
							</div>
							<div>
								<p>주소</p>
							</div>
							<div>
								<p>상세주소</p>
							</div>
							<div>
								<p>참고항목</p>
							</div>
							<div>
								<p>가입일자</p>
							</div>
						</div>
						<form action="/admin/member/modify" method="post">
							<div class="adminView-member-right">
								<div>
									<p><input type="text" name="member_id" value="${member.member_id }" readonly="readonly"></p>
								</div>
								<div>
									<p><input type="text" name="member_username" value="${member.member_username }" readonly="readonly"></p>
								</div>
								<div>
									<p><input type="text" name="member_address_no" value="${member.member_address_no }"></p>
								</div>
								<div>
									<p><input type="text" name="member_address" value="${member.member_address }" ></p>
								</div>
								<div>
									<p><input type="text" name="member_address_detail" value="${member.member_address_detail }"></p>
								</div>
								<div>
									<p><input type="text" name="member_reference" value="${member.member_reference }"></p>
								</div>
								<div>
									<p><input type="text" name="member_regDate" value='<fmt:formatDate pattern="yy/MM/dd" value="${member.member_regDate }" />' readonly="readonly"></p>
								</div>
							</div>
							<div class="adminView-button">
								<input type="hidden" name="member_no"
									value="${member.member_no }">
								<div>
									<input type="submit" value="수정">
								</div>
								<div>
									<input type="button" value="삭제"
										onclick="javascript: location.href='/admin/member/remove?member_no=${member.member_no}'">
								</div>
								<div>
									<input type="button" value="목록" id="list">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<script>

$(document).ready(function(){
	
	$("#list").on("click", function(e){
		e.preventDefault();
		location.href="/admin/member/list";
	});

	
});

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		
<%@ include file="../../headerFooter/footer.jsp"%>
</body>
</html>