let index = {
	init: function() {
		$("#btn-save").on("click", () => {
			this.save();
		});
		$("#btn-login").on("click", () => {
			this.login();
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
		};
		$.ajax({
			type: "POST",
			url: "/zero/api/	member",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8"
		}).done(function(resp) {
			alert("회원가입 완료.");
			location.href = "/zero";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},
	login: function() {
		let data = {
			member_id: $("#member_id").val(),
			member_password: $("#member_password").val()
		};

		$.ajax({
			type: "POST",
			url: "/zero/api/member/login",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp) {
			alert("로그인이 완료되었습니다.");
			location.href = "/zero";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
	
	
}
index.init();