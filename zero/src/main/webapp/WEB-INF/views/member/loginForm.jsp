<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="../headerFooter/header.jsp"%>
<div class="container">
	<form action="/auth/loginProc" method="post">
		<div class="form-group">
			<label for="member_id">ID</label>
			 <input type="text" name="username"class="form-control" placeholder="Enter ID" id="member_id">
		</div>
		<div class="form-group">
			<label for="member_password">Password</label>
			 <input type="password" name="password" class="form-control" placeholder="Enter password" id="member_password">
		</div>
		<button id="btn-login" class="btn btn-primary">로그인</button>
	</form>
</div>

<%@ include file="../headerFooter/footer.jsp"%>



