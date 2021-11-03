<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="../headerFooter/header.jsp"%>
<div class="container">
	<form>
	<input type="hidden" id="member_no" value="${principal.member.member_no }">
		<div class="form-group">
			<label for="member_id">ID</label> <input type="text"  value="${ principal.member.member_id }" class="form-control"  placeholder="Enter ID" id="member_id" readonly>
			<!-- <button id="btn-checkId" class="btn btn-primary">중복확인</button> -->
		</div>
		<div class="form-group">
			<label for="member_password">Password</label> <input type="password"  class="form-control" placeholder="Enter password" id="member_password">
		</div>
		<div class="form-group">
			<label for="member_username">Username</label> <input type="text" value="${ principal.member.member_username }" class="form-control" placeholder="Enter Username" id="member_username">
		</div>
		<div class="form-group">
			<label for="member_address">Address</label> <input type="text" value="${ principal.member.member_address}" class="form-control" placeholder="Enter Address" id="member_address">
		</div>
		<div class="form-group">
			<label for="member_address_no">Address_no</label> <input type="text" value="${ principal.member.member_address_no}" class="form-control" placeholder="Enter Address number" id="member_address_no">
		</div>
		<div class="form-group">
			<label for="member_address_detail">Address_detail</label> <input type="text" value="${ principal.member.member_address_detail}" class="form-control" placeholder="Enter Address detail" id="member_address_detail">
		</div>
		<div class="form-group">
			<label for="member_reference">Reference</label> <input type="text" value="${ principal.member.member_reference}" class="form-control" placeholder="Enter Reference" id="member_reference">
		</div>
	</form>
	<button id="btn-update" class="btn btn-primary">수정완료</button>
</div>
<script src="/js/member.js"></script>

<%@ include file="../headerFooter/footer.jsp"%>



