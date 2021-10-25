<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리 페이지</title>

<style>
table {
	text-align: center;
}

.reg {
	margin-left: 580px;
}
</style>

</head>
<body>

<div class="reg">
	<input type="button" value="상품 등록"
		   onclick="javascript:location.href='/admin/product/register'">
</div>

<table border="1">
	<thead>
		<tr>
			<th>상품번호</th>
			<th>이름</th>
			<th>이미지</th>
			<th>가격</th>
			<th>카테고리</th>
			<th>등록일자</th>
			<th>판매횟수</th>
			<th>상품관리</th>
		</tr>
	</thead>
	
	<c:forEach items="${list }" var="product">
		<tr class="list">
			<td><c:out value="${product.product_no}"></c:out></td>
			<td><c:out value="${product.product_name}"></c:out></td>
			<td><img src="/img/${product.product_img }" width="150px" height="150px"></td>
			<td><c:out value="${product.product_price}"></c:out>원</td>
			<td><c:out value="${product.product_type}"></c:out></td>
			<td><fmt:formatDate value="${product.product_regDate}" pattern="yyyy-MM-dd" /></td>
			<td><c:out value="${product.product_saleCount}"></c:out></td>
			<td><input type="button" class="member_view" value="조회"
					   onclick="javascript:location.href='/admin/product/view?product_no=${product.product_no}'">
			    <input type="button" value="삭제"
					   onclick="javascript: location.href='/admin/product/remove?product_no=${product.product_no}'"></td>
		</tr>
	</c:forEach>
	
	
</table>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>

/* 	$(document).ready(function(){
		
		var number = $(".list").find("input[name='member_no']").val();

		console.log(number);
		
		$(".member_view").on("click", function(){
			
			location.href= "/admin/member/view?member_no=" + number;
			
		});
		
	}); */

</script>

</body>
</html>