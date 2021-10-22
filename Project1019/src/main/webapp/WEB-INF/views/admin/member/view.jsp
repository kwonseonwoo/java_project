<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세페이지</title>

<style>

.button {
	float:right;
	display:inline-block;
}

</style>

</head>
<body>

<!-- 아이디/이름 , 우편번호/주소, 상세주소/참고항목, 가입일자 -->
<form action="/admin/member/modify" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="member_id" value="${member.member_id }" readonly="readonly"></td>

			<td>이름</td>
			<td><input type="text" name="member_name" value="${member.member_name }" readonly="readonly"></td>
		</tr>
			
		<tr>
			<td>우편번호</td>
			<td><input type="text" name="member_address_no" value="${member.member_address_no }"></td>

			<td>주소</td>
			<td><input type="text" name="member_address" value="${member.member_address }" ></td>
		</tr>

		<tr>
			<td>상세주소</td>
			<td><input type="text" name="member_address_detail" value="${member.member_address_detail }"></td>

			<td>참고항목</td>
			<td><input type="text" name="member_reference" value="${member.member_reference }"></td>
		</tr>

		<tr>
			<td>가입일자</td>
			<td><input type="text" name="member_regDate" value='<fmt:formatDate pattern="yy/MM/dd" value="${member.member_regDate }" />' readonly="readonly"></td>
		</tr>
		
		<tr class="button">
			<input type="hidden" name="member_no" value="${member.member_no }">
			<td><input type="submit" value="수정"></td>
			<td><input type="button" value="삭제"
					   onclick="javascript: location.href='/admin/member/remove?member_no=${member.member_no}'"></td>
			<td><input type="button" value="목록" id="list"></td>
		</tr>
	</table>
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<script>

$(document).ready(function(){
	
	$("#list").on("click", function(e){
		e.preventDefault();
		location.href="/admin/member/list";
	});

	
});

</script>

</body>
</html>