<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
</head>
<body>

<form action="/admin/product/register" method="post" enctype="multipart/form-data">
	
	<table border="1">
		<tr>
			<th>상품이름</th>
			<td><input type="text" name="product_name" placeholder="상품 이름을 입력해주세요."></td>
		</tr>
		
		<tr>
			<th>상품가격</th>
			<td><input type="text" name="product_price" placeholder="상품 가격을 입력해주세요."></td>
		</tr>
		
		<tr>
			<th>상품 이미지</th>
			<td><input type="file" name="uploadFile"></td>
		</tr>
		
		<tr>
			<th width="100">상품 카테고리</th>
			<td><select name="product_type">
				<option value="볶음">볶음</option>
				<option value="탕">탕</option>
				<option value="술">술</option>
				<option value="선물">선물</option>
			</select></td>
		</tr>
		
			<input type="hidden" name="product_saleCount" value="0">
		
		<tr>
			<td><input type="submit" value="등록">
			<input type="button" value="목록"
				   onclick="javascript:location.href='/admin/product/list'"></td>
		</tr>
	</table>
	
</form>

</body>
</html>