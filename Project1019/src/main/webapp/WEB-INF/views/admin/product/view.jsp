<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보 상세페이지</title>

<style>

.button {
	float:right;
	display:inline-block;
	position:relative;
	left: 550px;
}

</style>

</head>
<body>

<form action="/admin/product/modify" method="post" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td>상품이름</td>
			<td><input type="text" name="product_name" value="${product.product_name}" ></td>

			<td>상품가격</td>
			<td><input type="text" name="product_price" value="${product.product_price}" ></td>
		</tr>
			
		<tr>
			<td>상품이미지</td>
			<td><img src="/img/${product.product_img }" width="200" height="200"></td>

			<td>이미지변경</td>
			<td><input type="File" name="uploadFile"></td>
			<td style="display:none"><input type="hidden" name="def_img" value="${product.product_img }"></td>
		</tr>

		<tr>
			<td>상품 카테고리</td>
			<td><select name="product_type">
				<option value="볶음" <c:if test="${product.product_type == '볶음' }">selected</c:if>>볶음</option>
				<option value="탕" <c:if test="${product.product_type == '탕' }">selected</c:if>>탕</option>
				<option value="술" <c:if test="${product.product_type == '술' }">selected</c:if>>술</option>
				<option value="선물" <c:if test="${product.product_type == '선물' }">selected</c:if>>선물</option>
			</select></td>
			<td>판매횟수</td>
			<td><input type="text" name="product_saleCount" value="${product.product_saleCount}" readonly="readonly"></td>
		</tr>

		<tr>
			<td>등록일자</td>
			<td><input type="text" name="product_regDate" value='<fmt:formatDate pattern="yy/MM/dd" value="${product.product_regDate}" />' readonly="readonly"></td>
		</tr>
		
		<tr class="button">
			<input type="hidden" name="product_no" value="${product.product_no}">
			<td><input type="submit" value="수정"></td>
			<td><input type="button" value="삭제"
					   onclick="javascript: location.href='/admin/product/remove?product_no=${product.product_no}'"></td>
			<td><input type="button" value="목록" id="list"></td>
		</tr>

	</table>
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<script>

$(document).ready(function(){
	
	$("#list").on("click", function(e){
		e.preventDefault();
		location.href="/admin/product/list";
	});

	
});

</script>

</body>
</html>