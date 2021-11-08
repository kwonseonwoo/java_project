<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보 상세페이지</title>
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
	float: right;
	display: inline-block;
	position: relative;
	left: 550px;
}

.adminproductViewimg{
	padding: 83px 0;
}
</style>

</head>
<body>
<%@ include file="../../headerFooter/adminHeader.jsp"%>

	<div class="wrap">
		<section class="admin size-all bg-dg pd-20">
			<div class="size15 admin-title bg-main3 font-noto">
				<h3>관리자화면</h3>
				<h5>Administrator</h5>
			</div>
			<div class="size15 admin-box bg-dg">
				<div class="admin-tab">
					<div class="member-tab ad-untab">회원 관리</div>
					<div class="product-tab">상품 관리</div>
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
						<h5>상품 조회/수정</h5>
					</div>
					<div class="adminView-content adminView-member-content">
						<div class="adminView-member-left">
							<div>
								<p>상품 이름</p>
							</div>
							<div>
								<p>상품 가격</p>
							</div>
							<div>
								<p class="adminproductViewimg">상품 이미지</p>
							</div>
							<div>
								<p>이미지 수정</p>
							</div>
							<div>
								<p class="adminproductViewimg">상품 내용</p>
							</div>
							<div>
								<p>이미지 수정</p>
							</div>
							<div>
								<p>카테고리</p>
							</div>
							<div>
								<p>판매량</p>
							</div>
							<div>
								<p>등록일자</p>
							</div>
						</div>
						<form action="/admin/product/modify" method="post" enctype="multipart/form-data">
							<div class="adminView-member-right">
								<div>
									<p>
										<input type="text" name="product_name"
											value="${product.product_name}">
									</p>
								</div>
								<div>
									<p>
										<input type="text" name="product_price"
											value="${product.product_price}">
									</p>
								</div>
								<div>
									<p>
										<img src="/img/${product.product_img1 }" width="200"
											height="200">
									</p>
								</div>
								<div>
									<p>
										<input type="File" name="uploadFile">
									</p>
								</div>
								<div>
									<p>
										<img src="/img/${product.product_img2 }" width="200"
											height="200">
									</p>
								</div>
								<div>
									<p>
										<input type="File" name="uploadFile">
									</p>
								</div>
								<div>
									<p>
										<select name="product_type">
											<option value="주류/음료"
												<c:if test="${product.product_type == '주류/음료' }">selected</c:if>>주류/음료</option>
											<option value="간편요리"
												<c:if test="${product.product_type == '간편요리' }">selected</c:if>>간편요리</option>
											<option value="특별한 반찬"
												<c:if test="${product.product_type == '특별한 반찬' }">selected</c:if>>특별한 반찬</option>
											<option value="간식/간편식"
												<c:if test="${product.product_type == '간식/간편식' }">selected</c:if>>간식/간편식</option>
										</select>
									</p>
								</div>
								<div>
									<p>
										<input type="text" name="product_saleCount"
											value="${product.product_saleCount}" readonly="readonly">
									</p>
								</div>
								<div>
									<p>
										<input type="text" name="product_regDate"
											value='<fmt:formatDate pattern="yy/MM/dd" value="${product.product_regDate}" />'
											readonly="readonly">
									</p>
								</div>
							</div>
							<div class="adminView-button">
								<input type="hidden" name="product_no"
									value="${product.product_no}">
								<div>
									<input type="hidden" name="product_img1" value="${product.product_img1 }">
									<input type="hidden" name="product_img2" value="${product.product_img2 }">
									<input type="submit" value="수정">
								</div>
								<div>
									<input type="button" value="삭제"
										onclick="javascript: location.href='/admin/product/remove?product_no=${product.product_no}'">
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


	<script>
		$(document).ready(function() {

			$("#list").on("click", function(e) {
				e.preventDefault();
				location.href = "/admin/product/list";
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