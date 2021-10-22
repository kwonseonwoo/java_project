<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 페이지</title>
</head>
<body>
<!-- 아이디, 이름, 주소, 가입일자 -->

<table border="1">
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>회원관리</th>
		</tr>
	</thead>
	
	
	<c:forEach items="${list }" var="member">
		<tr class="list">
			<td><c:out value="${member.member_id }"></c:out></td>
			<td><c:out value="${member.member_name }"></c:out></td>
			<td><c:out value="${member.member_address }"></c:out></td>
			<td><fmt:formatDate value="${member.member_regDate }" pattern="yyyy-MM-dd" /></td>
			<td><input type="button" class="member_view" value="조회"
					   onclick="javascript:location.href='/admin/member/view?member_no=${member.member_no}'">
			    <input type="button" value="삭제"
					   onclick="javascript: location.href='/admin/member/remove?member_no=${member.member_no}'"></td>
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