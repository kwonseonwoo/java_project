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

.pagination {
	list-style: none;
	padding-left: 0px;
}

.pagination li {
	float:left;
}

.pagination li a {
	text-decoration: none;
	color: black;
}

</style>

</head>
<body>

<!-- 검색 기능 구현을 위한 <form>태그 -->
<div class="row">
	<div class="col-lg-12">
		<form id="searchForm" action="/admin/product/list" method="get">
  			<select name='type'>
  				<option value=""  <c:out  value="${pageMaker.cri.type==null?'selected':''}"/>>----</option>
  				<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>상품번호
  				<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>상품이름</option>
  	    		<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>카테고리</option>
  				<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>상품번호 or 상품이름</option>
  				<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>상품번호 or 카테고리</option>
  				<option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':''}"/> >상품번호 or 상품이름 or 카테고리</option>
  			</select>
  			<input name='keyword' type="text" value='<c:out value="${pageMaker.cri.keyword}"/>'>
  			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
  			<input type='hidden' name='amount'' value='${pageMaker.cri.amount}'>
  			<button class="btn btn-default">Search</button>
  		</form>

  	</div>
  		      
</div>

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

  	   <ul class="pagination">
  		      
  	      <c:if test="${pageMaker.prev}">
  	      	<li class="paginate_button previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
  		  	<a href="${pageMaker.startPage -1}">이전</a></li>
  	      </c:if>
  	       
  	      <c:if test="!${pageMaker.prev}">
  	      	<li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
  	      	<a href="${pageMaker.startPage -1}">이전</a></li>
  	      </c:if>
  		      
          <c:forEach var="num"  begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	  	  	<c:if test="${num==pageMaker.cri.pageNum}">
	  	       <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0">
	  	       <a href="${num}">${num}</a></li>
	 	    </c:if>
	 	       <c:if test="${num!=pageMaker.cri.pageNum}">
	 	       <li class="paginate_button" aria-controls="dataTables-example" tabindex="0">
	  	        <a href="${num}">${num}</a></li>
	  	       </c:if>
  	      </c:forEach>
  		      
  	    <c:if test="${pageMaker.next}">
        	<li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
        	<a href="${pageMaker.endPage + 1}">다음</a></li>
        </c:if>
       </ul>

	<!-- 정보를 controller에 전달하기 위한 <form>태그 -->
	<form id="actionForm" action="/admin/product/list" method="get">
 		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
 		<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
 		<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
 		<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
	</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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

</body>
</html>