<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리 페이지</title>
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

<style>
table {
	text-align: center;
}

.reg {
	width:100px;
	margin-left: 580px;
	position:relative;
	top:-52px;
	left:220px;
}

.reg input{	
	padding: 8px;

}

.pagination {
	list-style: none;
	padding-left: 0px;
	width: 60%;
	margin: 20px auto;
	display: flex;
	justify-content: center;
}

.pagination li {
	margin: 0 10px;
}

.pagination li a {
	text-decoration: none;
	color: rgb(216, 190, 157);
}
</style>

</head>
<body>
	<%@ include file="../../headerFooter/header.jsp"%>
	<div class="wrap" id="wrap">
		<section class="admin size-all bg-dg pd-20">
			<div class="size15 admin-title bg-main3 font-noto">
				<h3>관리자화면</h3>
				<h5>Administrator</h5>
			</div>
			<div class="size15 admin-box bg-dg">
				<div class="admin-tab">
					<div class="member-tab ad-untab">회원 관리</div>
					<div class="product-tab ">상품 관리</div>
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
				
				<div class="adminList-box ad-memberList">
					<div class="adminList-search">
						<form id="searchForm" action="/admin/product/list" method="get">
							<select name='type' class="adminList-search-select pd-5">
								<option value=""
									<c:out  value="${pageMaker.cri.type==null?'selected':''}"/>>----</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>상품번호
								
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>상품이름</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>카테고리</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>상품번호
									or 상품이름</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>상품번호
									or 카테고리</option>
								<option value="TCW"
									<c:out value="${pageMaker.cri.type eq 'TCW'?'selected':''}"/>>상품번호
									or 상품이름 or 카테고리</option>
							</select> <input name='keyword' placeholder="검색" class="pd-5" type="text"
								value='<c:out value="${pageMaker.cri.keyword}"/>'> <input
								type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
							<input type='hidden' name='amount'
								' value='${pageMaker.cri.amount}'>
							<button class="adminList-search-button pd-5 bg-dg main-color2">Search</button>
						</form>
					</div>
					<div class="reg">
						<input type="button" value="상품 등록"
							onclick="javascript:location.href='/admin/product/register'">
					</div>
					<div class="adminList-table-title2 main-color2">
						<div>
							<p class="text-c">상품번호</p>
						</div>
						<div>
							<p class="text-c">상품이름</p>
						</div>
						<div>
							<p class="text-c">상품 이미지</p>
						</div>
						<div>
							<p class="text-c">상품 가격</p>
						</div>
						<div>
							<p class="text-c">카테고리</p>
						</div>
						<div>
							<p class="text-c">등록 일자</p>
						</div>
						<div>
							<p class="text-c">판매량</p>
						</div>
						<div>
							<p class="text-c">등록 관리</p>
						</div>
					</div>
					<div class="adminList-table-content2">
						<c:forEach items="${list }" var="product">
							<div>
								<p class="text-c">
									<c:out value="${product.product_no}"></c:out>
								</p>
							</div>
							<div>
								<p class="text-c">
									<c:out value="${product.product_name}"></c:out>
								</p>
							</div>
							<div>
								<img src="/img/${product.product_img1 }" width="150px"
									height="150px">
							</div>
							<div>
								<p class="text-c">
									<c:out value="${product.product_price}"></c:out>
									원
								</p>
							</div>
							<div>
								<p class="text-c">
									<c:out value="${product.product_type}"></c:out>
								</p>
							</div>
							<div>
								<p class="text-c">
									<fmt:formatDate value="${product.product_regDate}"
										pattern="yyyy-MM-dd" />
								</p>
							</div>
							<div>
								<p class="text-c">
									<c:out value="${product.product_saleCount}"></c:out>
								</p>
							</div>
							<div class="text-c adminList-button">
								<button class="white-button member_view" value="조회"
									onclick="javascript:location.href='/admin/product/view?product_no=${product.product_no}'">조회</button>
								<button class="red-button" value="삭제"
									onclick="javascript: location.href='/admin/product/remove?product_no=${product.product_no}'">삭제</button>
							</div>
						</c:forEach>
					</div>

					<ul class="pagination">

						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"
								aria-controls="dataTables-example" tabindex="0"
								id="dataTables-example_previous"><a
								href="${pageMaker.startPage -1}">이전</a></li>
						</c:if>

						<c:if test="!${pageMaker.prev}">
							<li class="paginate_button previous disabled"
								aria-controls="dataTables-example" tabindex="0"
								id="dataTables-example_previous"><a
								href="${pageMaker.startPage -1}">이전</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<c:if test="${num==pageMaker.cri.pageNum}">
								<li class="paginate_button active"
									aria-controls="dataTables-example" tabindex="0"><a
									href="${num}">${num}</a></li>
							</c:if>
							<c:if test="${num!=pageMaker.cri.pageNum}">
								<li class="paginate_button" aria-controls="dataTables-example"
									tabindex="0"><a href="${num}">${num}</a></li>
							</c:if>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"
								aria-controls="dataTables-example" tabindex="0"
								id="dataTables-example_next"><a
								href="${pageMaker.endPage + 1}">다음</a></li>
						</c:if>
					</ul>

				</div>
			</div>
		</section>

		<!-- <script>
               $(document).ready(function (){
                   $('.member-tab').on('click',function (){
                       $('.ad-memberList').removeClass('ad-off');
                       $('.ad-productList').addClass('ad-off');
                       $('.member-tab').removeClass('ad-untab');
                       $('.product-tab').addClass('ad-untab');
                   });
                  $('.product-tab').on('click',function (){
                       $('.ad-memberList').addClass('ad-off');
                       $('.ad-productList').removeClass('ad-off');
                       $('.member-tab').addClass('ad-untab');
                       $('.product-tab').removeClass('ad-untab');
                   });
               })
           </script> -->


	</div>

	<!-- 정보를 controller에 전달하기 위한 <form>태그 -->
	<form id="actionForm" action="/admin/product/list" method="get">
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
		<input type='hidden' name='type'
			value='<c:out value="${pageMaker.cri.type}"/>'> <input
			type='hidden' name='keyword'
			value='<c:out value="${pageMaker.cri.keyword}"/>'>
	</form>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script>

$(document).ready(function(e){
	
	var actionForm = $("#actionForm");
	
	/* 페이지 네비게이션 버튼 클릭시 */
	$('.paginate_button a').on("click",function(e){
		e.preventDefault();
		
		console.log('click');
		/* 클릭한 <a>태그의 페이지번호를 actionForm의 input tage 에 설정 val(값); */
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();//action으로 전송처리
		
	});
});

//검색 기능 구현을 위한 JS문
$(document).ready(function(){
	var searchForm=$("#searchForm");

	$("#searchForm button").on("click",function(e){
		if(!searchForm.find("option:selected").val()){
			alert("검색 조건을 선택하세요");
			return false;
		}
		
		if(!searchForm.find("input[name='keyword']").val()){
			alert("검색 키워드를 입력하세요");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
		
	});
	
});

</script>
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
<%@ include file="../../headerFooter/footer.jsp"%>