let index = {
	init: function() {
		$("#btn-save").on("click", () => {
			this.save();
		});
		$("#btn-checkId").on("click",() => {
			this.checkId();
		});
		$("#btn-update").on("click", () => {
			this.update();
		});
	},

	save: function() {
		let data = {
			member_id: $("#member_id").val(),
			member_password: $("#member_password").val(),
			member_username: $("#member_username").val(),
			member_address: $("#member_address").val(),
			member_address_no: $("#member_address_no").val(),
			member_address_detail: $("#member_address_detail").val(),
			member_reference: $("#member_reference").val()
		};
		$.ajax({
			type: "POST",
			url: "/auth/joinProc",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8"
		}).done(function(resp) {
			alert("회원가입 완료.");
			location.href = "/main";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},
	
	update: function() {
		let data = {
			member_no: $("#member_no").val(),
			member_id: $("#member_id").val(),
			member_password: $("#member_password").val(),
			member_username: $("#member_username").val(),
			member_address: $("#member_address").val(),
			member_address_no: $("#member_address_no").val(),
			member_address_detail: $("#member_address_detail").val(),
			member_reference: $("#member_reference").val()
		};
		$.ajax({
			type: "PUT",
			url: "/member",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8"
		}).done(function(resp) {
			alert("회원수정 완료.");
			location.href = "/main";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},
	
	
	/*checkId: function() {
		let data = {
			member_id: $("#member_id").val()
		};
		$.ajax({
			type: "POST",
			url: "/api/checkId",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			success:function() {
				if(cnt != 1) {
					alert("사용 가능한 아이디")
				} else {
					alert("중복 사용 아이디")
				}
			},
			error:function() {
				alert("에러");
			}
		});
	}*/
	
	
}
index.init();