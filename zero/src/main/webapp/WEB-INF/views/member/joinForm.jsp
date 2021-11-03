<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="../headerFooter/header.jsp"%>
<div class="container">
	<form>
		<div class="form-group">
			<label for="member_id">ID</label> <input type="text" class="form-control" placeholder="Enter ID" id="member_id">
			<!-- <button id="btn-checkId" class="btn btn-primary">중복확인</button> -->
		</div>
		<div class="form-group">
			<label for="member_password">Password</label> <input type="password" class="form-control" placeholder="Enter password" id="member_password">
		</div>
		<div class="form-group">
			<label for="member_username">Username</label> <input type="text" class="form-control" placeholder="Enter Username" id="member_username">
		</div>
		<div class="form-group">
			<label for="member_address">Address</label> <input type="text" class="form-control" placeholder="Enter Address" id="member_address">
		</div>
		<div class="form-group">
			<label for="member_address_no">Address_no</label> <input type="text" class="form-control" placeholder="Enter Address number" id="member_address_no">
		</div>
		<div class="form-group">
			<label for="member_address_detail">Address_detail</label> <input type="text" class="form-control" placeholder="Enter Address detail" id="member_address_detail">
		</div>
		<div class="form-group">
			<label for="member_reference">Reference</label> <input type="text" class="form-control" placeholder="Enter Reference" id="member_reference">
		</div>
	</form>
	<button id="btn-save" class="btn btn-primary">회원가입</button>
</div>
<script src="/js/member.js"></script>

<%@ include file="../headerFooter/footer.jsp"%>



