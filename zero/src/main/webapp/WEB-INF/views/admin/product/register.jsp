<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
		integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/main.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>

<div class="wrap">
<%@ include file="../../headerFooter/adminHeader.jsp"%>
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
						<h5>상품 등록</h5>
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
								<p>상품 이미지</p>
							</div>
							<div>
								<p>카테고리</p>
							</div>
							<div>
								<p>상품 내용</p>
							</div>
						</div>
						<form action="/admin/product/register" method="post" enctype="multipart/form-data">
							<div class="adminView-member-right">
								<div>
									<p>
										<input type="text" name="product_name" placeholder="상품 이름을 입력해주세요.">
									</p>
								</div>
								<div>
									<p>
										<input type="text" name="product_price" placeholder="상품 가격을 입력해주세요.">
									</p>
								</div>
								<div>
									<p>
										<input type="file" name="uploadFile">
									</p>
								</div>
								<div>
									<p>
										<select name="product_type">
											<option value="주류/음료">주류/음료</option>
											<option value="간편요리">간편요리</option>
											<option value="특별한 반찬">특별한 반찬</option>
											<option value="간식/간편식">간식/간편식</option>
										</select>
									</p>
								</div>
								<div>
									<p>
										<input type="file" name="uploadFile">
									</p>
								</div>
								<input type="hidden" name="product_saleCount" value="0">
							</div>
							
							<div class="adminView-button">
								<div>
									<input type="submit" value="등록">
								</div>
								<div>
									<input type="button" value="목록" onclick="javascript:location.href='/admin/product/list'">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<%@ include file="../../headerFooter/footer.jsp"%>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		

</body>
</html>